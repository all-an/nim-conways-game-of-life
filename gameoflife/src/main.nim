import nico
import sequtils
import os
import random
import strutils

const orgName = "all-an"
const appName = "gameoflife"

#[ let wx = 710
let wy = 400 ]#

let wx = 200
let wy = 200

let resolution = 5
let dx = resolution
let dy = resolution

let nx = wx div dx
let ny = wy div dy

var current = newSeqWith(nx, newSeq[bool](ny))
var next = newSeqWith(nx, newSeq[bool](ny))
#[ current[0][0] = true
current[10][0] = true
current[0][5] = true ]#

var gen = 0

var buttonDown = false

proc initBoard() =
  for i in 0..<nx:
    for j in 0..<ny:
      let isOn = bool(rand(9) div 9)
      current[i][j] = isOn
  gen = 0

proc initEmptyBoard() = 
  for i in 0..<nx:
    for j in 0..<ny:
      current[i][j] = false
  gen = 0

proc gameInit() =
  loadFont(0, "font.png")
  initBoard()

proc neighbourCount(i, j : int) : int =
  result = 0
  for di in -1..1:
    for dj in -1..1:
      let ii = (i + di + nx) mod nx
      let jj = (j + dj + ny) mod ny
      result += int(current[ii][jj])
  result -= int(current[i][j])

proc updateBoard() =
  for i in 0..<nx:
    for j in 0..<ny:
      let isAlive = current[i][j]
      let n = neighbourCount(i, j)
      if (not isAlive and n==3):
        #come alive
        next[i][j] = true
      elif (isAlive and (n<2 or n>3)):
        #die
        next[i][j] = false
      else:
        #maintain present state
        next[i][j] = isAlive
  swap(current, next)
  gen += 1

proc toggleCellInCurrent(x, y : int) =
  let i = x div dx
  let j = y div dy
  if i < 0 or i >= nx or j < 0 or j >= ny:
    return
  current[i][j] = not current[i][j]


proc gameUpdate(dt: float32) =
  if key(K_SPACE):
    updateBoard()
    sleep(200)
  elif key(K_RETURN):
    initBoard()
    sleep(100)
  elif key(K_0):
    initEmptyBoard()
    sleep(100)

  elif mousebtn(0):
    let (x, y) = mouse()
    toggleCellInCurrent(x, y)
    echo x, ",", y
    sleep(200)
  # buttonDown = btn(pcA)

proc drawBoard() = 
  for i in 0..<nx:
    for j in 0..<ny:
      if current[i][j] == true:
        setColor(if buttonDown: 7 else: 3)
        boxfill(i * dx, j * dy, dx, dy)
      else:
        setColor(7)

proc printGen() =
  setColor(9)
  let msg = "Generation count: $1" % [$gen]
  printc(msg, screenWidth div 4, screenHeight div 16, 1)


proc gameDraw() =
  cls()
  setColor(if buttonDown: 7 else: 3)
  # printc("welcome to " & appName, screenWidth div 2, screenHeight div 2, 2)
  #[ setColor(2)
  boxfill(50,5,5,5)
  setColor(3)
  boxfill(40,10,5,5) ]#
  drawBoard()
  printGen()

nico.init(orgName, appName)
nico.createWindow(appName, wx, wy, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
