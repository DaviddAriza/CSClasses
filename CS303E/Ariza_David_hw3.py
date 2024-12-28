#David Ariza 2/5/2023

animal = input('Favorite animal? ')
for letter in animal:
    print(letter)


    
number = int(input('\nPick a number: '))
for x in range(number):
    print(x,end=' ')
print(number)



food = input('\nPick an option of soup, salad, or sandwich: ').lower()
while food != 'soup' and food != 'salad' and food != 'sandwich':
    print('\nSorry that\'s not an option!')
    food = input('\nPick an option of soup, salad, or sandwich: ').lower()
print('\nOk, you picked',food+'!')



shape = input('\nWhat shape would you like to draw? [Choose square, circle, or triangle] ').lower()
while shape != 'square' and shape != 'circle' and shape != 'triangle':
    print('\nSorry tha\'s not an option!')
    shape = input('\nWhat shape would you like to draw? [Choose square, circle, or triangle] ').lower()

repetition = int(input('\nHow many times would you like to draw your shape? [Pick a number] '))

import turtle
s = turtle.getscreen()
t = turtle

if shape == 'square':
    for x in range(repetition):

        i = 0
        while i <= 3:
            t.fd(100)
            t.lt(90)
            i += 1
        t.penup()
        t.fd(120)
        t.pendown()
    
        
        
elif shape == 'triangle':
    for x in range(repetition):
        
        i = 0
        while i <= 2:
            t.fd(100)
            t.lt(120)
            i += 1
        t.penup()
        t.fd(120)
        t.pendown()



elif shape == 'circle':
    for x in range(repetition):
        
        t.circle(50)
        t.penup()
        t.fd(120)
        t.pendown()

t.done()