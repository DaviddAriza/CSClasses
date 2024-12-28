# We have defined a class named Plant
class Plant:
    # __init__ acts as constructor for the class that is used to initialize the attributes.
    # self indicates the current calling object
    def __init__(self, plant_name, plant_cost):
        self.plant_name = plant_name
        self.plant_cost = plant_cost
        
    # print_info() method will print the details of the calling object in the required format.
    # It will print the plant name and its cost.
    def print_info(self,n):
        print('Plant',n,'Information:')
        print('   Plant name:',self.plant_name)
        print('   Cost:',self.plant_cost)


# We have defined a class named Flower that extends the Plant class.
class Flower(Plant):
    # __init__ acts as constructor for the class that is used to initialize the attributes.
    # self indicates the current calling object
    def __init__(self, plant_name, plant_cost, is_annual, color_of_flowers):
        Plant.__init__(self, plant_name, plant_cost)
        self.is_annual = is_annual
        self.color_of_flowers = color_of_flowers
        
    # print_info() method will print the details of the calling object in the required format.
    # It will print the plant name, cost, whether its annual plant or not and the color of the flowers.
    def print_info(self,n):
        print('Plant',n,'Information:')
        print('   Plant name:',self.plant_name)
        print('   Cost:',self.plant_cost)
        print('   Annual:',self.is_annual)
        print('   Color of flowers:',self.color_of_flowers)
 
# print_list() method prints all the details of the plant and flower objects in the my_garden list.
def print_list():
    n=1
    # First we traverse through the my_garden list which holds the plant and flower objects.
    for plant in my_garden:
        # Then we call the print_info() method for the respective object
        plant.print_info(n)
        n+=1
        # Finally we print a new line after printing the details of the object.
        print()
        
# Our program starts here from the main.
if __name__ == "__main__":
    # We declare an empty list named my_garden that will hold the plant and flower objects.
    my_garden = []
    
    # Next we prompt the user to enter the flower or plant details.
    # input() is used to get user input as a string.
    user_string = input()
    
    # We keep looping and get user input until the user enters -1.
    while user_string != '-1':
        # We split the string entered by the user to get the specifications of the plant or flower separately.
        # split() returns a list of strings with the user_string split whenever space occurs.
        # Example: "Hello world" when split returns ["Hello","world"]
        # The returned list is stored in a list named specifications.
        specifications = user_string.split()
        
        # If the string "Plant" is present in the user_string then we need to create a plant object.
        if("plant" in user_string):
            # Plant() is used to create an instance of the Plant class which is stored in variable named p.
            # specifications[1] will hold the plant name.
            # specifications[2] will hold the cost of the plant.
            p = Plant(specifications[1],specifications[2])
            # then we add the plant object to the my_garden list using the append()
            # append() adds the object to the end of the list.
            my_garden.append(p)
        # else if the "flower" string is present in the user_string then we create a Flower object.
        else:
            # Flower() is used to create an instance of the Flower class which is stored in variable named f.
            # specifications[1] will hold the plant name.
            # specifications[2] will hold the cost of the plant.
            # specifications[3] will hold a boolean value that checks whether the plant is annual or not.
            # specifications[4] will hold the color of the flower.
            f = Flower(specifications[1],specifications[2],specifications[3],specifications[4])
            # then we add the flower object to the my_garden list using the append()
            # append() adds the object to the end of the list.
            my_garden.append(f)
            
        # Then we prompt the user to enter the details of the next plant.
        user_string = input()
    # Atlast we call the print_list() method that will print the details of plant and flower objects in the my_garden list.
    print_list()