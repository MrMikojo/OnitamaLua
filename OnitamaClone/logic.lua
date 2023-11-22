-- Will add the game input logic here:

-- create global table called "highlightedBoxes"
highBoxes = {}

function logicLoad()
    -- Create gameStates 
    highBoxSprite = love.graphics.newImage("sprites/highlightedTile.png")
    -- add highlightedTile sprite

    gameState = 1
    --[[
    States:

    0 - Main Menu/Game Start
        -- this will be where who goes first is decided based on which card is in Neutral zone

    1 - Blue's turn

    2 - Red's turn

    3 - Blue Wins

    4 - Red Wins

    ]]

end




function logicUpdate(dt)



    

    --checkCardStatus()


    for i, H in ipairs (highBoxes) do
        
        for i, B in ipairs (bluePawns) do 

            if B.isPickedUp == true  then
                
                H.x = B.x - 16
                H.y = B.y - 16

            end
        end
    end
   
    --TILE LOGIC
    --Algorithm that checks mouse click to tile distance then changes 
    -- the selected tiles state to isPickedUp equals True and sets all other tiles 
    -- to "false" incase player tries to pick up multiple tiles
    -- when tile is picked up do not print tile sprite, instead replace cursor with the currenly picked up piece 


    -- after tile is picked up, add new table called "HighlightedBox" to "highlightedBoxes" 
    -- the new table will need an x and y variable for placement, for now put where the currently picked up tile is at
    

    -- then add another function that if player clicks the same tile (for now)

    -- this is where another if statement will be added that if player clicks highlightedBox then tile that is currenly picked up will
    -- be placed there and isPickedUp goes back to false.
  
  
    -- then tile returns to "isPickedUp" equals false



    -- call the cardLogic function here, realized its going to be different



end


function logicDraw()

    --draw highlightedBoxes here


    for i, h in ipairs (highBoxes) do
        if h.isActive == true then
    
            love.graphics.draw(highBoxSprite, h.x, h.y)
        
        end
    end



end



--CARD LOGIC
    --this is the part that will need a nested loop checking if card is in a specific position and if tile isPickedUp is true then
    -- create more highlightedBox tables depending on each card.

    -- the actions will totally depend on where the "cardState" of each card is at

    -- if cardState is in N1 then it will need to rotate to R1 (still need to create R1) 

    -- if cardState is in N2 then it will  rotate to either B1 or B2


    -- if cardState is B1 or B2 (and is used?) then it will rotate to  N1

    -- if cardStatae is in R1 or R2 (again and is used?) then it will need to rorate to N2

    -- if cardState is in N1 then it will need to rotate to R1 or R2 (still need to create R1) 
 
    -- I think I'll need to add playerZones tied to the cards for filling in zones?

    -- I should really make atleast 5 cards so that I can test all this when it comes to making it 



--end





function spawnHighBoxes()


    local highBox = {}

        highBox.x = 0
        highBox.y = 0
    
        highBox.isActive = true

        table.insert(highBoxes, highBox)
    


end 




-- Helper function to check for collisions with pawns of the same color
function hasCollisionWithSameColor(currentPawn, newX, newY)
    local sameColorPawns = getPawnsWithSameColor(currentPawn)

    for _, otherPawn in ipairs(sameColorPawns) do
        -- Check if the new position collides with another pawn's position

        -- uses check collision function 
        if checkCol({ x = newX, y = newY, width = currentPawn.width, height = currentPawn.height }, otherPawn) then
            return true  -- Collision detected
        end
    end

    return false  -- No collision
end


function isOutOfBounds(currentPawn, newX, newY) -- fuck yea its working!!!
                
    if outOfBounds({x = newX, y = newY, width = currentPawn.width, height = currentPawn.height}) then
                    return true
                end
    return false

end


-- Helper function to get pawns of the same color
function getPawnsWithSameColor(pawn)
    local pawns = (pawn.team == "blue") and bluePawns or redPawns
    local sameColorPawns = {}

    for _, otherPawn in ipairs(pawns) do
        if otherPawn ~= pawn then
            table.insert(sameColorPawns, otherPawn)
        end
    end

    return sameColorPawns
end


