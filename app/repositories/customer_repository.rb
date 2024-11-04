class CustomerRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @customers = [] # in-memory
    @next_id = 1

    load_csv if File.exist?(@csv_filepath)
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1

    save_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
    # @customers.select { |customer| customer.id == id }[0]
  end

  private

  def save_csv
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end

    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
