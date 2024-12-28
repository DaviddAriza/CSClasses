def is_prime():

    num = int(input('What is your number? '))
    
    div_by_2 = num % 2
    div_by_3 = num % 3
    div_by_5 = num % 5

    if div_by_2 == 0 and num != 2 or div_by_3 == 0 and num != 3 or div_by_5 == 0 and num != 5 or num == 0 or num == 1:
        print(num,'is not prime.')

    elif div_by_2 == 1 or 1 <= div_by_3 <= 2 or 1 <= div_by_5 <= 4:
        print(num,'is prime.')

def main():
    
    loop = 10
    for i in range(loop):
        is_prime()

if __name__ =='__main__':
    main()
    
