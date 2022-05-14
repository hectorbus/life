# Conway's Game of Life

**Ruby CLI implementation of Conway's Game of Life**

Installation
-----

Clone the repository, make sure you have a recent version of ruby installed, navigate to the repository and run the following:
```
$ gem install bundler
$ bundle install
```

Usage
-----

In command line, navigate to the repository and run the following command.

```
$ bin/life_game start [OPTIONS]
```

### Usage examples

Starts game with default options:
```
$ bin/life_game start
```
Starts game with options defined:
```
$ bin/life_game start --x 5 --y 5 --s 100
```
Help:
```
$ bin/life_game help
```

Options
--------

* `-x`,`[--width=N]`  —  Default: 30   —  Grid width size
* `-y`,`[--height=N]` —  Default: 30   —  Grid height size
* `-s`,`[--speed=N]`  —  Default: 100  —  Life cycle speed in milliseconds
