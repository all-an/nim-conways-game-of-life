import nico
import sequtils

const orgName = "all-an"
const appName = "gameoflife"

let wx = 710
let wy = 400

let resolution = 10
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

proc gameUpdate(dt: float32) =
  buttonDown = btn(pcA)

proc gameDraw() =
  cls()
  setColor(if buttonDown: 7 else: 3)
  printc("welcome to " & appName, screenWidth div 2, screenHeight div 2, 2)
  setColor(2)
  boxfill(200,5,5,5)
  setColor(3)
  boxfill(5,100,5,5)
  for i in 0..<nx:
    for j in 0..<ny:
      if board[i][j] == true:
        setColor(2)
        boxfill(i * dx, j * dy, dx, dy)
      else:
        setColor(7)

nico.init(orgName, appName)
nico.createWindow(appName, wx, wy, 4, true)
nico.run(gameInit, gameUpdate, gameDraw)