--[[ not even working?]]
function outOfBounds(a) --, newX, newY)

	if a.y < 32 then
		return true --- collision detected?

	
    elseif a.y > 200 then
        return true

    elseif a.x  < 64 then
        return true 

    elseif a.x > 224  then 
        return true

    end
    return false -- no collision?

end

--[[
Error

logic.lua:184: attempt to compare nil with number


Traceback

[love "callbacks.lua"]:228: in function 'handler'
logic.lua:184: in function 'outOfBounds'
main.lua:1758: in function 'update'
[love "callbacks.lua"]:162: in function <[love "callbacks.lua"]:144>
[C]: in function 'xpcall'

]]





-- add distanceBetween function here

function distanceBetween(x1, y1, x2, y2)

    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2) -- the return returns the values inputed after running distance algorithm

-- math sqrt does square root
end



-- Learning how to save and load for the first time
function saveGame()
    data = {}

       -- Save blue team
       data.blueTeam = {}
       for i, pawn in ipairs(bluePawns) do
           table.insert(data.blueTeam, {
               x = pawn.x,
               y = pawn.y,
               width = pawn.width,
               height = pawn.height,
               radius = pawn.radius,
               isPickedUp = pawn.isPickedUp,
               team = pawn.team,
               isKing = pawn.isKing,
               hp = pawn.hp,
               tigerMove = pawn.tigerMove,
               roosterMove = pawn.roosterMove,
               dragonMove = pawn.dragonMove,
               elephantMove = pawn.elephantMove,
               cobraMove = pawn.cobraMove,
               mantisMove = pawn.mantisMove,
               frogMove = pawn.frogMove
           })
       end
   
       -- Save red team
       data.redTeam = {}
       for i, pawn in ipairs(redPawns) do
           table.insert(data.redTeam, {
               x = pawn.x,
               y = pawn.y,
               width = pawn.width,
               height = pawn.height,
               isKing = pawn.isKing,
               radius = pawn.radius,
               isPickedUp = pawn.isPickedUp,
               team = pawn.team,
               hp = pawn.hp,
               tigerMove = pawn.tigerMove,
               roosterMove = pawn.roosterMove,
               dragonMove = pawn.dragonMove,
               elephantMove = pawn.elephantMove,
               cobraMove = pawn.cobraMove,
               mantisMove = pawn.mantisMove,
               frogMove = pawn.frogMove
           })
       end

    -- Save card positions
    data.cards = {}
    for i, card in ipairs(cards) do
        table.insert(data.cards, {

           -- Sprite = card.Sprite,
            x = card.x, 
            y = card.y, 
            cardState = card.cardState, 
            cardName = card.cardName,
            inGame = card.inGame 
        })
    end

    --[[ Save other relevant data as needed
    data.otherData = {
        -- Add other relevant fields here
    }
    ]]

    serialized = lume.serialize(data)
    print(serialized)
    love.filesystem.write("savedata.txt", serialized)
end

    
function loadGame()
    file = love.filesystem.read("savedata.txt")
    if file then
        data = lume.deserialize(file)

        -- Load blue team
        bluePawns = {}
        for i, pawnData in ipairs(data.blueTeam) do
            table.insert(bluePawns, {
                x = pawnData.x,
                y = pawnData.y,
                width = pawnData.width,
                height = pawnData.height,
                radius = pawnData.radius,
                isPickedUp = pawnData.isPickedUp,
                team = pawnData.team,
                hp = pawnData.hp,
                isKing = pawnData.isKing,
                tigerMove = pawnData.tigerMove,
                roosterMove = pawnData.roosterMove,
                dragonMove = pawnData.dragonMove,
                elephantMove = pawnData.elephantMove,
                cobraMove = pawnData.cobraMove,
                mantisMove = pawnData.mantisMove,
                frogMove = pawnData.frogMove
            })
        end

        -- Load red team
        redPawns = {}
        for i, pawnData in ipairs(data.redTeam) do
            table.insert(redPawns, {

                
                x = pawnData.x,
                y = pawnData.y,
                width = pawnData.width,
                height = pawnData.height,
                radius = pawnData.radius,
                isKing = pawnData.isKing,
                isPickedUp = pawnData.isPickedUp,
                team = pawnData.team,
                hp = pawnData.hp,
                tigerMove = pawnData.tigerMove,
                roosterMove = pawnData.roosterMove,
                dragonMove = pawnData.dragonMove,
                elephantMove = pawnData.elephantMove,
                cobraMove = pawnData.cobraMove,
                mantisMove = pawnData.mantisMove,
                frogMove = pawnData.frogMove
            })
        end

        -- Load card positions
        cards = {}
        for i, cardData in ipairs(data.cards) do
            table.insert(cards, {

             --   Sprite = cardData.Sprite,
                x = cardData.x, 
                y = cardData.y, 
                cardState = cardData.cardState, 
                cardName = cardData.cardName,
                inGame = cardData.inGame
            })
        end


    end
