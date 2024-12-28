import random

class Turtle:
    def __init__(self,name):
        self.name = name
        self.speed = random.randint(1,10)
        self.max_distance = random.uniform(10,18)
        
    def __str__(self):
        return 'Turtle ' + str(self.name) + ' Speed ' + str(self.speed) + ' Max Distance: ' + str(self.max_distance)

class Race:
    def __init__(self,distance):
        self.distance = distance
    
    def __str__(self):
        return 'Race Distance: ' + str(self.distance)
    
    def start_race(self,racers):
        
        self.racer_list = []
        
        for i in range(racers):
            turtle = Turtle(i)
            self.racer_list.append(turtle)
            print(turtle)
    
    def get_winner(self):
        winner = ''
        max = self.racer_list[0]
        for turtle in self.racer_list:
            if turtle.max_distance > max.max_distance:
                max = turtle
        if max.max_distance < self.distance:
            winner = 'No winner'
        elif max.max_distance >= self.distance:
            for turtle in self.racer_list:
                if turtle.speed > max.speed and turtle.max_distance > self.distance:
                    winner = turtle
                winner = 'Winner: Turtle ' + str(turtle.name)
            winner = 'Winner: Turtle ' + str(max.name)
        return winner
            
def main():
    first_turtle_race = Race(15)
    print(first_turtle_race)
    first_turtle_race.start_race(5)
    print(first_turtle_race.get_winner())
    second_turtle_race = Race(15)
    second_turtle_race.start_race(8)
    print(second_turtle_race.get_winner())


if __name__=='__main__':
    main()