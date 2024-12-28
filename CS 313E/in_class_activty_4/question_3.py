from example_008_linked_list import LinkedList

 

class stack_adapter2:

    def __init__(self):

        self.list=LinkedList()

       

  

    def push(self, item):
        self.list.insert_last(item)
# complete this method

 

    def pop(self):
        x = str(self.list.first).split()
        j = int(x[-3])
        self.list.delete_link(j)
        return j
# complete this method

 

    def peek(self):
        x = str(self.list.first).split()
        j = int(x[-3])
        return j
    
    def __str__(self):
        return str(self.list)

# complete this method

def main():

    myq = stack_adapter2()
    myq.push(1)
    myq.push(2)
    myq.push(3)
    print(f'Value popped: {myq.pop()}')
    print(f'Value peeked: {myq.peek()}')
    print(f'Value popped: {myq.pop()}')
    print(myq)
    

if __name__ == "__main__":
    main()