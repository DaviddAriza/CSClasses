#made by David Ariza, Alex Garza, Anh-Thu Bui, and Lorena Chiles on April 7, 2023

import random

class Card:
  def __init__(self,s,v):
    self.suit = s
    self.value = v
  def __str__(self):
    if self.value < 11:
      val = str(self.value)
    elif self.value == 11:
      val = 'Jack'
    elif self.value == 12:
      val = 'Queen'
    elif self.value == 13:
      val = 'King'
    elif self.value == 14:
      val = 'Ace'
    return val + ' of ' + self.suit
  def get_value(self):
    if self.value < 11:
      score = self.value
    elif 11 <= self.value <= 13:
      score = 10
    elif self.value == 14:
      score = 11
    return score
      
class DeckOfCards:
  def __init__(self):
    self.deck = []
    suits = ['Diamonds','Clubs','Hearts','Spades']
    for s in suits:
      for i in range(2,15):
        self.deck.append(Card(s,i))
  def print(self):
    for card in self.deck:
      print(card)
  def shuffle(self):
    random.shuffle(self.deck)
  def draw(self):
    return self.deck.pop(0)
    
class Dealer:
  def __init__(self):
    self.name = 'Dealer'
    self.hand = []
  def __str__(self):
    return self.name + ': ' + str(self.hand[0]) + '; ' + str(self.hand[1])

class Player:
  def __init__(self,name,starting_money):
    self.name = name
    self.money = starting_money
    self.hand = []
  def __str__(self):
    return self.name + ': ' + str(self.hand[0]) + '; ' + str(self.hand[1])

def deal_round(players,dealer,card_deck):
  dealer.hand = []
  for player in players:
    player.hand = []
  for player in players:
    i = 0
    while i < 2:
      player.hand.append(card_deck.draw())
      i += 1
  t = 0
  while t < 2:
    dealer.hand.append(card_deck.draw())
    t += 1
  print(dealer)
  for player in players:
    print(player)

def get_winners(players,dealer):
  dealer_score = dealer.hand[0].get_value() + dealer.hand[1].get_value()
  for player in players:
    player_score = player.hand[0].get_value() + player.hand[1].get_value()
    if player_score < dealer_score:
      player.money -= 5
      print(player.name,'lost...',player.name,'now has ${}'.format(player.money))
    elif player_score == dealer_score:
      player.money = player.money
    elif player_score > dealer_score:
      player.money += 5
      print(player.name,'won!',player.name,'now has ${}'.format(player.money))

def main():
  new_deck = DeckOfCards()
  new_deck.shuffle()
  list_of_players = []
  new_dealer = Dealer()
  player_1 = Player('Sonia',100)
  player_2 = Player('Alex', 50)
  player_3 = Player('Alex G', 200)
  player_4 = Player('David', 200) 
  player_5 = Player('Lorena', 200)
  player_6 = Player('Anh-Thu', 200)
  list_of_players.append(player_1)
  list_of_players.append(player_2)
  list_of_players.append(player_3)
  list_of_players.append(player_4)
  list_of_players.append(player_5)
  list_of_players.append(player_6)
  deal_round(list_of_players,new_dealer,new_deck)
  get_winners(list_of_players,new_dealer)
  deal_round(list_of_players,new_dealer,new_deck)
  get_winners(list_of_players,new_dealer)


if __name__=='__main__':
  main()
