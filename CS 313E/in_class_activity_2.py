class BeverageMachine:
    def __init__(self):
        self.state = "initial"  # Initialize the machine's state to 'initial'

    def start(self):
        while True:
            if self.state == "initial":
                self.display_request()  # Display initial message to the user
                user_input = input("Enter your choice: ")
                if user_input.lower() == "coffee":
                    self.state = "coffee"  # Transition to the coffee state
                elif user_input.lower() == "tea":
                    self.state = "tea"  # Transition to the tea state
                else:
                    print("Invalid choice. Please select 'coffee' or 'tea'.")

            elif self.state == "coffee":
                coffee = Coffee()  # Create a Coffee object
                coffee.brew()  # Brew coffee
                self.state = "initial"  # Return to the initial state after brewing

            elif self.state == "tea":
                tea = Tea()  # Create a Tea object
                tea.brew()  # Brew tea
                self.state = "initial"  # Return to the initial state after brewing

    def display_request(self):
        print("Welcome to the Fully Automatic Beverage Vending Machine!")
        print("Would you like coffee or tea?")
        print("Type 'coffee' for coffee or 'tea' for tea.")


class Coffee:
    def __init__(self):
        self.condiments = {"milk": 0, "sugar": 0}  # Initialize condiments for coffee

    def brew(self):
        print("Select your coffee type:")
        print("1. Espresso")
        print("2. Americano")
        print("3. Latte Macchiato")
        choice = int(input("Enter your choice (1/2/3): "))

        if choice == 1:
            self.add_condiments()  # Allow adding condiments for Espresso
            print("Brewing Espresso...")
        elif choice == 2:
            self.add_condiments()  # Allow adding condiments for Americano
            print("Brewing Americano...")
        elif choice == 3:
            self.add_condiments()  # Allow adding condiments for Latte Macchiato
            print("Brewing Latte Macchiato...")
        else:
            print("Invalid choice. Please select a valid coffee type.")

    def add_condiments(self):
        print("Add condiments (milk/sugar):")
        milk_units = int(input("Enter units of milk (0-3): "))
        sugar_units = int(input("Enter units of sugar (0-3): "))

        if 0 <= milk_units <= 3 and 0 <= sugar_units <= 3:
            self.condiments["milk"] = milk_units  # Set the milk units for coffee
            self.condiments["sugar"] = sugar_units  # Set the sugar units for coffee
        else:
            print("Invalid input. Condiment units must be between 0 and 3.")


class Tea:
    def brew(self):
        print("Select your tea type:")
        print("1. Black Tea")
        print("2. Green Tea")
        print("3. Yellow Tea")
        choice = int(input("Enter your choice (1/2/3): "))

        if choice == 1:
            print("Brewing Black Tea...")
        elif choice == 2:
            print("Brewing Green Tea...")
        elif choice == 3:
            print("Brewing Yellow Tea...")
        else:
            print("Invalid choice. Please select a valid tea type.")