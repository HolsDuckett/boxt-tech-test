# BOXT TOY ROBOT

![robot dancing](https://media3.giphy.com/media/tczJoRU7XwBS8/giphy.gif)

### Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units
x 5 units

- There are no other obstructions on the table surface

- The robot is free to roam around the surface of the table, but must be prevented from falling to
destruction. Any movement that would result in the robot falling from the table must be
prevented, however further valid movement commands must still be allowed

### Prerqusites
- Ruby installed
- A taste for the fun things in life (aka robot applications 🤖)

### How to get started?
1. Clones this repository
2. cd into project repo
3. run bundle to install all gems
4. In your console run `irb -r ./main.rb` 
5. And enjoy ;)

Accepted commands are: 
* PLACE X,Y,F ➡️ (X: number, Y: number F: cardinal direction e.g NORTH, EAST, SOUTH or WEST)
* MOVE ➡️ will move the robot 1 space in the direction it is facing
* LEFT ➡️ will rotate your robot 90 degrees anti clockwise (e.g from facing NORTH to facing WEST)
* RIGHT ➡️ will rotate your robot 90 degrees clockwise (e.g from facing NORTH to facing EAST)
* REPORT ➡️ will output your current location in format X,Y,DIRECTION

### Running tests
To run the tests:
run `rspec`

### Test data and Results

* PLACE 0,0,NORTH
* MOVE
* REPORT
    * Output: 0,1,NORTH
* PLACE 0,0,NORTH
* LEFT
* LEFT
* REPORT
    * Output: 0,0,WEST
* PLACE 1,2,EAST
* MOVE
* LEFT
* MOVE
* REPORT 
    * Output: 2,3,NORTH

### Future considerations
* To improve the quality of this application i would want to do the following:
* Add a check to ensure the user was only able to enter PLACE X,Y,F in that exact format with X,Y as numbers
* Allow the user the end the game in a user friendly manner - e.g END command
* Amend the commands to not be case sensitive e.g right & RIGHT would do the same thing
