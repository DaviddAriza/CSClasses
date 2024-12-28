def calc_AGI(wages, interest, unemployment):
    agi = abs(wages + interest + unemployment)
    return agi

# Calculate deduction depending on single, dependent or married
def get_deduction(status):
    if status == 0:
        deduction = 6000
    elif status == 1:
        deduction = 12000
    elif status == 2:
        deduction = 24000
    else:
        deduction = 6000
    return deduction

# Calculate taxable but not allow negative results
def calc_taxable(agi, deduction):
    tax_income = agi - deduction
    if tax_income < 0:
        tax_income = 0
    return tax_income

# Calculate tax for single or dependent
def calc_tax(status, taxable):
    federal_tax = 0
    if status == 0 or status == 1:
        if taxable <= 10000:
            federal_tax = .1*taxable
        elif 10000 < taxable <= 40000:
            federal_tax = 1000 + .12*(taxable-10000)
        elif 40000 < taxable <= 85000:
            federal_tax = 4600 + .22*(taxable-40000)
        elif taxable > 85000:
            federal_tax = 14500 + .24*(taxable-85000)
    elif status == 2:
        if taxable <= 20000:
            federal_tax = .1*taxable
        elif 20000 < taxable <= 80000:
            federal_tax = 2000 + .12*(taxable-20000)
        elif 80000 < taxable:
            federal_tax = 9200 + .22*(taxable-80000)
    return federal_tax

# Calculate tax due and check for negative withheld
def calc_tax_due(tax, withheld):
    if withheld < 0:
        withheld = 0
    tax_due = tax - withheld
    return tax_due

if __name__ == '__main__':
    # Step #1: Input wages, interest, unemployment, status, withheld
    data = input()
    lst = data.split(' ')

    wages = int(lst[0])
    interest = int(lst[1])
    unemployment = int(lst[2])
    status = int(lst[3])
    taxes = int(lst[4])


    # Step $2: Calculate AGI
    agi = calc_AGI(wages, interest, unemployment)
    deduction = get_deduction(status)
    tax_income = calc_taxable(agi, deduction)
    federal_tax = int(calc_tax(status, tax_income))
    tax_due = calc_tax_due(federal_tax, taxes)

    print(f'AGI: ${agi:,}')
    print(f'Deduction: ${deduction:,}')
    print(f'Taxable income: ${tax_income:,}')
    print(f'Federal tax: ${federal_tax:,}')
    print(f'Tax due: ${tax_due:,}')