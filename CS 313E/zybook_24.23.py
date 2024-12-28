import random
import gv_die

# Create two GVDie objects
die1 = gv_die.GVDie()
die2 = gv_die.GVDie()

# Read random seed to support testing (do not alter) and starting credits
seed = int(input())
# Set the seed for random
random.seed(int(seed))

# Initial credits
credits = int(input())

# Type your code here.

die1.roll()
die2.roll()

dice_total = die1.get_value() + die2.get_value()

if dice_total == 7 or dice_total == 11:
    credits += 1
elif dice_total == 2 or dice_total == 3 or dice_total == 12:
    credits -= 1
else:
    goal = dice_total
    while dice_total != 2 and dice_total != 3 and dice_total != 11 and dice_total != 12:
        die1.roll()
        die2.roll()
        dice_total = die1.get_value() + die2.get_value()

        print('Dice total:',dice_total)

        if dice_total == 7:
            credits -= 1
            break

        elif dice_total == goal:
            credits +=1
            break

print('Dice total:',dice_total)
print('Credits:',credits)
