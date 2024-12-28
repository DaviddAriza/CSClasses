class VendingMachine:
    def __init__(self):
        self.bottles = 20
        
    def purchase(self, amount):
        self.bottles = self.bottles - amount
      
    def restock(self, amount):
        self.bottles = self.bottles + amount
    
    def get_inventory(self):
        return self.bottles
        
    def report(self):
        print(f'Inventory: {self.bottles} bottles')

if __name__ == "__main__":

    vending_machine = VendingMachine()

    number_bottles_purchase = int(input())
    number_bottes_restock = int(input())

    vending_machine.purchase(number_bottles_purchase)

    vending_machine.restock(number_bottes_restock)

    vending_machine.report()