function checkStuffLoad()
    
    redBaseSprite = love.graphics.newImage("sprites/redBase.png")
    blueBaseSprite = love.graphics.newImage("sprites/blueBase.png")


    redBase = {}

    redBase.x = 192 + 16 -- position ofredKing
        
       redBase.y = 96 + 16
       redBase.radius = 16
       redBase.team = "red"
       redBase.hp = 1

end


function checkStuffUpdate(dt)
    checkStatusTiger()
    checkStatusRooster()
    checkStatusDragon()
    checkStatusMantis()
    checkStatusElephant()
    checkStatusCobra()

    for i, card in ipairs(cards) do
        if card.cardState == "B1" then 

         moveCard(card, card.x, card.y, cards)

        elseif card.cardState == "R1" then 

            moveCard(card, card.x, card.y, cards)

        end
    end

end


function checkStuffDraw()

    for _, R in ipairs(redBase) do

        if redBase.hp == 1 then
            love.graphics.draw(redBaseSprite, redBase.x -16, redBase.y -16)
        end
    end
end





function checkStatusTiger()

    for i, c in ipairs (cards) do 
      --  print("is this working?")

        
        if tiger.cardName == "tiger" and tiger.cardState == "B1" then

            for _, B in ipairs(bluePawns) do
                print("is this working?")
                        
                B.tigerMove = 1

                    if B.isPickedUp == 2 then
                            
                            

                    print ("yes")
                    --spawnHighBoxes(bp1.x, bp1.y)



                end
            end


        elseif tiger.cardName == "tiger" and tiger.cardState ==  "B2" then

                for _, B in ipairs(bluePawns) do
                    print("is this working?")
                            
                    B.tigerMove = 1
    
                        if B.isPickedUp == 2 then
                                
                                
    
                        print ("yes")
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
            for i, R in ipairs(redPawns) do 
                R.tigerMove = 1
          
            end
        
        elseif tiger.cardName == "tiger" and tiger.cardState == "R2" then
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

            for _, B in ipairs(bluePawns) do
                print("is this working?")
                        
                B.roosterMove = 1

                    if B.isPickedUp == 2 then
                            
                            

                    print ("yes")
                    --spawnHighBoxes(bp1.x, bp1.y)



                end
            end


        elseif rooster.cardName == "rooster" and rooster.cardState ==  "B2" then

                for _, B in ipairs(bluePawns) do
                    print("is this working?")
                            
                    B.roosterMove = 1
    
                        if B.isPickedUp == 2 then
                                
                                
    
                        print ("yes")
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
            for i, R in ipairs(redPawns) do 
                R.roosterMove = 1
          
            end
        
        elseif rooster.cardName == "rooster" and rooster.cardState == "R2" then
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

            for _, B in ipairs(bluePawns) do
                print("RAWR!!!")
                        
                B.dragonMove = 1

                    if B.isPickedUp == 2 then
                            
                    print ("DRAAAGON!!!")

                end
            end


        elseif dragon.cardName == "dragon" and dragon.cardState ==  "B2" then

                for _, B in ipairs(bluePawns) do
                    print("RAAAAAAWRR!!!!")
                            
                    B.dragonMove = 1
    
                        if B.isPickedUp == 2 then

                        print ("DRAAAGONNNN!!!")

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
            for i, R in ipairs(redPawns) do 
                R.dragonMove = 1
          
            end
        
        elseif dragon.cardName == "dragon" and dragon.cardState == "R2" then
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

            for _, B in ipairs(bluePawns) do
                        
                B.cobraMove = 1

                    if B.isPickedUp == 2 then
                            

                end
            end


        elseif cobra.cardName == "cobra" and cobra.cardState ==  "B2" then

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
            for i, R in ipairs(redPawns) do 
                R.cobraMove = 1
          
            end
        
        elseif cobra.cardName == "cobra" and cobra.cardState == "R2" then
            for i, R in ipairs(redPawns) do 
                R.cobraMove = 1
           
            end
        end
    end
end


-- need to make a function that checks if two cards are in the same position then move one to open slot.

--[[
function checkCollision(card1, card2)
    return card1.x < card2.x + card2.width and
           card2.x < card1.x + card1.width and
           card1.y < card2.y + card2.height and
           card2.y < card1.y + card1.height
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