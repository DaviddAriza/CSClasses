try:

    # Initialize variables to keep track of inputs and the maximum value

    num_inputs = 0

    max_value = None

    # Loop to read three integers

    for i in range(3):

        num = int(input())

        num_inputs += 1

        # Update the maximum value if necessary

        if max_value is None or num > max_value:

            max_value = num

    # Output the maximum value

    print(max_value)

except EOFError:

    # Handle missing inputs

    if num_inputs == 0:

        print("0 input(s) read:\nNo max")

    else:

        print(f"{num_inputs} input(s) read:\nMax is {max_value}")