# Conway's Game of Life in Nim

[![Nim Version](https://img.shields.io/badge/Nim-1.4.2-orange)](https://nim-lang.org/)
[![License](https://img.shields.io/badge/License-MIT-blue)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/github/workflow/status/yourusername/game-of-life-nim/Build%20and%20Test)](https://github.com/yourusername/game-of-life-nim/actions)
[![Code Coverage](https://img.shields.io/codecov/c/github/yourusername/game-of-life-nim)](https://codecov.io/gh/yourusername/game-of-life-nim)
[![Contributors](https://img.shields.io/github/contributors/yourusername/game-of-life-nim)](https://github.com/yourusername/game-of-life-nim/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/yourusername/game-of-life-nim)](https://github.com/yourusername/game-of-life-nim/issues)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](https://github.com/yourusername/game-of-life-nim/pulls)
[![Forks](https://img.shields.io/github/forks/yourusername/game-of-life-nim)](https://github.com/yourusername/game-of-life-nim/network/members)
[![Stars](https://img.shields.io/github/stars/yourusername/game-of-life-nim)](https://github.com/yourusername/game-of-life-nim/stargazers)

## About Conway's Game of Life

Conway's Game of Life is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is a zero-player game that simulates the evolution of a population of cells on a two-dimensional grid. The game follows a set of simple rules that determine the life and death of each cell:

1. Any live cell with fewer than two live neighbors dies, as if by underpopulation.
2. Any live cell with two or three live neighbors survives to the next generation.
3. Any live cell with more than three live neighbors dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

These rules create interesting patterns and behavior, and the game is often used as an example of emergent complexity and self-replication in cellular automata.

## Features

- The game board is represented as a two-dimensional grid.
- The initial state of the board can be randomly generated.
- The game follows the rules of Conway's Game of Life for cell evolution.
- The game's evolution can be observed and displayed in the console or graphical interface.

## Stuff

- Nim language 
- Nico framework
- Nimble package manager
- SDL2 framework
