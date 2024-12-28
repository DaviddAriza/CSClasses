#David Ariza 1/22/2023

#Sorry in advance to whoever has to grade my assignment. 
#I wanted to be creative and make complex interactive story, but I didn't realize just how much code would end up going into it especially since I don't know how to loop an input or create a function yet.
#If it helps, the layer of the indentation is the order the question is asked.
#So the first line on the left of the screen going down the page is the first input, the second line is the second input and so on and so forth.
#   |   |   |   |   |
#   |   |   |   |   |
#   |   |   |   |   |   <---- The lines going down like so are what I am talking about
#Also I left comments where each ending can be found.

run_program = input('\nWould you like to play my interactive escape game?\n[Choose yes or no] ')
if(run_program.lower() == 'yes' or run_program.lower() == 'no'):

#This is the opening paragraph of the story.

    print('''
If you picked "no"... Too bad, you are still forced to play. :)
        
    A bright light slowly creeps into your eyes as you slowly gain conscious and regain feeling throughtout your body. You feel dazed and dehydrated along with a sheering pain on you right ankle
where blood has drenched the cuff of your pants. It appears that you are on the ground with one arm handcuffed to a pipe in some kind of basement that contains various tools used for construction and woodwork.
You notice a screwdriver on top of a nearby table along with other tools and you also notice that the door for the basement is slightly opened.''')

    print('\nWhat do you do?','\n1 - Scream for help!','2 - Attempt to grab the screwdriver.','3 - Check your pockets.','4 - Do absolutely nothing.',sep='\n')
    
    answer_1 = input('\n[Choose a number 1-4] ')
    
    if(answer_1 == '1'):
        print('\nYou scream at the top of your lungs for help.','\nCrickets... I don\'t think anybody heard you...',sep='\n')
        print('\nWhat do you do next?','\n1 - Attempt to grab the screwdriver.','2 - Check your pockets.','3 - Scream again.',sep='\n')
        answer_2 = input('\n[Choose a number 1-3] ')
        if(answer_2 == '1'):
            print('\nYou reach as far as you can but the screwdriver is still too far away.','You attempt to stand up from ground but your ankle screams at you in pain.',sep='\n')
            print('\nWhat do you do next?','\n1 - Check your pockets.','2 - Scream again.',sep='\n')
            answer_3 = input('\n[Choose a number 1-2] ')
            
            

            #The function grouped below is the branch for checking your pockets.
            
            if(answer_3 == '1'):
                print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
                number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
                #FYI: 112 is the emergency number outside the US
                if(number_called == 911 or number_called == 112):
                    print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
                    thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                    if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                        print('\n'+thank_the_cop,'for saving my life officer!')
                        print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the smart ending
                    else:
                        print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                        #This is the silly ending
                elif(number_called != 911 or number_called != 112):
                    print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
                    number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
                    if(number_called_2 == 911 or number_called_2 == 112):
                        print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                        thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                        if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                            print('\n'+thank_the_cop,'for saving my life officer!')
                            print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                            #This is the smart ending
                        else:
                            print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                            #This is the silly ending
                    else:
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.
                else:
                    print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
            
            
            
            #The function grouped below is for if you scream at least twice.
            
            elif(answer_3 == '2'):
                print('\nYou scream again but this time significantly louder than before.','\nNothing happens... or so you think. After a few minutes a cat pokes it\'s head out of the door and slowly walks down the basement stairs towards you.',sep='\n')
                print('The cat sits down a few feet away from you, looking at you with a playful curiosity.','\nWhat do you next?','\n1 - Beckon the cat over to you.','2 - Somehow convince the cat to grab the screwdriver.','3 - Scream again for no particularly reason.',sep='\n')
                answer_4 = input('\n[Choose a number 1-3] ')
                if(answer_4 == '1'):
                    print('\nYou beckon the cat towards you...','\nThe cat quietly moves to you and begins cuddling with you and purring as you pet it. You get the bright idea to tear a piece of fabric off you shirt and throw it on the table with the screwdriver.','The cat follows the fabric and jumbs on the table knocking a bunch of tools on the ground including the screwdriver.',sep='\n')
                    print('\nWhat do you do next?','\n1 - Grab the screwdriver.','2 - Scream again for no particular reason.',sep='\n')
                    answer_5 = input('\n[Choose a number 1-2] ')
                    if(answer_5 == '1'):
                        print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                        print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                        answer_6 = input('\n[Choose a number 1-2] ')
                        if(answer_6 == '1'):
                            print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                            print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                            #This is a failed ending.                      
                        elif(answer_6 == '2'):
                            print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                            print('\nCongrats you have you achieved the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                            #This is the sneaky ending.
                        else:
                            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')             
                    elif(answer_5 == '2'):
                        print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.
                    else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                elif(answer_4 == '2'):
                    print('\nYou wave your hands and point at the screwdiver...','\nThe cat just looks at you as if it was confused. You realize that the cat doesn\'t understand',sep='\n')
                    print('\nWhat do you do next?','\n1 - Beckon the cat over to you.','2 - Scream again for no particularly reason.',sep='\n')
                    answer_5 = input('\n[Choose a number 1-2] ')
                    if(answer_5 == '1'):
                        print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                        print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                        answer_6 = input('\n[Choose a number 1-2] ')
                        if(answer_6 == '1'):
                            print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                            print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                            #This is a failed ending. 
                        elif(answer_6 == '2'):
                            print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                            print('\nCongrats you have you achieve the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                            #This is the sneaky ending.                     
                        else:
                            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                    elif(answer_5 == '2'):
                        print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.
                    else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n') 
                elif(answer_4 == '3'):
                    print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                    print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                    #This is a failed ending. 
                else:
                    print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
            else:
                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
        
        
        
        #The function grouped below is the branch for checking your pockets.
        
        elif(answer_2 == '2'):
            print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
            number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
            #FYI: 112 is the emergency number outside the US
            if(number_called == 911 or number_called == 112):
                print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
                thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                    print('\n'+thank_the_cop,'for saving my life officer!')
                    print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                    #This is the smart ending
                else:
                    print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                    #This is the silly ending
            elif(number_called != 911 or number_called != 112):
                print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
                number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
                if(number_called_2 == 911 or number_called_2 == 112):
                    print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                    thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                    if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                        print('\n'+thank_the_cop,'for saving my life officer!')
                        print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the smart ending
                    else:
                        print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                        #This is the silly ending
                else:
                    print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                    #This is a failed ending.
            else:
                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
        
        
        
        
        #The function grouped below is for if you scream at least twice.
        
        elif(answer_2 == '3'):
            print('\nYou scream again but this time significantly louder than before.','\nNothing happens... or so you think. After a few minutes a cat pokes it\'s head out of the door and slowly walks down the basement stairs towards you.',sep='\n')
            print('The cat sits down a few feet away from you, looking at you with a playful curiosity.','\nWhat do you next?','\n1 - Beckon the cat over to you.','2 - Somehow convince the cat to grab the screwdriver.','3 - Scream again for no particularly reason.',sep='\n')
            answer_3 = input('\n[Choose a number 1-3] ')
            if(answer_3 == '1'):
                print('\nYou beckon the cat towards you...','\nThe cat quietly moves to you and begins cuddling with you and purring as you pet it. You get the bright idea to tear a piece of fabric off you shirt and throw it on the table with the screwdriver.','The cat follows the fabric and jumbs on the table knocking a bunch of tools on the ground including the screwdriver.',sep='\n')
                print('\nWhat do you do next?','\n1 - Grab the screwdriver.','2 - 3 - Scream again for no particularly reason.',sep='\n')
                answer_4 = input('\n[Choose a number 1-2] ')
                if(answer_4 == '1'):
                    print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                    print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                    answer_5 = input('\n[Choose a number 1-2] ')
                    if(answer_5 == '1'):
                        print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.                     
                    elif(answer_5 == '2'):
                        print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                        print('\nCongrats you have you achieved the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the sneaky ending.                     
                    else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                elif(answer_4 == '2'):
                    print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                    print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                    #This is a failed ending.
                else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
            elif(answer_3 == '2'):
                print('\nYou wave your hands and point at the screwdiver...','\nThe cat just looks at you as if it was confused. You realize that the cat doesn\'t understand',sep='\n')
                print('\nWhat do you do next?','\n1 - Beckon the cat over to you.','2 - Scream again for no particularly reason.',sep='\n')
                answer_4 = input('\n[Choose a number 1-2] ')
                if(answer_4 == '1'):
                    print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                    print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                    answer_5 = input('\n[Choose a number 1-2] ')
                    if(answer_5 == '1'):
                        print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending. 
                    elif(answer_5 == '2'):
                        print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                        print('\nCongrats you have you achieve the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the sneaky ending.                     
                    else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                elif(answer_4 == '2'):
                    print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                    print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                    #This is a failed ending.
                else:
                    print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n') 
            elif(answer_3 == '3'):
                print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                #This is a failed ending. 
            else:
                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
        else:
            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')

    
    
    elif(answer_1 == '2'): 
        
        print('\nYou reach as far as you can with you free hand but the screwdriver is still too far away.','You attempt to stand up from ground but your ankle screams at you in pain.',sep='\n')
        print('\nWhat do you do next?','\n1 - Scream for help!','2 - Check your pockets.',sep='\n')
        answer_2 = input('\n[Choose a number 1-2] ')
        if(answer_2 == '1'):
            print('\nYou scream at the top of your lungs for help.','\nCrickets... I don\'t think anybody heard you...',sep='\n')
            print('\nWhat do you do next?','\n1 - Check your pockets.','2 - Scream again.',sep='\n')
            answer_3 = input('\n[Choose a number 1-2] ')
            
            
            
            #The function grouped below is the branch for checking your pockets.
            
            if(answer_3 == '1'):
                print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
                number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
                #FYI: 112 is the emergency number outside the US
                if(number_called == 911 or number_called == 112):
                    print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
                    thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                    if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                        print('\n'+thank_the_cop,'for saving my life officer!')
                        print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the smart ending
                    else:
                        print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                        #This is the silly ending
                elif(number_called != 911 or number_called != 112):
                    print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
                    number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
                    if(number_called_2 == 911 or number_called_2 == 112):
                        print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                        thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                        if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                            print('\n'+thank_the_cop,'for saving my life officer!')
                            print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                            #This is the smart ending
                        else:
                            print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                            #This is the silly ending
                    else:
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.
                else:
                    print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
            
            
            
            #The function grouped below is for if you scream at least twice.
            
            elif(answer_3 == '2'):
                    print('\nYou scream again but this time significantly louder than before.','\nNothing happens... or so you think. After a few minutes a cat pokes it\'s head out of the door and slowly walks down the basement stairs towards you.',sep='\n')
                    print('The cat sits down a few feet away from you, looking at you with a playful curiosity.','\nWhat do you next?','\n1 - Beckon the cat over to you.','2 - Somehow convince the cat to grab the screwdriver.','3 - Scream again for no particularly reason.',sep='\n')
                    answer_3 = input('\n[Choose a number 1-3] ')
                    if(answer_3 == '1'):
                        print('\nYou beckon the cat towards you...','\nThe cat quietly moves to you and begins cuddling with you and purring as you pet it. You get the bright idea to tear a piece of fabric off you shirt and throw it on the table with the screwdriver.','The cat follows the fabric and jumbs on the table knocking a bunch of tools on the ground including the screwdriver.',sep='\n')
                        print('\nWhat do you do next?','\n1 - Grab the screwdriver.','2 - 3 - Scream again for no particularly reason.',sep='\n')
                        answer_4 = input('\n[Choose a number 1-2] ')
                        if(answer_4 == '1'):
                            print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                            print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                            answer_5 = input('\n[Choose a number 1-2] ')
                            if(answer_5 == '1'):
                                print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                                print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                                #This is a failed ending.                     
                            elif(answer_5 == '2'):
                                print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                                print('\nCongrats you have you achieved the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                                #This is the sneaky ending.                     
                            else:
                                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                        elif(answer_4 == '2'):
                            print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                            print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                            #This is a failed ending.
                        else:
                            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                    elif(answer_3 == '2'):
                        print('\nYou wave your hands and point at the screwdiver...','\nThe cat just looks at you as if it was confused. You realize that the cat doesn\'t understand',sep='\n')
                        print('\nWhat do you do next?','\n1 - Beckon the cat over to you.','2 - Scream again for no particularly reason.',sep='\n')
                        answer_4 = input('\n[Choose a number 1-2] ')
                        if(answer_4 == '1'):
                            print('\nYou grab the screwdiver and begin picking on the lock of the handcuff. After a couple of minutes, you pry the lock open and free yourself from the pipe','You look around in the basement and you notice a small window that leads to the outside',sep='\n')
                            print('\nWhat do you do next?','\n1 - Try to exit throught the door.','2 - Break open the window using the screwdriver you have.',sep='\n')
                            answer_5 = input('\n[Choose a number 1-2] ')
                            if(answer_5 == '1'):
                                print('\nYou quietly traverse up the stairs and sneak through the door as to not alert anyone in the house. You enter some sort of hallway that leads to a very messy living room.','You look over to the left and see the front door of the house. You rush towards and open it.','\nWHAM!','\nOn the other side of the door turns out to be your captor waiting to knock you out.',sep='\n')
                                print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                                #This is a failed ending. 
                            elif(answer_5 == '2'):
                                print('\nYou go up to the window and using the sharp pointed bit of the screwdriver, you drive it into the window, shattering it.','You climb outside of the window and succesfully escape your captor\'s house.',sep='\n')
                                print('\nCongrats you have you achieve the sneaky ending!','\nHowever, there are two other succesful endings...',sep='\n')
                                #This is the sneaky ending.                     
                            else:
                                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
                        elif(answer_4 == '2'):
                            print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                            print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                            #This is a failed ending.
                        else:
                            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n') 
                    elif(answer_3 == '3'):
                        print('\nYou scream again for no particular reason...','Suddenly you hear footsteps coming from above the basement. The footseps become increasingly louder until the door of the basement slams wide open to reveal a mysterious figure with a mask covering their face.','\nThey slowly approach you and knock you out.')
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending. 
                    else:
                        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
            else:
                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')



        #The function grouped below is the branch for checking your pockets.

        elif(answer_2 == '2'):
                print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
                number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
                #FYI: 112 is the emergency number outside the US
                if(number_called == 911 or number_called == 112):
                    print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
                    thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                    if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                        print('\n'+thank_the_cop,'for saving my life officer!')
                        print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the smart ending
                    else:
                        print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                        #This is the silly ending
                elif(number_called != 911 or number_called != 112):
                    print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
                    number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
                    if(number_called_2 == 911 or number_called_2 == 112):
                        print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                        thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                        if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                            print('\n'+thank_the_cop,'for saving my life officer!')
                            print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                            #This is the smart ending
                        else:
                            print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                            #This is the silly ending
                    else:
                        print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                        #This is a failed ending.
                else:
                    print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
        else:
            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')

    
    
    #The function grouped below is the branch for checking your pockets.
    
    elif(answer_1 == '3'):
        
        print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
        number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
            #FYI: 112 is the emergency number outside the US
        if(number_called == 911 or number_called == 112):
            print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
            thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
            if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                print('\n'+thank_the_cop,'for saving my life officer!')
                print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                #This is the smart ending
            else:
                print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                #This is the silly ending
        elif(number_called != 911 or number_called != 112):
            print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
            number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
            if(number_called_2 == 911 or number_called_2 == 112):
                print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                    print('\n'+thank_the_cop,'for saving my life officer!')
                    print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                    #This is the smart ending
                else:
                    print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                    #This is the silly ending
            else:
                print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                #This is a failed ending.
        else:
            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')

    
    
    elif(answer_1 == '4'):
        
        print('\nYou sit in the basement and do absolutely nothing.','\nMinutes turn into hours... Hours turn into what you think are days... Eventually nothing happens.','Before you know it you begin to feel extremely hungry and thirsty after waiting for so long.',sep='\n')
        print('\nWhat do you do next?','\n1 - Check your pockets','2 - Wait even longer.',sep='\n')
        answer_2 = input('\nChoose a number 1-2] ')
        
        
        
        #The function grouped below is the branch for checking your pockets.
        
        if(answer_2 == '1'):
            print('\nYou check your pockets and it turns out your captor forgot to take away your phone.','You turn on your phone, and you bring up the keypad of the phone app.',sep='\n')
            number_called = int(input('\nWhat number do you dial?\n\n[Choose 911, 112, or any phone number you want without the "-" symbols] '))
            #FYI: 112 is the emergency number outside the US
            if(number_called == 911 or number_called == 112):
                print('\nYou dial',number_called,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','\nA few minutes later you hear police sirens outside the house. The police barge into the basement and free you from your captivity')
                thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                    print('\n'+thank_the_cop,'for saving my life officer!')
                    print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                    #This is the smart ending
                else:
                    print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                    #This is the silly ending
            elif(number_called != 911 or number_called != 112):
                print('\nYou dial',number_called,'and the phone rings.\nAnd it keeps ringing... and ringing...\nSuprisingly, nobody picks up.')
                number_called_2 = int(input('\nWhat number do you dial?\n\n[Ok...This time choose 911 or 112 seriously] '))
                if(number_called_2 == 911 or number_called_2 == 112):
                    print('\nYou dial',number_called_2,'and they pick up. You tell them about your situation and they immediately dispatch the police to your location.','A few minutes later you hear police sirens coming into the house. ')
                    thank_the_cop = input('\nAfter the police rescue you what do you tell them?\n\n[Choose between "Thank you" or "Thank you so much"]\n[Make sure to spell exactly shown] ')
                    if(thank_the_cop == 'Thank you' or thank_the_cop == 'Thank you so much'):
                        print('\n'+thank_the_cop,'for saving my life officer!')
                        print('\nCongrats you have you achieved the smart ending!','\nHowever, there are two other succesful endings...',sep='\n')
                        #This is the smart ending
                    else:
                        print('\nYou did\'t thank the cop or you mispelled, either way you failed to escape the house... :\'(','\nRerun the program and try again.',sep='\n')
                        #This is the silly ending
                else:
                    print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
                    #This is a failed ending
            else:
                print('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')
        


        #The function grouped below is the branch for waiting a really long time.

        elif(answer_2 == '2'):
            
            print('\nYou decide to wait even longer...','\nDays turn into months... Months turn into years...','\nEventually you become one with yourself and you enter a state of inner peace after enduring for so long.','All of a sudden you feel the strength of a million suns surge through you.',sep='\n')
            free_yourself = input('\nWould you like to free yourself?\n[Choose yes or no] ')
            if(free_yourself == 'yes'):
                print('\nYou break your chain with ease where you then break the window of the basement. After so long, you are at last free with your new found powers.')
                print('\nCongrats you have achieved the patience ending!','\nHowever, there are two other succesful endings...',sep='\n')
                #This is the patience ending
            elif(free_yourself == 'no'):
                print('\nFor some reason, you decide not to break your chains and it turns out you actually enjoy being kept in captivity. The peace and quite in the room really resonated with you during all this time especially while being alone with your thoughts.')
                print('\nCongrats... I Guess... I mean... you may not have escaped but you did find somehting else... so good for you!','\nHowever, there are three succesful endings...',sep='\n')
                #This is the mixed ending?
            else:
                print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
        else:
            print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')    
    else:
        print('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
else:
    print('\nUmmm... just pick yes or no and the game will start silly.\n\nRerun the program and try again.')

#These are the functions I'm using for my else statements and for failed endings
#('\nOops... Looks like you entered something you weren\'t supposed.','\nRerun the program and try again.',sep='\n')
#('\nYou failed to escape the house.','\nRerun the program and try again.',sep='\n')