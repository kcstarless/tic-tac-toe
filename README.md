# Ruby: tic-tac-toe

## 1. Description 
Game of tic-tac-toe where two players plays against each other. This is a simple command prompt game with use of class and inheritance in Obejct Oriented Programming. 

## 1. Usage
1. Run the program in command prompt with follow prompt:
``` ruby tic_tac_toe.rb ```
2. 3x3 board will be displayed each with corresponding numbers. 
``` 
-------
1  2  3   
4  5  6   
7  8  9  
-------
```
3. Player 1 (X) mark position on the board by typing in matching number. 
``` Player X mark position: ```
4. Board will be displayed again showing Players mark.
5. Player 2 (O) mark position on the board by typing in matching number. 
    - If player input does not match numbers on the board program will re-prompt for user input. 
    - ``` Invalid number/Position taken: ```
6. Taking turn this process will be repeated until horizontal, vertical or cross line is formed of same mark(X or O)
7. If winning line is found program will declare player as winner and end. 
```
-------
O  X  3   
O  X  6   
7  X  9  
-------
Player X WINS!
```
8. If no winner is found after 9 turns program will declare as draw and end. 

## Future Update/Add-ons
1. Implement class #Player and ask for user name and create new instanc of player. 

## Thoughts on the project
- I've created parent class `Board` with child class of `Game`. The game is started by instance of child class `Game`. Looking back at my solution I feel `Game` and `Board` should be separate with no dependency. 

- After looking at different solutions I found maybe `board` hash is not a good solution. Maybe just simple 2D array? 