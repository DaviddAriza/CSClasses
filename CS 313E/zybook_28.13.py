def getRooster():
    playerDictionary = {}
    for player in range(1, 6):
        print(f'Enter player {player}\'s jersey number:')
        jersey = int(input())
        print(f'Enter player {player}\'s rating:')
        rating = int(input())
        playerDictionary[jersey] = rating
        print()
    return playerDictionary


def printOptions():
    print('\nMENU')
    print('a - Add player')
    print('d - Remove player')
    print('u - Update player rating')
    print('r - Output players above a rating')
    print('o - Output roster')
    print('q - Quit')
    option = input('\nChoose an option:\n').lower()
    return option


def addPlayer(player_dict):
    jersey = int(input('Enter a new player\'s jersey number:\n'))
    rating = int(input('Enter the player\'s rating: '))
    if jersey in player_dict:
        print(f'Jersey {jersey} already taken')
    else:
        player_dict[jersey] = rating


def deletePlayer(players_dict):
    jersey = int(input('Enter a jersey number:\n'))
    if jersey in players_dict:
        del players_dict[jersey]
    else:
        print(f'Jersey #{jersey} not found.')


def updateRating(players_dict):
    jersey = int(input('Enter a jersey number:\n'))
    if jersey in players_dict:
        rating = int(input('Enter a new rating for player:\n'))
        players_dict[jersey] = rating
    else:
        print(f'Jersey #{jersey} not found.')


def rosterAboveRating(players_dict):
    rating = int(input('Enter a rating:\n'))
    print('ABOVE', rating)
    for jersey, rat in (sorted(players_dict.items())):
        if rat >= rating:
            print('Jersey number: {}, Rating: {}'.format(jersey, rat))


def main():
    playerDictionary = getRooster()
    print('ROSTER')
    for jersey, rat in (sorted(playerDictionary.items())):
        print('Jersey number: {}, Rating: {}'.format(jersey, rat))
    option = ''
    while option != 'q':
        option = printOptions()
        if option == 'a':
            addPlayer(playerDictionary)
        elif option == 'd':
            deletePlayer(playerDictionary)
        elif option == 'u':
            updateRating(playerDictionary)
        elif option == 'r':
            rosterAboveRating(playerDictionary)
        elif option == 'o':
            for jersey, rat in (sorted(playerDictionary.items())):
                print('Jersey number: {}, Rating: {}'.format(jersey, rat))

main()