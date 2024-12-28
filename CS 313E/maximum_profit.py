"""
In-Class Activity 0 solution
Class: C S 313E: Elements of Software Engineering
Run: 
python3 change_values.py < input.txt
3 1 0 3
"""

import sys

# Add Your functions here
def max_profit(money, prices, increase):
    """ Finds the maximum profit """
    n = len(prices)

    houses = list(zip(prices, increase))

    houses.sort(key=lambda x: x[1], reverse=True)

    total_profit = 0

    for i in range(n):
        if houses[i][0] <= money:
            money -= houses[i][0]
            total_profit += houses[i][0]*houses[i][1]

    return total_profit*.01
# You are allowed to change the main function.

# Do not change the template file name.

def main():
    """A main function to read input data.
    No need to change this function 
    But feel free to change this if needed. 
    """
    # The first line is the amount of investment in million USD which is an integer number.
    line = sys.stdin.readline()
    line = line.strip()
    money = int(line)


# The second line includes an integer number which is the number of houses listed for sale.
    line = sys.stdin.readline()
    line = line.strip()


    # The third line is a list of house prices in million dollar.
    line = sys.stdin.readline()
    line = line.strip()
    prices = line.split(",")
    for i in range(0, len(prices)):
        prices[i] = int(prices[i])



    # read the number of vertices
    line = sys.stdin.readline()
    line = line.strip()
    increase = line.split(",")
    for i in range(0, len(increase)):
        increase[i] = float(increase[i])



# Add your implementation here ....
    result =  max_profit(money, prices, increase)

# Add your functions and call them to generate the result.

    print(f'{result:.2f}')

main()
