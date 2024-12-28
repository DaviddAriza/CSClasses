class Drink:
    def __init__(self, n):
        self.name = n
    
class Coffee(Drink):
    def get_price(self):
        price = 1.1

    def __str__(self):
        return self.name

class Espresso(Drink):
    def get_price(self):
        price = 1.32

    def __str__(self):
        return self.name
    
class Cappuccino(Drink):
    def get_price(self):
        price = 1.52

    def __str__(self):
        return self.name + ': '
    
class Condiment:
    def __init__(self, q):
        self.quantity = q

class Sugar(Condiment):
    def get_price(self):
        price = self.quantity * .1

class Milk(Condiment):
    def get_price(self):
        price = self.quantity * .15
        
def main():

    first_choice_name = input('What beverage would you wish to make? [Regular Coffee, Espresso, Cappuccino] ').lower()
    while first_choice_name != 'regular coffee' and first_choice_name != 'espresso' and first_choice_name != 'cappuccino':
       first_choice_name = input('That\'s not a choice...\nWhat beverage would you wish to make? [Regular Coffee, Espresso, Cappuccino] ').lower()
    
    remaining_condiment = 3
    
    number_of_sugar = input('How much sugar would you like to add? [0-3] ')
    
    while number_of_sugar > 3 and number_of_sugar < 0:
        number_of_sugar = input('That\'s not a choice... How much sugar would you like to add? [0-3] ')

    remaining_condiment -= number_of_sugar

    number_of_milk = input('How much milk would you like to add? ')
    
    first_coffee = Drink(first_choice_name)

if __name__ == "__main__":
    main()