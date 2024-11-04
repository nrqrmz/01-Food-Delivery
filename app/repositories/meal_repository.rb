class MealRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @meals = [] # in-memory
    @next_id = 1

    load_csv if File.exist?(@csv_filepath)
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1

    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
    # @meals.select { |meal| meal.id == id }[0]
  end

  private

  def save_csv
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end

    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end