end
     





                    --MOVESETS!!!!--

-- started with tiger
function tigerMove1(x, y, isPickedUp)
    -- for i, B in ipairs(bluePawns) do
    print("Entering tigerMove1 function")
            print("x:", x)
            print("y:", y)
            print("isPickedUp:", isPickedUp)
        
    if isPickedUp == 2 then
        print("Moving blue pawn to the right")
        x = x + 64
                y = y
        isPickedUp = 1
        
        -- Update the position of the specific blue pawn passed as an argument
       -- bluePawn.x = x
       -- bluePawn.y = y
        
        print("Exiting tigerMove1 function")
        return x, y, isPickedUp
    end
        
            --end
end
        
--2nd move for tiger card, for going backwards
       
function tigerMove2(x, y, isPickedUp)
    -- for i, B in ipairs(bluePawns) do
    print("Entering tigerMove2 function")
            print("x:", x)
            print("y:", y)
            print("isPickedUp:", isPickedUp)
        
    if isPickedUp == 2 then
        print("Moving blue pawn to the right")
        x = x - 32
                y = y
        isPickedUp = 1
        
        -- Update the position of the specific blue pawn passed as an argument
       -- bluePawn.x = x
       -- bluePawn.y = y
        
        print("Exiting tigerMove2 function")
        return x, y, isPickedUp
    end
        
            --end
end
      

function tigerMove3(x, y, isPickedUp)
    -- for i, B in ipairs(bluePawns) do
    print("Entering tigerMove2 function")
            print("x:", x)
            print("y:", y)
            print("isPickedUp:", isPickedUp)
        
    if isPickedUp == 2 then
        print("Moving blue pawn to the right")
        x = x - 64
                y = y
        isPickedUp = 1
        
        -- Update the position of the specific blue pawn passed as an argument
       -- bluePawn.x = x
       -- bluePawn.y = y
        
        print("Exiting tigerMove2 function")
        return x, y, isPickedUp
    end
        
            --end
end

function tigerMove4(x, y, isPickedUp)
        
    if isPickedUp == 2 then
 
        x = x + 32
                y = y
        isPickedUp = 1

        return x, y, isPickedUp
    end

end

--tiger moves 3 and 4 still needed, or not maybe just multiply by -1

-- Now onto other cards, actually making progress...
--[[ I would like to turn this into a function that updates variables above but cant figure it out right now...
for j, T in ipairs (cards) do
    -- if in B1 
function cardRotation()
    if T.cardState == "N2" then
        T.cardState = "B1"
    
    
    
    elseif T.cardState == "B1" and T.cardName == "tiger" then
        T.cardState = "N1"
        
     
    
        -- and if in B2
    elseif T.cardState == "B2" and T.cardName == "tiger" then
        T.cardState = "N1"
        --[[
        if  T.cardState == "N2" then 
            T.cardState = "B2"
        end
        ]-]
    end




end        
]]
-- added more cards, now to add more moves


--ROOSTER TIME


