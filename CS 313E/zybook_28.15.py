class ItemToPurchase:
    def __init__(self, item_name='none', item_price=0, item_quantity=0, item_description='none'):
        self.item_name = item_name
        self.item_price = item_price
        self.item_quantity = item_quantity
        self.item_description = item_description

    def print_item_cost(self):
        print('{} {} @ ${} = ${}'.format(self.item_name, self.item_quantity, self.item_price,
                                          self.item_quantity * self.item_price))

    def print_item_description(self):
        print('{}: {}'.format(self.item_name, self.item_description))

class ShoppingCart:
    def __init__(self, customer_name='none', current_date='January 1, 2016'):
        self.customer_name = customer_name
        self.current_date = current_date
        self.cart_items = []

    def add_item(self, item):
        self.cart_items.append(item)

    def remove_item(self, item_name):
        found = False
        for item in self.cart_items:
            if item.item_name == item_name:
                self.cart_items.remove(item)
                found = True
        if not found:
            print('Item not found in cart. Nothing removed.')

    def modify_item(self, item):
        found = False
        for i, it in enumerate(self.cart_items):
            if it.item_name == item.item_name:
                self.cart_items[i].item_quantity = item.item_quantity
                found = True
        if not found:
            print('Item not found in cart. Nothing modified.')

    def get_num_items_in_cart(self):
        return sum(item.item_quantity for item in self.cart_items)

    def get_cost_of_cart(self):
        return sum(item.item_price * item.item_quantity for item in self.cart_items)

    def print_total(self):
        if not self.cart_items:
            print('SHOPPING CART IS EMPTY')
        else:
            print('{}\'s Shopping Cart - {}'.format(self.customer_name, self.current_date))
            print('Number of Items:', self.get_num_items_in_cart())
            print()
            total = 0
            for item in self.cart_items:
                item.print_item_cost()
                total += item.item_price * item.item_quantity
            print()
            print('Total: ${}'.format(total))

    def print_descriptions(self):
        if not self.cart_items:
            print('SHOPPING CART IS EMPTY')
        else:
            print('{}\'s Shopping Cart - {}'.format(self.customer_name, self.current_date))
            print()
            print('Item Descriptions')
            for item in self.cart_items:
                item.print_item_description()
            print()

def print_menu():
    print('MENU')
    print('a - Add item to cart')
    print('r - Remove item from cart')
    print('c - Change item quantity')
    print('i - Output items\' descriptions')
    print('o - Output shopping cart')
    print('q - Quit')

def execute_menu(choice, cart):
    while choice != 'q':
        if choice == 'a':
            print('ADD ITEM TO CART')
            name = input('Enter the item name:\n')
            description = input('Enter the item description:\n')
            price = float(input('Enter the item price:\n'))
            quantity = int(input('Enter the item quantity:\n'))
            item = ItemToPurchase(name, price, quantity, description)
            cart.add_item(item)
            choice = input('\nChoose an option:')
        elif choice == 'r':
            print('REMOVE ITEM FROM CART')
            name = input('Enter name of item to remove:\n')
            cart.remove_item(name)
            choice = input('\nChoose an option:')
        elif choice == 'c':
            print('CHANGE ITEM QUANTITY')
            name = input('Enter the item name:\n')
            choice = input('\nChoose an option:')
        elif choice == 'i':
            print('OUTPUT ITEMS\' DESCRIPTIONS')
            choice = input('\nChoose an option:')
        elif choice == 'o':
            print('OUTPUT SHOPPING CART')
            choice = input('\nChoose an option:')
        elif choice == 'q':
            break
        else:
            choice = input('\nChoose an option:')
    print()

def main():

    shopping_cart = ShoppingCart()

    shopping_cart.customer_name = input('Enter customer\'s name:\n')
    shopping_cart.current_date = input('Enter today\'s date:\n')

    print('\nCustomer name:',shopping_cart.customer_name)
    print('Today\'s date:',shopping_cart.current_date)
    print()
    print_menu()

    choice = input('\nChoose an option:')

    execute_menu(choice,shopping_cart)

if __name__ == "__main__":
    main()