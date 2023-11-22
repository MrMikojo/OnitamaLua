Bases = {}

function checkStuffLoad()
    redBaseSprite = love.graphics.newImage("sprites/redBase.png")
    blueBaseSprite = love.graphics.newImage("sprites/blueBase.png")
    tigerBlueInst = love.graphics.newImage("sprites/blueTigerInst.png")
    tigerRedInst = love.graphics.newImage("sprites/redTigerInst.png")
    dragonBlueInst = love.graphics.newImage("sprites/blueDragonInst2.png")
    dragonRedInst = love.graphics.newImage("sprites/redDragonInst.png")

    redRoosterInst = love.graphics.newImage("sprites/redRoosterInst.png")
    blueRoosterInst = love.graphics.newImage("sprites/blueRoosterInst.png")

    redCobraInst = love.graphics.newImage("sprites/redCobraInst.png")
    blueCobraInst = love.graphics.newImage("sprites/blueCobraInst.png")

    redFrogInst = love.graphics.newImage("sprites/redFrogInst.png")
    blueFrogInst = love.graphics.newImage("sprites/blueFrogInst.png")


    blueBannerSprite1 = tigerBlueInst
    blueBannerSprite2 = dragonBlueInst

    redBannerSprite1 = tigerBlueInst
    redBannerSprite2 = dragonBlueInst


    cardSlots = {}
        blueSlot1 = {}
            blueSlot1.x = 0
            blueSlot1.num = 1

            blueSlot1.y = 32
        table.insert(cardSlots, blueSlot1)

        blueSlot2 = {}
            blueSlot2.x = 0 
            blueSlot2.num = 2

            blueSlot2.y = 128
            table.insert(cardSlots, blueSlot2)


        redSlot1 = {}
        redSlot1.x = 224
        redSlot1.y = 32
        redSlot1.num = 3

        redSlot1.name = 1

        table.insert(cardSlots, redSlot1)


        redSlot2 = {}

        redSlot2.x = 224
        redSlot2.y = 128
        redSlot2.num = 4

        table.insert(cardSlots, redSlot2)

    -- Slots are done, now to make the checkSlots function



    redBase = {}

    redBase.x = 192 + 16 -- position ofredKing
        
       redBase.y = 96 + 16
       redBase.radius = 16
       redBase.team = "red"
       redBase.hp = 1

    table.insert(Bases, redBase)


    blueBase = {}
        blueBase.hp = 1 
       blueBase.x = 64 + 16 -- position of blueBase
       blueBase.y = 96 + 16
       blueBase.team = "blue"


    table.insert(Bases, blueBase)
    

end


function checkStuffUpdate(dt)
    checkStatusTiger()
    checkStatusRooster()
    checkStatusDragon()
    checkStatusMantis() -- not in use
    checkStatusElephant() -- not in use (yet)
    checkStatusCobra()
    checkStatusFrog()
    WinCondition1()
    checkSlots()

    for i, card in ipairs(cards) do
        if card.cardState == "B1" then 

         moveCard(card, card.x, card.y, cards)

        elseif card.cardState == "R1" then 

            moveCard(card, card.x, card.y, cards)

        end
    end

    
    for i=#redPawns, 1, -1 do -- checks last index
        local r = redPawns[i] -- sets local z to be the current index being looked at
        if r.hp == 0 then -- checks if zombie dead variable is true
            table.remove(redPawns, i) -- if so then removes zombie at the index being looked at
        end -- this can be copies into bullets for similar effect
    end


    for i=#bluePawns, 1, -1 do -- checks last index
        local b = bluePawns[i] -- sets local z to be the current index being looked at
        if b.hp == 0 then -- checks if zombie dead variable is true
            table.remove(bluePawns, i) -- if so then removes zombie at the index being looked at
        end -- this can be copies into bullets for similar effect
    end


end


function checkStuffDraw()

    for _, B in ipairs(Bases) do

        if redBase.hp == 1 then
            love.graphics.draw(redBaseSprite, redBase.x -16, redBase.y -16)

        end

        if blueBase.hp == 1 then
            love.graphics.draw(blueBaseSprite, blueBase.x -16, blueBase.y -16)
            
        end

    end


   if gameState == 1 then

        love.graphics.draw(blueBannerSprite1,288,0)

        love.graphics.draw(blueBannerSprite2,288,128)

    elseif gameState == 2 then 

        love.graphics.draw(redBannerSprite1,288,0)

        love.graphics.draw(redBannerSprite2,288,128)



