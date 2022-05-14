# Conway's Game of Life

**Ruby CLI implementation of Conway's Game of Life**

Installation
-----

Clone the repository, make sure you have a recent version of ruby installed and run `bundle install`.

Usage
-----

In command line, navigate to the repository and run the next line with a specific command and it's options.

```
$ bin/life start [OPTIONS]
```

### Usage examples

Starts game with default options:
```
$ bin/life start
```
Starts game with defined options:
```
$ bin/life start --x 5 --y 5 --s 100
```
Help:
```
$ bin/life help
```

Options
--------

* `-x`,`[--width=N]` — Grid width size
* `-y`,`[--height=N]` — Grid height size
* `-s`,`[--speed=N]` — Life cycle speed in milliseconds
