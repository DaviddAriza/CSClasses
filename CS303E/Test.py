import random

class Turtle:
    def __init__(self,name):
        self.name = str(name)
        self.speed = str(random.randint(1,10))
        self.max_distance = str(random.uniform(10,20))
        
    def __str__(self):
        return 'Turtle ' + self.name + ' Speed ' + self.speed + ' Max Distance: ' + self.max_distance
    
turtle_1 = Turtle(0)
print(turtle_1)


racer_list = ['f','k','a']
print(len(racer_list)-1)

for i in range(3):
    print(i)