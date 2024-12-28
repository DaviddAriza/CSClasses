import sys

def spelling_test(s, l):
    return spelling_test_helper(s, l)

def spelling_test_helper(s, l):
    if s.strip() == '':
        return True

    if len(l) == 0:
        return False

    if l[0] in s:
        s = s.replace(l[0], ' ')
        
    return spelling_test_helper(s, l[1:])
def main():
    s = input()
    lines = sys.stdin.readlines()

    print(spelling_test(s, [line.replace('\n', '') for line in lines]))

if __name__ == "__main__":
    main()