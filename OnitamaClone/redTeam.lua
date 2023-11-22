    
    redPawns = {}

    -- created empty table for redPawns to be in

function redTeamLoad()
    wf = require('lib/windfield/windfield')
    -- load all the sprites first

    redPawnSprite = love.graphics.newImage("sprites/redPawn.png")
    redKingSprite = love.graphics.newImage("sprites/redKing.png")
    

   redKing = {}

    redKing.isAlive = true -- this will be set to false whenredKing. dies
    redKing.hp = 1 -- maybe use hp instead?
        -- shouldredKing also be a table?
       redKing.x = 192 + 16 -- position ofredKing
       redKing.y = 96 + 16
        redKing.width = 30
        redKing.height = 30
        redKing.hp = 1  
        redKing.isKing = 1


       redKing.radius = 16
       redKing.team = "red"

       redKing.isPickedUp = 1

       redKing.tigerMove = 0
       redKing.roosterMove = 0
       redKing.dragonMove = 0
       redKing.elephantMove = 0
       redKing.cobraMove = 0
       redKing.mantisMove = 0
       redKing.frogMove = 0



    table.insert(redPawns,redKing)




  --  print(#redPawns)

    rp1 = {}
        rp1.x = 192 + 16
        rp1.y = 32 +16
        rp1.radius = 16
        rp1.width = 30
        rp1.height = 30
        rp1.isPickedUp = 1
        rp1.hp = 1  
        rp1.team = "red"
        rp1.isKing = 0


        rp1.tigerMove = 0
        rp1.roosterMove = 0
        rp1.dragonMove = 0

        rp1.elephantMove = 0
        rp1.cobraMove = 0
        rp1.mantisMove = 0
        rp1.frogMove = 0


    table.insert(redPawns,rp1)

    rp2 = {}
        rp2.x = 192 + 16
        rp2.y = 64 + 16
        rp2.width = 30
        rp2.radius = 16
        rp2.height = 30
        rp2.isPickedUp = 1
        rp2.team = "red"
        rp2.hp = 1  
        rp2.isKing = 0



        rp2.tigerMove = 0
        rp2.roosterMove = 0
        rp2.dragonMove = 0
        rp2.elephantMove = 0
        rp2.cobraMove = 0
        rp2.mantisMove = 0
        rp2.frogMove = 0


        table.insert(redPawns,rp2)

 --   print(#redPawns)


    rp3 = {}
        rp3.x = 192 + 16
        rp3.y = 128 + 16
        rp3.width = 30
        rp3.height = 30
        rp3.radius = 16
        rp3.isPickedUp = 1
        rp3.team = "red"
        rp3.hp = 1  
        rp3.isKing = 0


        rp3.tigerMove = 0
        rp3.roosterMove = 0
        rp3.dragonMove = 0
        rp3.elephantMove = 0
        rp3.cobraMove = 0
        rp3.mantisMove = 0
        rp3.frogMove = 0

        table.insert(redPawns,rp3)

    rp4 = {}
        rp4.x = 192 + 16
        rp4.y = 160 + 16
        rp4.width = 30
        rp4.radius = 16
        rp4.isPickedUp = 1
        rp4.height = 30
        rp4.team = "red"
        rp4.hp = 1  
        rp4.isKing = 0


        rp4.tigerMove = 0
        rp4.roosterMove = 0
        rp4.dragonMove = 0
        rp4.elephantMove = 0
        rp4.cobraMove = 0
        rp4.mantisMove = 0
        rp4.frogMove = 0

        table.insert(redPawns,rp4)

  --  print(#redPawns)

end




function redTeamUpdate(dt)

    --redPawns:update(dt)
    

end



function redTeamDraw()
    -- copied from blueTeam file
    for _, R in ipairs(redPawns) do
        if R.isPickedUp == 1 then
            love.graphics.draw(redPawnSprite, R.x - 16, R.y -16)
        end
    end


    if redKing.isPickedUp == 1 and redKing.hp == 1 then
        love.graphics.draw(redKingSprite, redKing.x -16, redKing.y -16)
    end


end 

--[[
function spawnredPawn()

    local redPawn = {}

        redPawn.x = 0
        redPawn.y = 0

    
    local side = #redPawns + 1

    if side == 1 then 
        redPawnX = 64
        redPawnY = 32

    elseif side == 2 then 
        redPawnX = 64
        redPawnY = 64
    end
    table.insert(redPawns,redPawn)
end
]]
--print(#redPawns)




