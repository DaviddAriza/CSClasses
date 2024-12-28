def count_down(count):
    if count == 1:            
        print('Terminated..!')                  
    else:                        
        print(count)             
        count_down(count-1)        
count_down(5)