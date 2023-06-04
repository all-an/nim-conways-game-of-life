import nico
import sequtils
import os

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

var board = newSeqWith(nx, newSeq[bool](ny))
board[0][0] = true
board[10][0] = true
board[0][5] = true

var buttonDown = false

proc gameInit() =
  loadFont(0, "font.png")

proc neighbourCount(i, j : int) : int =
  result = 0
  for di in -1..1:
    for dj in -1..1:
      let ii = i + di
      let jj = j + dj
      result += int(board[ii][jj])
  result -= int(board[i][j])

proc updateBoard() =
  for i in 0..<nx:
    for j in 0..<ny:
      let n = neighbourCount(i, j)

proc toggleCellInCurrent(x, y : int) =
  let i = x div dx
  let j = y div dy
  if i < 0 or i >= nx or j < 0 or j >= ny:
    return
  board[i][j] = not board[i][j]


proc gameUpdate(dt: float32) =
  if key(K_SPACE):
    updateBoard()
    sleep(200)

  if mousebtn(0):
    let (x, y) = mouse()
    toggleCellInCurrent(x, y)
    echo x, ",", y
    sleep(200)
  # buttonDown = btn(pcA)

proc gameDraw() =
  cls()
  setColor(if buttonDown: 7 else: 3)
  # printc("welcome to " & appName, screenWidth div 2, screenHeight div 2, 2)
  setColor(2)
  boxfill(50,5,5,5)
  setColor(3)
  boxfill(40,10,5,5)
  for i in 0..<nx:
    for j in 0..<ny:
      if board[i][j] == true:
        setColor(2)
        boxfill(i * dx, j * dy, dx, dy)
      else:
        setColor(7)

nico.init(orgName, appName)
nico.createWindow(appName, wx, wy, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
