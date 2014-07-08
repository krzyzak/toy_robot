Toy Robot Simulator
=========
[![Build Status](https://travis-ci.org/krzyzak/toy_robot.png)](https://travis-ci.org/krzyzak/toy_robot)
[![Code Climate](https://codeclimate.com/github/krzyzak/toy_robot.png)](https://codeclimate.com/github/krzyzak/toy_robot)
## Installation

```
git clone https://github.com/krzyzak/toy_robot.git
cd toy_robot
bundle
```


## Usage


### Running game 

There are two ways to run robot:
* Use ```rake game``` to use Standard Input as a source
* Use ```rake game path/to/file``` to use File as a source.
  * If there’s ```Output: X, Y, Position``` in file, runner is running in test mode, which means that it checks if current output is the same as expected, raising exception otherwise.
  * Otherwise, it’s just running each line

* If you want to go play with ToyRobot internals, just run ```rake console``` – It automatically loads IRB session with ToyRobot environment.
* Run ```rake test``` to run all tests.

## Description

* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.
* Create an application that can read in commands of the following form -

  ```
    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT
  ```
* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
* A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
* Input can be from a file, or from standard input, as the developer chooses.
* Provide test data to exercise the application.

### Constraints:

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
Example Input and Output:
```
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```
