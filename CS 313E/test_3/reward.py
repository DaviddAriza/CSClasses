#  File: reward.py

#  Description: The ABC staff decides to find the minimum number of gifts as each customer's reward.
#  Student Name: David Ariza
#  Student UT EID: jda3867
#  Course Name: CS 313E
#  Unique Number: 52590

import sys

max_val = 1000


def getmin(prices, T):
# Add your code here!
	gifts_worth = int(0.1*T)
	m = len(prices)
	table = [[0 for i in range(gifts_worth + 1)]for i in range(m + 1)]
    
	for i in range(1, gifts_worth + 1):
		table[0][i] = 10**9 - 1
        
	for i in range(1, m + 1):
 
		for j in range(1, gifts_worth + 1):
			if (prices[i - 1] > j):
				table[i][j] = table[i - 1][j]
			else:
				table[i][j] = min(table[i - 1][j],table[i][j - prices[i - 1]] + 1)
 
	return table[m][gifts_worth]



if __name__ == "__main__":

	# Read input list of prices for each gift
	prices_str = sys.stdin.readline().split()
	prices = [ int(x) for x in prices_str ]

	# Read total price that the customer spends
	T = int(sys.stdin.readline())

	print(getmin(prices, T))
