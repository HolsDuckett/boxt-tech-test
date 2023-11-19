# BOXT TOY ROBOT

![robot dancing](https://media3.giphy.com/media/tczJoRU7XwBS8/giphy.gif)

### Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units
x 5 units

- There are no other obstructions on the table surface

- The robot is free to roam around the surface of the table, but must be prevented from falling to
destruction. Any movement that would result in the robot falling from the table must be
prevented, however further valid movement commands must still be allowed

### Prerequisites
- Ruby installed
- A taste for the fun things in life (a.k.a robot applications 🤖)

### How to get started?
1. Clones this repository
2. Run `bundle` to install all gems
3. In your console run `irb -r ./play_game.rb` 
4. And enjoy!

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
 To improve the quality of this application I would want to do the following:
* Add a check to ensure the user is only able to enter PLACE X,Y,F in that exact expected format with X & Y as numbers and F as a cardinal direction
* Allow the user to end the game in a user friendly manner - e.g END command
