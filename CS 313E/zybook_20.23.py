# Step 0: Input values
nums = [int(n) for n in input().split()]

# Step 1: Find minimumimum and maximumimum values
# Type your code here.
max_num = nums[0]
for num in nums:
    if num > max_num:
        max_num = num

min_num = nums [0]
for num in nums:
    if num < min_num:
        min_num = num

# Step 2: Calculate mean
# Type your code here.
total = 0
for num in nums:
    total += num
mean = total/len(nums)

# Step 3: Check if palindrome
# Type your code here.
i = 0
while i < len(nums):
    if nums[0+i] == nums[-1-i]:
        palindrome = True
    else:
        palindrome = False
    i+=1
        
# Sort list
nums.sort()

# Step 4: Find and output median
# Type your code here.
if len(nums)%2 == 0:
    median = (nums[(len(nums)//2)-1] + nums[len(nums)//2])/2
elif len(nums)%2 == 1:
    median = nums[len(nums)//2]

# Step 5: Find and output mode
# Type your code here.
t = 0
tracker = 0
while t < len(nums)-1:
    if nums[0+t] == nums[1+t]:
        tracker+=1
        mode = nums[tracker]   
    t+=1


print('Minimum:',min_num)
print('Maximum:',max_num)
print(f'Mean: {mean:.1f}')
print('Palindrome:',palindrome)
print(f'Median: {median:.1f}')
print('Mode:',mode)