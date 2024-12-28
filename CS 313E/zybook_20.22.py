def read_customer_data(filename):
    """Read and return data from filename as a list of lists (name, state, debt)"""
    names = []
    states = []
    debts = []

    with open(filename) as f:
        rows = f.readlines()
    for row in rows:
        row = row.split(',')
        names.append(row[0])
        states.append(row[1])
        debts.append(float(row[2].strip()))
    return names, states, debts

# Main portion of the program
if __name__ == '__main__':
    # number of rows to consider
    num_customers = int(input())

    names, states, debts = read_customer_data("CustomerData.csv")

    # Type your code here.

    debt_limiter = int(input())
    search_phrase = str(input())
    state_abbreviation = str(input())

    highest = 0
    i = 0
    while i<len(debts):
        if float(debts[i])>float(highest):
            highest=debts[i]
            Hname=names[i]
    i+=1  
        
    print('U.S. Report')
    print('Customers:',num_customers)
    print('Highest debt:',Hname)

