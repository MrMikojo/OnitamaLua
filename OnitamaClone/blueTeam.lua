    
    bluePawns = {}
 
    -- created empty table for BluePawns to be in

function blueTeamLoad()
    wf = require('lib/windfield/windfield')
    -- load all the sprites first
    blueKingSprite = love.graphics.newImage("sprites/blueKing.png")
    bluePawnSprite = love.graphics.newImage("sprites/bluePawn.png")


    blueKing = {}


        
        blueKing.isAlive = true -- this will be set to false when blueKing. dies
        -- should BlueKing also be a table?
        blueKing.x = 64 + 16 -- position of BlueKing
        blueKing.y = 96 + 16
        blueKing.width = 30
        blueKing.height = 30
        blueKing.radius = 16
        blueKing.isPickedUp = 1
        blueKing.team = "blue"
        blueKing.isKing = 1
        blueKing.hp = 1

        blueKing.tigerMove = 0
        blueKing.roosterMove = 0
        blueKing.dragonMove = 0
        blueKing.elephantMove = 0
        blueKing.cobraMove = 0
        blueKing.mantisMove = 0
        blueKing.frogMove = 0
    table.insert(bluePawns,blueKing)

    blueKingStatus = blueKing.isPickedUp


    --[[
    world = wf.newWorld(0,0, false)

    world:addCollisionClass("BlueTile")

    _G.tileColliders = {}

    print(#tileColliders)
    ]]

  --  print(#bluePawns)

    bp1 = {}
        bp1.x = 64 + 16
        bp1.y = 32 + 16
        bp1.width = 30
        bp1.height = 30
        bp1.radius = 16
        bp1.isAlive = true -- same variables from king
        bp1.hp = 1
        bp1.isPickedUp = 1 -- will be used to move around
        bp1.team = "blue"
        bp1.isKing = 0

        bp1.tigerMove = 0
        bp1.roosterMove = 0
        bp1.dragonMove = 0
        bp1.elephantMove = 0
        bp1.cobraMove = 0
        bp1.mantisMove = 0
        bp1.frogMove = 0



    table.insert(bluePawns,bp1)

    bp2 = {}
        bp2.x = 64 + 16
        bp2.y = 64 + 16
        bp2.width = 30
        bp2.height = 30
        bp2.radius = 16
        bp2.isAlive = true
        bp2.isPickedUp = 1
        bp2.hp = 1
        bp2.team = "blue"
        bp2.isKing = 0

        bp2.tigerMove = 0
        bp2.roosterMove = 0
        bp2.dragonMove = 0
        bp2.elephantMove = 0
        bp2.cobraMove = 0
        bp2.mantisMove = 0
        bp2.frogMove = 0



    table.insert(bluePawns,bp2)

  --  print(#bluePawns)


    bp3 = {}
        bp3.x = 64 + 16
        bp3.y = 128 + 16
        bp3.radius = 16
        bp3.width = 30
        bp3.height = 30
        bp3.isAlive = true
        bp3.isPickedUp = 1
        bp3.hp = 1
        bp3.team = "blue"
        bp3.isKing = 0

         bp3.tigerMove = 0
         bp3.roosterMove = 0
         bp3.dragonMove = 0
       bp3.elephantMove = 0
       bp3.cobraMove = 0
       bp3.mantisMove = 0
       bp3.frogMove = 0


    table.insert(bluePawns,bp3)

    bp4 = {}
        bp4.x = 64 + 16
        bp4.y = 160 + 16
        bp4.width = 30
        bp4.height = 30
        bp4.radius = 16
        bp4.isAlive = true
        bp4.isPickedUp = 1
        bp4.team = "blue"
        bp4.hp = 1
        bp4.isKing = 0


        bp4.tigerMove = 1
        bp4.roosterMove = 0
        bp4.dragonMove = 0
        bp4.elephantMove = 0
        bp4.cobraMove = 0
        bp4.mantisMove = 0
        bp4.frogMove = 0


    table.insert(bluePawns,bp4)

    print(#bluePawns)

end




function blueTeamUpdate(dt)

 --   bluePawns.update(dt)
    

end



function blueTeamDraw()


    --[[ commented out for testing
    for i,b in ipairs(bluePawns) do

       if bp1.isPickedUp == 1 then

            love.graphics.draw(bluePawnSprite, bp1.x - 16, bp1.y - 16)


        end

        if blueKing.isPickedUp == 1 then
            love.graphics.draw(blueKingSprite, blueKing.x - 16, blueKing.y -16)

        end

       if bp2.isPickedUp == 1 then

        love.graphics.draw(bluePawnSprite, bp2.x - 16, bp2.y - 16)

       end

       if bp3.isPickedUp == 1 then
        love.graphics.draw(bluePawnSprite, bp3.x - 16, bp3.y - 16)
       end

       if bp4.isPickedUp == 1 then
        love.graphics.draw(bluePawnSprite, bp4.x - 16, bp4.y - 16)
       end
       ]]

          -- Draw blue king
 

    -- Draw blue pawns
    for _, B in ipairs(bluePawns) do
        if B.isPickedUp == 1 then
            love.graphics.draw(bluePawnSprite, B.x - 16, B.y - 16)
        end
    end


    if blueKing.isPickedUp == 1 and blueKing.hp == 1 then
        love.graphics.draw(blueKingSprite, blueKing.x - 16, blueKing.y - 16)
    end

end

--[[


            love.graphics.draw(bluePawnSprite, bp2.x - 16, bp2.y - 16)
            love.graphics.draw(bluePawnSprite, bp3.x - 16, bp3.y - 16)
            love.graphics.draw(bluePawnSprite, bp4.x - 16, bp4.y - 16)


    for i, B in pairs(bluePawns) do
        if B.isPickedUp == 1 then

            love.graphics.draw(blueKingSprite, blueKing.x - 16, blueKing.y -16)

           -- love.graphics.print(tostring(B.isPickedUp), love.graphics.getHeight(), love.graphics.getWidth()/2)
        
        elseif B.isPickedUp == 2 then

            
           -- spawnHighBoxes(B.x,B.y)

        end
    end
    ]]


--[[
function spawnBluePawn()

    local bluePawn = {}

        bluePawn.x = 0
        bluePawn.y = 0

    
    local side = #bluePawns + 1

    if side == 1 then 
        bluePawnX = 64
        bluePawnY = 32

    elseif side == 2 then 
        bluePawnX = 64
        bluePawnY = 64
    end
    table.insert(bluePawns,bluePawn)
end
]]
--(#bluePawns)



