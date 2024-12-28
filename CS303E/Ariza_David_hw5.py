#David Ariza 2/22/2023
chicken_soup_ingredients = ['chicken','chicken broth','carrots','celery','noodles']
lasagna_ingredients = ['lasagna noodles','pasta sauce','ricotta']
grilled_cheese_ingredients = ['bread','butter','cheese']
garden_salad_ingredients = ['lettuce','tomatoes','carrots','olives']
davids_special_ingredients = ['tortilla','ground beef','tomatoes','lettuce','cheese']

chicken_soup_name = 'Chicken soup:'
lasagna_name = 'Lasagna:'
grilled_cheese_name = 'Grilled cheese:'
garden_salad_name = 'Garden salad:'
davids_special_name = 'David\'s special:'

grocery_list = []

def choice_function(recipe_choice):
    if recipe_choice == 'chicken soup':
        grocery_list.extend(chicken_soup_ingredients)
        print_recipe(chicken_soup_ingredients,chicken_soup_name)
        print_grocery_list()
    elif recipe_choice == 'lasagna':
        grocery_list.extend(lasagna_ingredients,lasagna_name)
        print_recipe(lasagna_ingredients)
        print_grocery_list()
    elif recipe_choice == 'grilled cheese':
        grocery_list.extend(grilled_cheese_ingredients)
        print_recipe(grilled_cheese_ingredients,grilled_cheese_name)
        print_grocery_list()
    elif recipe_choice == 'garden salad':
        grocery_list.extend(garden_salad_ingredients)
        print_recipe(garden_salad_ingredients,garden_salad_name)
        print_grocery_list()
    elif recipe_choice == 'david\'s special':
        grocery_list.extend(davids_special_ingredients)
        print_recipe(davids_special_ingredients,davids_special_name)
        print_grocery_list()

def print_recipe(recipe,recipe_name):
    print('\n'+recipe_name,end=' ')
    i = 0
    while i < len(recipe)-1:
        print(recipe[i], end=', ')
        i += 1
    print(recipe[len(recipe)-1])

def print_grocery_list():
    print('\nGrocery list:',end=' ')
    i = 0
    while i < len(grocery_list)-1:
        print(grocery_list[i], end=', ')
        i += 1
    print(grocery_list[len(grocery_list)-1])
        
def adding_extra_ingredients(ingredient):
    while ingredient != 'done':
        grocery_list.append(ingredient)
        ingredient = input('\nWould you like to add any other items to your grocery list? (enter \'Done\' when finished) ').lower()

def main():
    recipe_choice_1 = input('What would you like to make? (Choose: Chicken Soup, Lasagna, Grilled Cheese, Garden Salad, David\'s Special) ').lower()
    choice_function(recipe_choice_1)
    recipe_choice_2 = input('\nWhat else would you like to make? (Choose: Chicken Soup, Lasagna, Grilled Cheese, Garden Salad, David\'s Special) ').lower()
    choice_function(recipe_choice_2)
    extra_ingredient = input('\nWould you like to add any other items to your grocery list? (enter \'Done\' when finished) ').lower()
    adding_extra_ingredients(extra_ingredient)
    print_grocery_list()

if __name__ == '__main__':
    main()