end
end
--[[
function destroyPawns()
    for i in ipairs (bluePawns) do
            

        for j in ipairs (redPawns) do
            
            if gameState == 1 then
                if checkCol(bluePawns, redPawns) then
                    redPawn.hp = 0

                end


            elseif gameState == 2 then 
                if checkCol(bluePawns, redPawns) then
                    bluePawn.hp = 0

                end
            end


        end
    end

end
]]

function destroyPawns()
    for i, bluePawn in ipairs(bluePawns) do
        for j, redPawn in ipairs(redPawns) do
            if gameState == 1 then
                if checkCol(bluePawn, redPawn) then
                    redPawn.hp = 0
                end


            elseif gameState == 2 then 
                if checkCol(bluePawn, redPawn) then
                    bluePawn.hp = 0
                end
            end
        end
    end
end


function WinCondition1()

    for i, bluePawn in ipairs(bluePawns) do
        for j, redPawn in ipairs(redPawns) do
            if redKing.hp == 0 then
                gameState = 4

            elseif blueKing.hp == 0 then
                gameState = 3


            elseif redKing.x == 64 + 16 and redKing.y == 96 + 16 then
                gameState = 4

            elseif blueKing.x == 192 + 16 and blueKing.y == 96 + 16 then
                gameState = 3

            end

        end
    end
end



function checkSlots()

 --   for i, S in ipairs (cardSlots) do 
        for j, C in ipairs (cards) do 
            
            if C.x == 0 then
                if C.y == 32 then
               -- if S.slotnum == 1 then
                
                    if C.cardName == "tiger" then
                        blueBannerSprite1 = tigerBlueInst
                     --   print("STILL WORKING!!!!")
                    elseif C.cardName == "dragon" then
                        blueBannerSprite1 = dragonBlueInst


                    elseif C.cardName == "rooster" then

                        blueBannerSprite1 = blueRoosterInst

                    elseif C.cardName == "cobra" then
                        blueBannerSprite1 = blueCobraInst

                    elseif C.cardName == "frog" then
                        blueBannerSprite1 = blueFrogInst

                    end

                end
                
                ---            elseif C.x and C.y == blueSlot2.x and blueSlot2.y then
            elseif C.x == 0 then 
              if  C.y == 128 then 

               -- if S.slotnum == 2 then
                    if C.cardName == "tiger" then
                        blueBannerSprite2 = tigerBlueInst

                    elseif C.cardName == "dragon" then
                        blueBannerSprite2 = dragonBlueInst


                    elseif C.cardName == "rooster" then

                        blueBannerSprite2 = blueRoosterInst
                    --  print("STILL WORKING!!!!")
                    elseif C.cardName == "cobra" then
                        blueBannerSprite2 = blueCobraInst

                    elseif C.cardName == "frog" then
                        blueBannerSprite2 = blueFrogInst
                    
                    end
                end
             --   end
            elseif C.x == 224 then
                
            
                 if C.y == 32 then


                    --if S.slotnum == 3 then
                    if C.cardName == "tiger" then
                        redBannerSprite1 = tigerRedInst  

                    elseif C.cardName == "dragon" then
                        redBannerSprite1 = dragonRedInst
                         --       print("is this working????")

                    elseif C.cardName == "rooster" then
                        redBannerSprite1 = redRoosterInst

                    elseif C.cardName == "cobra" then
                        redBannerSprite1 = redCobraInst
                        print("is this working????")
                    elseif C.cardName == "frog" then
                        redBannerSprite1 = redFrogInst
                    end
                end

            

        elseif C.x > 200 then
         if C.y > 100 then
          --  if S.slotnum == 4 then
                if C.cardName == "tiger" then
                    redBannerSprite2 = tigerRedInst  

                elseif C.cardName == "dragon" then
                    redBannerSprite2 = dragonRedInst

                elseif C.cardName == "rooster" then
                    redBannerSprite2 = redRoosterInst

                elseif C.cardName == "cobra" then
                    redBannerSprite2 = redCobraInst
                    print("is this working????")
                elseif C.cardName == "frog" then
                    redBannerSprite2 = redFrogInst
                end
            end

        end

        end
   -- end
