# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      dispatch_action(user_choice)
    end
  end

  def display_menu
    puts 'Food Deliver 1.0'
    puts '1 - List all meals'
    puts '2 - Add a new meal'
    puts '3 - List all customers'
    puts '4 - Add a new customer'
    puts '5 - Exit'
  end

  def user_choice
    gets.chomp.to_i
  end

  def dispatch_action(user_choice)
    case user_choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop!
    else puts 'Try with a valid option'
    end
  end

  def stop!
    @running = false
  end
end
