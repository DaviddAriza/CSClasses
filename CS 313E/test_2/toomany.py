#  File: toomany.py

#  Description: Each flower has to be inserted into one of the vases.
#				She wants to arrange the flower so that no more than two flowers of the same type
#				will be inserted in the same vase.
#				She wants to find out which type of flower will be left after her arrangement.

#  Student Name: David Ariza

#  Student UT EID: jda3867

#  Course Name: CS 313E

#  Unique Number: 86610

import sys


# Input: flower_list is a list of integers that represent the flower type.
#		 N is the number of vases
# Output: is a list of flower types that Jennifer bought too many (sorted)
def findTooMany(flower_list, N):
    type_frequency={}
    too_many=[]
    for i in flower_list:
        if i in type_frequency:
            type_frequency[i]+=1
        else:
            type_frequency[i]=1

    for flower,frequency in type_frequency.items():
        if frequency>N+1:
            too_many.append(flower)
    
    if len(too_many) >= 2:
        if too_many[0] > too_many[-1]:
            too_many[0],too_many[-1] = too_many[-1],too_many[0]
    
    return too_many

if __name__ == '__main__':

   # Read flower_list
   flower_list_str = sys.stdin.readline().split()
   flower_list = [ int(x) for x in flower_list_str ]

   # N: number of vases
   N = int(sys.stdin.readline())

   # output list of flower types. sorted.
   item_too_many_ls = findTooMany(flower_list, N)

   print(item_too_many_ls)