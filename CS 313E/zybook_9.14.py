data = input()
lst = data.split(' ')

wages = int(lst[0])
taxable_interest = int(lst[1])
unemployment_compensation = int(lst[2])
relationship_status = int(lst[3])
taxes = int(lst[4])

agi = wages + taxable_interest + unemployment_compensation
if agi < 120000:

    if relationship_status == 1:
        deduction = 12000
    elif relationship_status == 2:
        deduction = 24000
    elif relationship_status != 1 or relationship_status != 2:
        relationship_status = 1
        deduction = 12000

    taxable_income = agi - deduction

    if taxable_income < 0:
        taxable_income = 0
    
    if relationship_status == 1:
        if taxable_income <= 10000:
            federal_tax = .1*taxable_income
        elif 10000 < taxable_income <= 40000:
            federal_tax = 1000 + .12*(taxable_income-10000)
        elif 40000 < taxable_income <= 85000:
            federal_tax = 4600 + .22*(taxable_income-40000)
        elif taxable_income > 85000:
            federal_tax = 14500 + .24*(taxable_income-80000)
    elif relationship_status == 2:
        if taxable_income <= 20000:
            federal_tax = .1*taxable_income
        elif 20000 < taxable_income <= 80000:
            federal_tax = 2000 + .12*(taxable_income-20000)
        elif 80000 < taxable_income:
            federal_tax = 9200 + .22*(taxable_income-80000)

    tax_due = int(federal_tax) - taxes  

    print(f'AGI: ${agi:,}')
    print(f'Deduction: ${deduction:,}')
    print(f'Taxable income: ${taxable_income:,}')
    print(f'Federal tax: ${round(federal_tax):,}')
    
    if tax_due < 0:
        print(f'Tax refund: ${abs(tax_due):,}')
    elif tax_due >= 0:
        print(f'Taxes Owed: ${tax_due:,}')


else:
    print(f'AGI: ${agi:,}')
    print('Error: Income too high to use this form')


