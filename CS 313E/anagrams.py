# File: Anagrams.py
# Description: A program to group strings into anagram families
# Student Name: David Ariza
# Student UT EID: jda3867
# Course Name: CS 313E
# Unique Number: 52590
# Output: True or False
def are_anagrams(str1, str2):
    return sorted(str1.lower())==sorted(str2.lower())
# Input: lst is a list of strings comprised of lowercase letters only
# Output: the number of anagram families formed by lst
def anagram_families(lst):
    families=[]
    for i in range (len(lst)):
        for j in range(len(lst)):
            if are_anagrams(lst[i],lst[j]):
                root=sorted(lst[i].lower())
                if root not in families:
                    families.append(root)
                break
    return len(families)

def main():
# read the number of strings in the list
    num_strs = int(input())
# add the input strings into a list
    lst = []
    for i in range(num_strs):
        lst += [input()]
# compute the number of anagram families
    num_families = anagram_families(lst)
# print the number of anagram families
    print(num_families)
if __name__ == "__main__":
    main()