end
--[[ 
function WinCondition2()
    for i, bluePawn in ipairs(bluePawns) do
        for j, redPawn in ipairs(redPawns) do

            --Was going to add tile collision but decided to make bases like goal posts

        end
    end
end
]]
function checkStatusTiger()

    for i, c in ipairs (cards) do 
      --  print("is this working?")

        
        if tiger.cardName == "tiger" and tiger.cardState == "B1" then
            --blueBannerSprite1 = tigerBlueInst

            for _, B in ipairs(bluePawns) do
               -- print("is this working?")
                        
                B.tigerMove = 1

                    if B.isPickedUp == 2 then
                            
                            

                    print ("yes")
                    --spawnHighBoxes(bp1.x, bp1.y)



                end
            end


        elseif tiger.cardName == "tiger" and tiger.cardState ==  "B2" then

           -- blueBannerSprite2 = tigerBlueInst
                for _, B in ipairs(bluePawns) do
                  --  print("is this working?")
                            
                    B.tigerMove = 1
    
                        if B.isPickedUp == 2 then
                                
                                
    
                        --print ("yes")
                        --spawnHighBoxes(bp1.x, bp1.y)
    
    
    
                        end
                end
            

        elseif tiger.cardName == "tiger" and tiger.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.tigerMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.tigerMove = 0
         
                end

            -- removed or statements, things just were working with them
                

        elseif tiger.cardName == "tiger" and tiger.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.tigerMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.tigerMove = 0
               
                end
        
                

        elseif tiger.cardName == "tiger" and tiger.cardState == "R1" then
            --redBannerSprite1 = tigerRedInst
            for i, R in ipairs(redPawns) do 
                R.tigerMove = 1
          
            end
        
        elseif tiger.cardName == "tiger" and tiger.cardState == "R2" then

            --redBannerSprite2 = tigerRedInst
            for i, R in ipairs(redPawns) do 
                R.tigerMove = 1
           
            end
        
        

            --ROOSTER MOVES START HERE....
        end


    end


end

function checkStatusRooster()

    for i, c in ipairs (cards) do 
      --  print("is this working?")

        
        if rooster.cardName == "rooster" and rooster.cardState == "B1" then
            --blueBannerSprite1 = blueRoosterInst

            for _, B in ipairs(bluePawns) do
               -- print("is this working?")
                        
                B.roosterMove = 1

                    if B.isPickedUp == 2 then
                            
                            

                 --   print ("yes")
                    --spawnHighBoxes(bp1.x, bp1.y)



                end
            end


        elseif rooster.cardName == "rooster" and rooster.cardState ==  "B2" then

            --blueBannerSprite2 = blueRoosterInst

                for _, B in ipairs(bluePawns) do
                 --   print("is this working?")
                            
                    B.roosterMove = 1
    
                        if B.isPickedUp == 2 then
                                
                                
    
                     --   print ("yes")
                        --spawnHighBoxes(bp1.x, bp1.y)
    
    
    
                        end
                end
            

        elseif rooster.cardName == "rooster" and rooster.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.roosterMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.roosterMove = 0
         
                end

            -- removed or statements, things just were working with them
                

        elseif rooster.cardName == "rooster" and rooster.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.roosterMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.roosterMove = 0
               
                end
        
                

        elseif rooster.cardName == "rooster" and rooster.cardState == "R1" then

            --redBannerSprite1 = redRoosterInst

            for i, R in ipairs(redPawns) do 
                R.roosterMove = 1
          
            end
        
        elseif rooster.cardName == "rooster" and rooster.cardState == "R2" then
            --redBannerSprite2 = redRoosterInst
            for i, R in ipairs(redPawns) do 
                R.roosterMove = 1
           
            end
        
        

            --ROOSTER MOVES START HERE....
        end


    end


end

--[[ lost track of where I was going with this...

function updateCardMoves(cardState, cardName, team, dragonMove,tigerMove,roosterMove)
--trying to make function that will speed up updating tiles available moves
    if cardName == "dragon" and cardState == "B2" then
        if team == "blue" then
            dragonMove = 1
        end
    
    elseif cardName == "dragon" and cardState == "B1" then
        if team == "blue" then
            dragonMove = 1
        end
    end


end

moving on...
]]

