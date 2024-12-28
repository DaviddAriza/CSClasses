weight_list = []
total = 0
for i in range(1,5):
    weight = float(input(f'Enter weight {i}:\n'))
    weight_list.append(weight)
    total += weight

ave = total/i
max = max(weight_list)

print('Weights:',weight_list)
print(f'\nAverage weight: {ave:.2f}')
print(f'Max weight: {max:.2f}')

loc = int(input('\nEnter a list location (1 - 4):\n'))

print(f'Weight in pounds: {weight_list[loc-1]:.2f}')
print(f'Weight in kilograms: {weight_list[loc-1]/2.2:.2f}')

weight_list.sort()

print('\nSorted list:',weight_list)
