#David Ariza 3/12/2023
def get_average(list_of_num):
  total = 0
  for i in list_of_num:
    total = total + i
  avg = total
  avg = avg/len(list_of_num)
  avg = round(avg)
  return avg
  
def main():
  numbers = ['one','two','three']
  try:
    print(get_average(number))
  except NameError as err:
    print('Error message:',err)
  greeting = 'Hello World'
  try:
    for i in range(len(greeting)+1):
      print(greeting[i])
  except IndexError as err:
    print('Error message:',err)
  numbers = []
  try:
    print(get_average(numbers))
  except ZeroDivisionError as err:
    print('Error message:',err)
  try:
    print(numbers[10])
  except IndexError as err:
    print('Error message',err)
  try:
    color = int(input('Enter your favorite color: '))
  except ValueError as err:
    print('Error message:',err)

  
if __name__=="__main__":
  main()