function checkStatusDragon()

    for i, c in ipairs (cards) do 

        if dragon.cardName == "dragon" and dragon.cardState == "B1" then
            --blueBannerSprite1 = dragonBlueInst
            for _, B in ipairs(bluePawns) do
              --  print("RAWR!!!")
                        
                B.dragonMove = 1

                    if B.isPickedUp == 2 then
                            
                   -- print ("DRAAAGON!!!")

                end
            end


        elseif dragon.cardName == "dragon" and dragon.cardState ==  "B2" then
            --blueBannerSprite2 = dragonBlueInst
                for _, B in ipairs(bluePawns) do
                  --  print("RAAAAAAWRR!!!!")
                            
                    B.dragonMove = 1
    
                        if B.isPickedUp == 2 then

                     --   print ("DRAAAGONNNN!!!")

                        end
                end

        elseif dragon.cardName == "dragon" and dragon.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.dragonMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.dragonMove = 0
         
                end

        elseif dragon.cardName == "dragon" and dragon.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.dragonMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.dragonMove = 0
               
                end


        elseif dragon.cardName == "dragon" and dragon.cardState == "R1" then
            --redBannerSprite1 = dragonRedInst

            for i, R in ipairs(redPawns) do 
                R.dragonMove = 1
          
            end
        
        elseif dragon.cardName == "dragon" and dragon.cardState == "R2" then
            --redBannerSprite2 = dragonRedInst
            for i, R in ipairs(redPawns) do 
                R.dragonMove = 1
           
            end
        end
    end
end

function checkStatusMantis()
    for i, c in ipairs(cards) do
        if c.cardName == "mantis" then
            if c.cardState == "B1" or c.cardState == "B2" then
                for _, B in ipairs(bluePawns) do
                    B.mantisMove = 1
                    if B.isPickedUp == 2 then
                        -- Handle movement logic if the pawn is picked up
                    end
                end
            elseif c.cardState == "N1" or c.cardState == "N2" then
                for _, B in ipairs(bluePawns) do
                    B.mantisMove = 0
                end
                for _, R in ipairs(redPawns) do
                    R.mantisMove = 0
                end
            elseif c.cardState == "R1" or c.cardState == "R2" then
                for _, R in ipairs(redPawns) do
                    R.mantisMove = 1
                end
            end
        end
    end
end

function checkStatusElephant()

    for i, c in ipairs (cards) do 

        if elephant.cardName == "elephant" and elephant.cardState == "B1" then

            for _, B in ipairs(bluePawns) do
                        
                B.elephantMove = 1

                    if B.isPickedUp == 2 then
                            

                end
            end


        elseif elephant.cardName == "elephant" and elephant.cardState ==  "B2" then

                for _, B in ipairs(bluePawns) do

                            
                    B.elephantMove = 1
    
                        if B.isPickedUp == 2 then


                        end
                end

        elseif elephant.cardName == "elephant" and elephant.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.elephantMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.elephantMove = 0
         
                end

        elseif elephant.cardName == "elephant" and elephant.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.elephantMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.elephantMove = 0
               
                end


        elseif elephant.cardName == "elephant" and elephant.cardState == "R1" then
            for i, R in ipairs(redPawns) do 
                R.elephantMove = 1
          
            end
        
        elseif elephant.cardName == "elephant" and elephant.cardState == "R2" then
            for i, R in ipairs(redPawns) do 
                R.elephantMove = 1
           
            end
        end
    end
end

