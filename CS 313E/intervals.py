"""
  File: intervals.py
  Description: Sort and remove intersecting Tuples

  Student Name:Benjamin Ye
  Student UT EID:by3768

  Partner Name: David Ariza
  Partner UT EID: jda3867

  Course Name: CS 313E
  Unique Number: 52590
  Date Created:09/04/2023
  Date Last Modified: 9/6/2023

"""
import sys

def merge_tuples(tuples_list):
    """Merge the tuples"""
    merged_lst = sorted(tuples_list)
    copycat = []
    copycat.append(merged_lst[0])
    for tupes in merged_lst:
        curt_tup = copycat[-1]
        if tupes[0] <= curt_tup[1]:
            new_large = max(curt_tup[1], tupes[1])
            copycat[-1] = (curt_tup[0], new_large)
        else:
            copycat.append(tupes)

    return copycat


def sort_by_interval_size(tuples_list):
    """
    Input: tuples_list is a list of tuples of denoting intervals
    Output: a list of tuples sorted by ascending order of the
    size of the interval if two intervals have the size then it will sort by the
    lower number in the interval
    """
    diff_keeper = []
    for tupes in (tuples_list):
        diffen = abs(tupes[0]-tupes[1])
        diff_keeper.append((diffen, tupes))
        diffen = 0
    diff_keeper = sorted(diff_keeper)
    diff_keeper = [x[-1] for x in diff_keeper]
    return diff_keeper

def main():
    """
    Open file intervals.in and read the data and create a list of tuples
    """
    sys.stdin.readline()

    tup_list = []
    tup_list = sys.stdin.readlines()

    tuples_list = []
    for m_tuple in tup_list:
        tup = m_tuple.split()
        tuples_list.append((int(tup[0]), int(tup[1])))

    # merge the list of tuples
    merged = merge_tuples(tuples_list)

    # sort the list of tuples according to the size of the interval
    sorted_merge = sort_by_interval_size(merge_tuples(tuples_list))

    # write the output list of tuples from the two functions
    print(merged)
    print(sorted_merge)


if __name__ == "__main__":
    main()
  