# BOXT TOY ROBOT

### Prerqusites
Ruby installed
A taste for the fun things in life (aka robot applications 🤖)

### How to get started?
Clones this repository
cd into project repo
run bundle to install all gems
In your console run `irb -r './main.rb'` 
And enjoy ;)

Accepted commands are:
PLACE X,Y,F (X: number, Y: number F: cardinal direction e.g NORTH, EAST, SOUTH or WEST)
MOVE
LEFT -> this will rotate your robot 90 degrees anti clockwise (e.g from facing NORTH to facing WEST)
RIGHT -> this will rotate your robot 90 degrees clockwise (e.g from facing NORTH to facing EAST)
REPORT -> this will output your current location in format X,Y,DIRECTION

### Running tests
To run the tests:
cd into project repo
run `rspec`

### Example Input and Output

o PLACE 0,0,NORTH
o MOVE
o REPORT
        ▪ Output: 0,1,NORTH
o PLACE 0,0,NORTH
o LEFT
o REPORT
        ▪ Output: 0,0,WEST
o PLACE 1,2,EAST
o MOVE
o MOVE
o LEFT
o MOVE
o REPORT 
        ▪ Output: 3,3,NORTH

### Future considerations
o To improve the quality of this application i would want to do the following:
o Add a check to ensure the user was only able to enter PLACE X,Y,F in that exact format with X,Y as numbers
o Allow the user the end the game in a user friendly manner - e.g END command
o Amend the commands to not be case sensitive e.g right & RIGHT would do the same thing
