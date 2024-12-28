#David Ariza 2/20/2023
def add_space_and_capitalize(word):
  new_word = ''
  for letter in word:
    new_word += letter.upper() + ' '
  return new_word
  
def accrue_interest(loan_amount):
  loan_balance = loan_amount
  loan_interest = .06 * loan_amount
  loan_balance += loan_interest
  return loan_balance

def make_payment(loan_balance,payment_amount):
  remaining_balance = 0
  if loan_balance <= payment_amount:
    print('Paid Off!')
  else:
    remaining_balance = loan_balance - payment_amount
    print('Paid ${:.2f}'.format(payment_amount))
  return remaining_balance

def display_balance(loan_balance):
  print('Current Balance: ${:.2f}'.format(loan_balance))

def main():
  big_text = 'finance'
  print(add_space_and_capitalize(big_text))
  loan = 12000
  display_balance(loan)
  loan = accrue_interest(loan)
  display_balance(loan)
  loan = make_payment(loan,2000)
  display_balance(loan)
  loan = accrue_interest(loan)
  display_balance(loan)
  loan = make_payment(loan,12000)
  display_balance(loan)
  
if(__name__=="__main__"):
  main()
