from example_007_queue import Queue

class stack_adapter:

    def __init__(self):

        self.queue1 = Queue()

        self.queue2 = Queue()

 

    def push(self, item):
        self.queue1.enqueue(item)
# complete this method

 

    def pop(self):
        while self.queue1.size() != 1:
            tmp = self.queue1.dequeue()
            self.queue2.enqueue(tmp)
        stacktop = self.queue1.dequeue()
        while self.queue2.size() != 0:
            tmp = self.queue2.dequeue()
            self.queue1.enqueue(tmp)
        return stacktop
        
        
            
# complete this method

 

    def peek(self):
        while self.queue1.size() != 1:
            tmp = self.queue1.dequeue()
            self.queue2.enqueue(tmp)
        stacktop = self.queue1.dequeue()
        while self.queue2.size() != 0:
            tmp = self.queue2.dequeue()
            self.queue1.enqueue(tmp)
        self.queue1.enqueue(stacktop)
        return stacktop
    
    def __str__(self):
        return str(self.queue1)
# complete this method

def main():
    
    myq = stack_adapter()
    myq.push(1)
    myq.push(2)
    myq.push(3)
    print(f'Value popped: {myq.pop()}')
    print(f'Value peeked {myq.peek()}')
    print(f'Value popped: {myq.pop()}')
    print(myq)
if __name__ == "__main__":
    main()