function roosterMove1(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x - 32
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function roosterMove2(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x 
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function roosterMove3(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x
        y = y + 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function roosterMove4(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x + 32
        y = y + 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end



function roosterMove5(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x - 32
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end



function roosterMove6(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function roosterMove7(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x
        y = y + 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function roosterMove8(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x + 32
        y = y + 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

-- 8 roosters in the coop, onto the Dragos

--DRAGONS MOVES all good

function dragonMove1(x, y, isPickedUp)
            -- over one and up two 
        if isPickedUp == 2 then
            x = x + 32
            y = y - 64
            isPickedUp = 1
            return x, y, isPickedUp
        end
end

function dragonMove2(x, y, isPickedUp)
        -- over one and down two
        if isPickedUp == 2 then
            x = x - 32
            y = y - 32
            isPickedUp = 1
            return x, y, isPickedUp
        end
end

function dragonMove3(x, y, isPickedUp)

        if isPickedUp == 2 then
            x = x - 32
            y = y + 32
            isPickedUp = 1
            return x, y, isPickedUp
        end
end

function dragonMove4(x, y, isPickedUp)

        if isPickedUp == 2 then
            x = x + 32
            y = y + 64
            isPickedUp = 1
            return x, y, isPickedUp
        end
end

function dragonMove5(x, y, isPickedUp)

        if isPickedUp == 2 then
            x = x - 32
            y = y - 64
            isPickedUp = 1
            return x, y, isPickedUp
        end
end
    -- fix dragons 6 through 8
function dragonMove8(x, y, isPickedUp)
        -- over one and down two
        if isPickedUp == 2 then
            x = x - 32
            y = y + 64
            isPickedUp = 1
            return x, y, isPickedUp
        end
end

function dragonMove6(x, y, isPickedUp)

        if isPickedUp == 2 then
            x = x + 32
            y = y - 32
            isPickedUp = 1
            return x, y, isPickedUp
        end
end
-- 8 moves Done
function dragonMove7(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x + 32 
        y = y + 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end


--MANTIS MOVES -- not needed yet as this card is not inGame for demo
function mantisMove1(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x + 32
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end

function mantisMove5(x, y, isPickedUp)

    if isPickedUp == 2 then
        x = x - 32
        y = y - 32
        isPickedUp = 1
        return x, y, isPickedUp
    end
end



--elephantS MOVES

function elephantMove1(x, y, isPickedUp)
    -- over one and up two 
if isPickedUp == 2 then
    x = x + 32
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function elephantMove2(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
    x = x + 32
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function elephantMove3(x, y, isPickedUp)

if isPickedUp == 2 then
    x = x 
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function elephantMove4(x, y, isPickedUp)

if isPickedUp == 2 then
    x = x 
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function elephantMove5(x, y, isPickedUp)
-- over one and up two 
if isPickedUp == 2 then
x = x - 32
y = y - 32
isPickedUp = 1
return x, y, isPickedUp
end
end

function elephantMove6(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
x = x - 32
y = y + 32
isPickedUp = 1
return x, y, isPickedUp
end
end

function elephantMove7(x, y, isPickedUp)

if isPickedUp == 2 then
x = x 
y = y - 32
isPickedUp = 1
return x, y, isPickedUp
end
end

function elephantMove8(x, y, isPickedUp)

if isPickedUp == 2 then
x = x 
y = y + 32
isPickedUp = 1
return x, y, isPickedUp
end
end

--Combra Moves

function cobraMove1(x, y, isPickedUp)
    -- over one and up two 
if isPickedUp == 2 then
    x = x 
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function cobraMove2(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
    x = x - 32
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function cobraMove3(x, y, isPickedUp)

if isPickedUp == 2 then
    x = x + 32
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end


function cobraMove4(x, y, isPickedUp)
    -- over one and up two 
if isPickedUp == 2 then
    x = x - 32
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function cobraMove5(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
    x = x + 32
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function cobraMove6(x, y, isPickedUp)

if isPickedUp == 2 then
    x = x 
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end



function frogMove1(x, y, isPickedUp)
    -- over one and up two 
if isPickedUp == 2 then
    x = x 
    y = y - 64
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function frogMove2(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
    x = x + 32
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function frogMove3(x, y, isPickedUp)

if isPickedUp == 2 then
    x = x - 32
    y = y + 32
    isPickedUp = 1
    return x, y, isPickedUp
end
end

function frogMove4(x, y, isPickedUp)
    -- over one and down two
    if isPickedUp == 2 then
    x = x + 32
    y = y - 32
    isPickedUp = 1
    return x, y, isPickedUp
    end
    end

function frogMove5(x, y, isPickedUp)
-- over one and down two
if isPickedUp == 2 then
x = x - 32
y = y + 32
isPickedUp = 1
return x, y, isPickedUp
end
end

function frogMove6(x, y, isPickedUp)

if isPickedUp == 2 then
x = x 
y = y + 64
isPickedUp = 1
return x, y, isPickedUp
end
end