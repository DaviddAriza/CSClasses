#David Ariza
import random
x = random.randint(1,100)

guess = int(input('\nWhat is your guess? [1-100] '))
total_guesses = 0

while guess != x:
    
    total_guesses += 1

    if 0 < guess < x:
        print('\n'+str(guess),'is too low. Try again.')
        guess = int(input('\nWhat is your guess? [1-100] '))
    elif 101 > guess > x:
        print('\n'+str(guess),'is too high. Try again.')
        guess = int(input('\nWhat is your guess? [1-100] '))
    elif guess <= 0 or guess >= 101:
        print('\n'+str(guess),'is not between 1 and 100. Try again.')
        guess = int(input('\nWhat is your guess? [1-100] '))
   
if guess == x and total_guesses != 0:
    total_guesses += 1
    print('\n'+str(guess),'is correct! It took you',total_guesses,'guesses.')

#This is if the user gets the guess on the first try.

elif guess == x and total_guesses == 0:
    total_guesses += 1
    print('\n'+str(guess),'is correct! It took you',total_guesses,'guess.')