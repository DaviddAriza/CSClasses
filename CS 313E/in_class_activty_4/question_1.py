from example_006_stack import Stack

class queue_adapter:

    def __init__(self):

        self.stack1=Stack()

        self.stack2=Stack()

 

    def enqueue(self, item):
        self.stack1.push(item)
        
# complete this method

    def dequeue(self):
    
        while not self.stack1.is_empty():
            self.stack2.push(self.stack1.pop())
        tmp = self.stack2.pop()
        while not self.stack2.is_empty():
            self.stack1.push(self.stack2.pop())
        return tmp

# complete this method
    def __str__(self):
        return str(self.stack1)
    
def main():
    """A main function to demonstrate the Stack functions."""

    myq = queue_adapter()
    myq.enqueue(1)
    myq.enqueue(2)
    myq.enqueue(3)
    print(f'Value dequed: {myq.dequeue()}')
    print(f'Value dequed: {myq.dequeue()}')
    print(myq)

if __name__ == '__main__':
    main()