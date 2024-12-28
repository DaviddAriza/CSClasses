class Team:
    def __init__(self):
        self.name = 'none'
        self.wins = 0
        self.losses = 0

    # TODO: Define get_win_percentage()
    def get_win_percentage(self):
        self.win_percentage = self.wins / (self.wins + self.losses)
        return self.win_percentage
    
    # TODO: Define print_standing()
    def print_standing(self):
        win_percentage = self.get_win_percentage()
        print(f'Win percentage: {win_percentage:.2f}')
        if 1 >= win_percentage >= .5:
            print('Congratulations, Team',self.name,'has a winning average!')
        elif .5 > win_percentage > 0:
            print('Team',self.name,'has a losing average.')

if __name__ == "__main__":
    team = Team()
   
    user_name = input()
    user_wins = int(input())
    user_losses = int(input())
    
    team.name = user_name
    team.wins = user_wins
    team.losses = user_losses

    team.print_standing()