function checkStatusCobra()

    for i, c in ipairs (cards) do 

        if cobra.cardName == "cobra" and cobra.cardState == "B1" then
            --blueBannerSprite1 = blueCobraInst

            for _, B in ipairs(bluePawns) do
                        
                B.cobraMove = 1

                    if B.isPickedUp == 2 then
                            

                end
            end


        elseif cobra.cardName == "cobra" and cobra.cardState ==  "B2" then
            --blueBannerSprite2 = blueCobraInst
                for _, B in ipairs(bluePawns) do

                            
                    B.cobraMove = 1
    
                        if B.isPickedUp == 2 then


                        end
                end

        elseif cobra.cardName == "cobra" and cobra.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.cobraMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.cobraMove = 0
         
                end

        elseif cobra.cardName == "cobra" and cobra.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.cobraMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.cobraMove = 0
               
                end


        elseif cobra.cardName == "cobra" and cobra.cardState == "R1" then
                
            --redBannerSprite1 = redCobraInst
            for i, R in ipairs(redPawns) do 
                R.cobraMove = 1
          
            end
        
        elseif cobra.cardName == "cobra" and cobra.cardState == "R2" then
 --           redBannerSprite2 = redCobraInst
            for i, R in ipairs(redPawns) do 
                R.cobraMove = 1
           
            end
        end
    end
end


function checkStatusFrog()

    for i, c in ipairs (cards) do 

        if frog.cardName == "frog" and frog.cardState == "B1" then
            
   --         blueBannerSprite1 = blueFrogInst
            for _, B in ipairs(bluePawns) do
                        
                B.frogMove = 1

                    if B.isPickedUp == 2 then
                            

                end
            end


        elseif frog.cardName == "frog" and frog.cardState ==  "B2" then

     --       blueBannerSprite2 = blueFrogInst

                for _, B in ipairs(bluePawns) do

                            
                    B.frogMove = 1
    
                        if B.isPickedUp == 2 then


                        end
                end

        elseif frog.cardName == "frog" and frog.cardState == "N1" then
                for _, B in ipairs(bluePawns) do 
                    B.frogMove = 0

                end

                for i, R in ipairs(redPawns) do 
                    R.frogMove = 0
         
                end

        elseif frog.cardName == "frog" and frog.cardState == "N2" then
                for i, B in ipairs(bluePawns) do 
                    B.frogMove = 0
     
                end

                for i, R in ipairs(redPawns) do 
                    R.frogMove = 0
               
                end


        elseif frog.cardName == "frog" and frog.cardState == "R1" then

       --     redBannerSprite1 = redFrogInst
            for i, R in ipairs(redPawns) do 
                R.frogMove = 1
          
            end
        
        elseif frog.cardName == "frog" and frog.cardState == "R2" then
         --   redBannerSprite2 = redFrogInst
            for i, R in ipairs(redPawns) do 
                R.frogMove = 1
           
            end
        end
    end
end






--  ALL THE MOVES ARE DONE(for now)!!! 

-- need to make a function that checks if two cards are in the same position then move one to open slot.


function checkCol(a, b)
    return a.x < b.x + b.width and
           b.x < a.x + a.width and
           a.y < b.y + b.height and
           b.y < a.y + a.height
end

--[[
function checkCol(a,b)
	if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
		return true
	else
		return false
	end
end
]]

function checkCollision(card, otherCard)
    if card.cardState == "N1" or card.cardState == "N2" then
        -- If the card is in a neutral zone, no collision adjustment is needed
        return card.x, card.y
    end

    local collisionDistance = 5 -- Adjust this value as needed

    if math.abs(card.x - otherCard.x) < collisionDistance and math.abs(card.y - otherCard.y) < collisionDistance then
        -- If there's a collision, move the other card to the right (or any other adjustment you want)
        return otherCard.x, otherCard.y + 96
    end

    return otherCard.x, otherCard.y
end


-- Adjust this function based on how you want to resolve collisions

function moveCard(card, x, y, allCards)
    -- Update the card's position
    card.x, card.y = x, y

    -- Check for collisions with other cards and adjust positions if needed
    for _, otherCard in ipairs(allCards) do
        if otherCard ~= card then
            local newX, newY = checkCollision(card, otherCard)
            otherCard.x, otherCard.y = newX, newY
        end
    end
end

--[[
function checkCollision(card, otherCard)
    if card.cardState == "N1" or card.cardState == "N2" then
        -- If the card is in a neutral zone, no collision adjustment is needed
        return card.x, card.y
    end

    local collisionDistance = 5 -- Adjust this value as needed

    if math.abs(card.x - otherCard.x) < collisionDistance and math.abs(card.y - otherCard.y) < collisionDistance then
        -- If there's a collision, move the other card to the right (or any other adjustment you want)
        return otherCard.x + 96, otherCard.y
    end

    return otherCard.x, otherCard.y
end

]]