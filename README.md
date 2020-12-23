# VG101 project 1
### by Mai Yuqi 520021910367
#

## how to play the game
---
* open main
* click 'run'

## some warnings
---
* please input a number ranged from [0,1] in 'the possibility',e.g:0.3
* please input an integer larger than 8 in the 'total number of cars'
* in the 'able to freely turn left or right', please input a Y or N which stands for yes and no, remember they are capital letters
* in the 'difficulty level', please enter a integer ranged from [1,3];
 1:easy mode; 2:normal mode; 3:hard mode. if you choose normal, all the parameters will remain the same, otherwise, the code will automatically adjust some of them.
* if the sub function doesn't work, please open all the other m.files and click to the main file, run it again

#
## features
---
* more lanes
* freely turn
* adjustment

## the algorithm in ex1_3
---
**input**: 
**output**:the picture of the car and traffic light
##### while true
* delete the last 0.1 second's car
* timer=timer+0.1
* check if it should change the color of the traffic light
* draw the light
* to each car
* * use the position and the timer to check if the car should move or stop or turn
* * draw the car
* * use the position to check if it crashes(if yes, break)
* * use the position to check if all cars running out the axises(if yes,break)

#
## the algorithm in ex2_1
---
**input**: a set of elements and the integer l
**output**:all their permutations of length l
**algorithm**:
 ##### put all the elements into an array a
 ##### n<-- the number of the elements a
 ##### function [b,n]=recur(l,b,a,n)
 * if l==0
 * * display(b)
 * else
 * * for i=1:n
 * * * b=[b,a(i)]
 * * * c=a and delete c(i)
 * * * [b,n]=recur (l-1,b,c,n-1)
 * * end
 * end
 * return to the former digits
 * delete b(end)
end
 
 
 ## when generate a random plate, just replace enumerate with random  
 
 

