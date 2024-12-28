def max_word_length(words_list):
  max_word_length = 0 
  for word in words_list:
    if len(word) > max_word_length:
      max_word_length=len(word)  
  return  max_word_length

def frame_this(list_of_words):
  max_length = max_word_length(list_of_words)
  
  frame = '*' * (max_length + 4)
    
  print(frame)

  for word in list_of_words:
    spaces_needed = max_length - len(word)
    left_space_needed=spaces_needed//2
    right_space_needed=spaces_needed - left_space_needed
    print('* ' + ' ' * left_space_needed + word + ' ' * right_space_needed + ' *')
  
  print(frame)

def is_prime(num):
  
  prime = True
  
  if(num == 0 or num == 1):
    prime = False
  
  for i in range(2,num):
    if(num %i == 0):
      prime = False
  
  return prime  

def count_primes(list_of_numbers):

  number_of_primes = 0
  
  for num in list_of_numbers:
    if is_prime(num):     
      number_of_primes += 1

  return number_of_primes
  
def make_list(string_of_text):
  word_list = string_of_text.split(', ')
  
  return word_list 

def main():
  team_names = ['David','Lauren','Claudia']

  frame_this(team_names)
  
  # -------------do not change anything below this line----------#
  words_to_split = 'one, two, three, four hundred'
  words_list = make_list(words_to_split) # should result in the list ['one','two','three','four hundred']
  frame_this(words_list)
  numbers = [1,9,0,2,3,17,6,25,4,5,11,14]
  print('The list of numbers',numbers,'has',count_primes(numbers),'primes.')
  
if __name__=="__main__":
  main()