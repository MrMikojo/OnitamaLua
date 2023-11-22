-- lets make this in 2D top down view then we can change to
-- isometric later on
require("gameMap")

--require("tiles")
require("extra")
require("blueTeam")
require("redTeam")
require("logic")
require("cards")
require("checkStuff")

--[[
This is a project where the goal is to make an "Onitama" clone
What do you need to play Onitama?

    -- Board - DONE
    -- Player 1 and 2
    -- Mentor Peice (2 total)
    -- Student Pieces (8 total)
    -- Temple Tiles (2)
    -- Deck of moves (9 base with 3 extras)
    -- Win Conditions (2)

    -- Other stuff I want to add:
    -- Animations
    -- Sounds
    -- Music
    -- Pop up menu for each card

    -- Bonus: make WindSpirit mod (expansion)
    -- Extra Bonus: make enemy AI mod

]] 




function love.load()
    logicLoad()
    sprites = {}
    anim8 = require("lib/anim8/anim8")

    lume = require("lib/lume/lume")

    tile = love.graphics.newImage("sprites/tile.png")

    _G.sti = require("lib/sti")
    gameMap = sti("gameMap.lua")
    
    graveyard = love.graphics.newImage("sprites/graveyard.png")

    sprites.background = love.graphics.newImage("sprites/background-Sheet.png")
   
    background = sprites.background
    -- WINDOW_WIDTH = 256 --first difference is that we declared resolution in the main file, not conf
    -- WINDOW_HEIGHT = 244 -- made them both 720p this time
    
    local  grid = anim8.newGrid(background:getWidth()/25, background:getHeight() / 1, background:getWidth(), background:getHeight() )
    
    animations = {}

    animations.background = anim8.newAnimation(grid("1-25",1), 0.420)

    loadMap()

 -- gameBoard:load()

    blueTeamLoad()
    redTeamLoad()
    cardsLoad()
    checkStuffLoad()
    extraLoad()
   
    -- background is 25 frames

    sounds = {
        ["tick"] = love.audio.newSource("sounds/tick.wav", "static")



    }

	midFont = love.graphics.newFont("font.ttf", 15)

	love.graphics.setFont(midFont)
end

function love.update(dt)
    
    gameMap:update(dt)
--    gameBoard:update(dt)
    extraUpdate(dt)
    -- blue team and read team have been added, but no movement
    blueTeamUpdate(dt)
    redTeamUpdate(dt)
    cardsUpdate(dt)
    --checkCardState(dt)
   -- checkCardStatus(dt)
    -- need to add cards, most of the game's main logic will be with the cards
    logicUpdate(dt) 
    animations.background:update(dt)

    checkStuffUpdate(dt)
    
    --blueKingStatus:update(dt)


    -- rooster moves 

    if love.keyboard.isDown("r") and love.keyboard.isDown("1") then

        if gameState == 2 then
                
                for i, R in ipairs (redPawns) do 

                    if R.isPickedUp == 2 and R.roosterMove == 1 then
                        local newX, newY = roosterMove5(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1      
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "rooster" then
                                T.cardState = "N2"
                                


                            elseif T.cardState == "R2" and T.cardName == "rooster" then
                                T.cardState = "N2"

                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
                                    moveCard(T, T.x, T.y, cards)

                            end
                        end
                        destroyPawns()
                            gameState = 1
                            sounds["tick"]:play()                       
                    end
                    end
                end

        elseif gameState == 1 then
                for i, B in ipairs (bluePawns) do


                    if B.isPickedUp == 2 and B.roosterMove == 1 then
                         --   print("About to call rosterMove1")
                         local newX, newY = roosterMove1(B.x, B.y, B.isPickedUp)
    
                         -- Check for collisions with pawns of the same color
                         local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                         local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
         
                         if noCollision and notOutOfBounds then
     
                             B.x, B.y, B.isPickedUp = newX, newY, 1
     
                        for I, T in ipairs (cards) do
                            if T.cardState == "B1" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "B2" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "N2" then
                                    T.cardState = "B1"

                            end
                        end
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
                end
        end

    end

    if love.keyboard.isDown("r") and love.keyboard.isDown("2") then

        if gameState == 2 then
                
                for i, R in ipairs (redPawns) do 

                    if R.isPickedUp == 2 and R.roosterMove == 1 then
                        local newX, newY = roosterMove6(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "rooster" then
                                T.cardState = "N2"
                                


                            elseif T.cardState == "R2" and T.cardName == "rooster" then
                                T.cardState = "N2"

                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
                                    moveCard(T, T.x, T.y, cards)

                            end
                        end
                        destroyPawns()
                            gameState = 1
                            sounds["tick"]:play()                       
                    end
                    end
                end

        elseif gameState == 1 then
                for i, B in ipairs (bluePawns) do


                    if B.isPickedUp == 2 and B.roosterMove == 1 then
                        local newX, newY = roosterMove2(B.x, B.y, B.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                        local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
        
                        if noCollision and notOutOfBounds then
    
                            B.x, B.y, B.isPickedUp = newX, newY, 1
    
                        for I, T in ipairs (cards) do
                            if T.cardState == "B1" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "B2" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "N2" then
                                    T.cardState = "B1"

                            end
                        end
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
                end
        end

    end

    if love.keyboard.isDown("r") and love.keyboard.isDown("3") then

        if gameState == 2 then
                
                for i, R in ipairs (redPawns) do 

                    if R.isPickedUp == 2 and R.roosterMove == 1 then
                        local newX, newY = roosterMove7(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "rooster" then
                                T.cardState = "N2"
                                


                            elseif T.cardState == "R2" and T.cardName == "rooster" then
                                T.cardState = "N2"

                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
                                    moveCard(T, T.x, T.y, cards)

                            end
                        end
                        destroyPawns()
                            gameState = 1
                            sounds["tick"]:play()                       
                    end
                    end
                end

        elseif gameState == 1 then
                for i, B in ipairs (bluePawns) do


                    if B.isPickedUp == 2 and B.roosterMove == 1 then
                        local newX, newY = roosterMove3(B.x, B.y, B.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                        local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
        
                        if noCollision and notOutOfBounds then
    
                            B.x, B.y, B.isPickedUp = newX, newY, 1
    
    
                        for I, T in ipairs (cards) do
                            if T.cardState == "B1" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "B2" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "N2" then
                                    T.cardState = "B1"

                            end
                        end
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
                end
        end

    end


    if love.keyboard.isDown("r") and love.keyboard.isDown("4") then

        if gameState == 2 then
                
                for i, R in ipairs (redPawns) do 

                    if R.isPickedUp == 2 and R.roosterMove == 1 then
                        local newX, newY = roosterMove8(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1
                    
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "rooster" then
                                T.cardState = "N2"
                                


                            elseif T.cardState == "R2" and T.cardName == "rooster" then
                                T.cardState = "N2"

                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
                                    moveCard(T, T.x, T.y, cards)

                            end
                        end
                            gameState = 1
                            sounds["tick"]:play()                       
                    end 
                    end
                end

        elseif gameState == 1 then
                for i, B in ipairs (bluePawns) do


                    if B.isPickedUp == 2 and B.roosterMove == 1 then
                        local newX, newY = roosterMove4(B.x, B.y, B.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                        local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
        
                        if noCollision and notOutOfBounds then
    
                            B.x, B.y, B.isPickedUp = newX, newY, 1
    
    

                        for I, T in ipairs (cards) do
                            if T.cardState == "B1" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "B2" and T.cardName == "rooster" then
                                T.cardState = "N1"


                            elseif T.cardState == "N2" then
                                    T.cardState = "B1"

                            end
                        end
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
                end
        end

    end

    -- tiger forward step
    if love.keyboard.isDown('t') and love.keyboard.isDown('1') then


        if gameState == 1 then
                
              
                for i, B in ipairs (bluePawns) do


                    if B.isPickedUp == 2 and B.tigerMove == 1 then


                          --  print("About to call tigerMove2")
                          local newX, newY = tigerMove1(B.x, B.y, B.isPickedUp)
    
                          -- Check for collisions with pawns of the same color
                          local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                          local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
          
                          if noCollision and notOutOfBounds then
      
                              B.x, B.y, B.isPickedUp = newX, newY, 1
      
      
                        for I, T in ipairs (cards) do
                            if T.cardState == "B1" and T.cardName == "tiger" then
                                T.cardState = "N1"


                            elseif T.cardState == "B2" and T.cardName == "tiger" then
                                T.cardState = "N1"


                            elseif T.cardState == "N2" then
                                    T.cardState = "B1"
        

                            end
                        end

                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
             end
        
        elseif gameState == 2 then
                for i, R in ipairs (redPawns) do


                    if R.isPickedUp == 2 and R.tigerMove == 1 then

                        local newX, newY = tigerMove3(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "tiger" then
                                T.cardState = "N2"


                            elseif T.cardState == "R2" and T.cardName == "tiger" then
                                T.cardState = "N2"


                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
        

                            end
                        end
                        destroyPawns()
                        gameState = 1
                        sounds["tick"]:play()
                    end

                end
            end




        end
       
    end

    -- need to completed dragon moves still
    
    if love.keyboard.isDown('d') and love.keyboard.isDown('1') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.dragonMove == 1 then
                    local newX, newY = dragonMove1(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1



                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                             
                        elseif T.cardState == "B1" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        elseif T.cardState == "B2" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        end

                    end        

                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        
        end
        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.dragonMove == 1 then
                local newX, newY = dragonMove5(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end
        end
        
        end




    end

    end

    if love.keyboard.isDown('d') and love.keyboard.isDown('2') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.dragonMove == 1 then
                    local newX, newY = dragonMove2(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1


                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                             
                        elseif T.cardState == "B1" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        elseif T.cardState == "B2" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        end

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.dragonMove == 1 then

                local newX, newY = dragonMove6(R.x, R.y, R.isPickedUp)
                    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
               R.x, R.y, R.isPickedUp = newX, newY, 1

                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end

        end
        end




    end

    end

    if love.keyboard.isDown('d') and love.keyboard.isDown('3') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.dragonMove == 1 then
                    local newX, newY = dragonMove3(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1


            

                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                             
                        elseif T.cardState == "B1" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        elseif T.cardState == "B2" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        
        end
        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.dragonMove == 1 then

            local newX, newY = dragonMove7(R.x, R.y, R.isPickedUp)
                
            -- Check for collisions with pawns of the same color
            local noCollision = not hasCollisionWithSameColor(R, newX, newY)
            local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

            if noCollision and notOutOfBounds then
    R.x, R.y, R.isPickedUp = newX, newY, 1

                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end

        end
        end

    end

    end

    if love.keyboard.isDown('d') and love.keyboard.isDown('4') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.dragonMove == 1 then
                
                    local newX, newY = dragonMove4(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1



            

                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                             
                        elseif T.cardState == "B1" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        elseif T.cardState == "B2" and T.cardName == "dragon" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        end

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.dragonMove == 1 then

        local newX, newY = dragonMove8(R.x, R.y, R.isPickedUp)
            
        -- Check for collisions with pawns of the same color
        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

            if noCollision and notOutOfBounds then
    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "dragon" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end
        end
        
        end




    end

    end

   -- mantis not needed yet
    if love.keyboard.isDown('m') and love.keyboard.isDown('1') then
        if gameState == 1 then
            for _, B in ipairs(bluePawns) do
                if B.isPickedUp == 2 and B.mantisMove == 1 then
                    local newX, newY = mantisMove1(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1


                    for _, T in ipairs(cards) do
                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        elseif T.cardState == "B1" and T.cardName == "mantis" then
                            T.cardState = "N1"
                        elseif T.cardState == "B2" and T.cardName == "mantis" then
                            T.cardState = "N1"
                        end
                    end
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end
                end
            end
        elseif gameState == 2 then
            for _, R in ipairs(redPawns) do
                if R.isPickedUp == 2 and R.mantisMove == 1 then
                    local newX, newY = mantisMove5(R.x, R.y, R.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                    local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        R.x, R.y, R.isPickedUp = newX, newY, 1
                    for _, T in ipairs(cards) do
                        if T.cardState == "R1" and T.cardName == "mantis" then
                            T.cardState = "N2"
                        elseif T.cardState == "R2" and T.cardName == "mantis" then
                            T.cardState = "N2"
                        elseif T.cardState == "N1" then
                            T.cardState = "R1"
                        end
                    end
                    destroyPawns()
                    gameState = 1
                    sounds["tick"]:play()
                end
            end
            end
        end
    end

    -- tiger back step

    if love.keyboard.isDown('t') and love.keyboard.isDown('2') then
        for i, B in ipairs (bluePawns) do
            if gameState == 1 then

                if B.isPickedUp == 2 and B.tigerMove == 1 then
                    
                    local newX, newY = tigerMove2(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1


                            -- and these parts will need to make the cards rotate
                        for j, T in ipairs (cards) do
                            -- if in B1 

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
                                ]]
                            end


                
                
                        end        
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                end
            end
            elseif gameState == 2 then
                for i, R in ipairs (redPawns) do


                    if R.isPickedUp == 2 and R.tigerMove == 1 then
                        local newX, newY = tigerMove4(R.x, R.y, R.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                        local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
        
                        if noCollision and notOutOfBounds then
                            R.x, R.y, R.isPickedUp = newX, newY, 1
                        for I, T in ipairs (cards) do
                            if T.cardState == "R1" and T.cardName == "tiger" then
                                T.cardState = "N2"


                            elseif T.cardState == "R2" and T.cardName == "tiger" then
                                T.cardState = "N2"


                            elseif T.cardState == "N1" then
                                    T.cardState = "R1"
        

                            end
                        end
                        destroyPawns()
                        gameState = 1
                        sounds["tick"]:play()
                    end
                end
                
            end

        end
    end
    end
    

    
    -- elephant moves

    if love.keyboard.isDown('e') and love.keyboard.isDown('1') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.elephantMove == 1 then
                    local newX, newY = elephantMove1(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1

                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        
                        
                        
                        elseif T.cardState == "B1" and T.cardName == "elephant" then
                            T.cardState = "N1"
                            
                        
                        

                        elseif T.cardState == "B2" and T.cardName == "elephant" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        end

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.elephantMove == 1 then
                local newX, newY = elephantMove5(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1

                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end

        end
        end




    end

    end



    if love.keyboard.isDown('e') and love.keyboard.isDown('2') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.elephantMove == 1 then
                
                    local newX, newY = elephantMove2(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1




                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        
                        
                        
                        elseif T.cardState == "B1" and T.cardName == "elephant" then
                            T.cardState = "N1"
                            
                        
                        

                        elseif T.cardState == "B2" and T.cardName == "elephant" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        
        end
        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.elephantMove == 1 then

                local newX, newY = elephantMove6(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end
        end
        
        end

        end


    end


    if love.keyboard.isDown('e') and love.keyboard.isDown('3') then
   
    if gameState == 1 then
        for i, B in ipairs (bluePawns) do

            if B.isPickedUp == 2 and B.elephantMove == 1 then
            
                local newX, newY = elephantMove3(B.x, B.y, B.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                local notOutOfBounds = not isOutOfBounds(B, newX, newY) 

                if noCollision and notOutOfBounds then

                    B.x, B.y, B.isPickedUp = newX, newY, 1


        

                for j, T in ipairs (cards) do


                    if T.cardState == "N2" then
                        T.cardState = "B1"
                    
                    
                    
                    elseif T.cardState == "B1" and T.cardName == "elephant" then
                        T.cardState = "N1"
                        
                    
                    

                    elseif T.cardState == "B2" and T.cardName == "elephant" then
                        T.cardState = "N1"

                    end

                end        
                destroyPawns()
                gameState = 2
                sounds["tick"]:play()
            end 
        end
    
    end
    elseif gameState == 2 then
        for i, R in ipairs (redPawns) do


        if R.isPickedUp == 2 and R.elephantMove == 1 then

            local newX, newY = elephantMove7(R.x, R.y, R.isPickedUp)
    
            -- Check for collisions with pawns of the same color
            local noCollision = not hasCollisionWithSameColor(R, newX, newY)
            local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

            if noCollision and notOutOfBounds then
                R.x, R.y, R.isPickedUp = newX, newY, 1
            for I, T in ipairs (cards) do
                if T.cardState == "R1" and T.cardName == "elephant" then
                    T.cardState = "N2"


                elseif T.cardState == "R2" and T.cardName == "elephant" then
                    T.cardState = "N2"


                elseif T.cardState == "N1" then
                        T.cardState = "R1"


                end
            end
            destroyPawns()
            gameState = 1
            sounds["tick"]:play()
        end

    
    end
    end



    end

    end


    if love.keyboard.isDown('e') and love.keyboard.isDown('4') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.elephantMove == 1 then
                
                    local newX, newY = elephantMove4(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1



                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        
                        
                        
                        elseif T.cardState == "B1" and T.cardName == "elephant" then
                            T.cardState = "N1"
                            
                        
                        

                        elseif T.cardState == "B2" and T.cardName == "elephant" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        end

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.elephantMove == 1 then

                local newX, newY = elephantMove8(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "elephant" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end

        
        end

    end


    end

    end


    -- Cobra moves
    if love.keyboard.isDown('c') and love.keyboard.isDown('1') then
        
            if gameState == 1 then
                for i, B in ipairs (bluePawns) do

                    if B.isPickedUp == 2 and B.cobraMove == 1 then
                    
                        local newX, newY = cobraMove1(B.x, B.y, B.isPickedUp)
    
                        -- Check for collisions with pawns of the same color
                        local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                        local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
        
                        if noCollision and notOutOfBounds then
    
                            B.x, B.y, B.isPickedUp = newX, newY, 1
    
    
    

                        for j, T in ipairs (cards) do


                            if T.cardState == "N2" then
                                T.cardState = "B1"
                            
                            
                            
                            elseif T.cardState == "B1" and T.cardName == "cobra" then
                                T.cardState = "N1"
                                
                            
                            

                            elseif T.cardState == "B2" and T.cardName == "cobra" then
                                T.cardState = "N1"

                            end

                        end        
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end 
                end
            
            end
            elseif gameState == 2 then
                for i, R in ipairs (redPawns) do


                if R.isPickedUp == 2 and R.cobraMove == 1 then

                    local newX, newY = cobraMove4(R.x, R.y, R.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                    local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        R.x, R.y, R.isPickedUp = newX, newY, 1
                    for I, T in ipairs (cards) do
                        if T.cardState == "R1" and T.cardName == "cobra" then
                            T.cardState = "N2"


                        elseif T.cardState == "R2" and T.cardName == "cobra" then
                            T.cardState = "N2"


                        elseif T.cardState == "N1" then
                                T.cardState = "R1"


                        end
                    end
                    destroyPawns()
                    gameState = 1
                    sounds["tick"]:play()
                end

            
            end


        end

        end

    end


    if love.keyboard.isDown('c') and love.keyboard.isDown('2') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.cobraMove == 1 then
                
                    local newX, newY = cobraMove2(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1



                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        
                        
                        
                        elseif T.cardState == "B1" and T.cardName == "cobra" then
                            T.cardState = "N1"
                            
                        
                        

                        elseif T.cardState == "B2" and T.cardName == "cobra" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end 
            end
        end

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.cobraMove == 1 then
                local newX, newY = cobraMove5(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "cobra" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "cobra" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end

        end
        end




        end

    end


    if love.keyboard.isDown('c') and love.keyboard.isDown('3') then
    
        if gameState == 1 then
            for i, B in ipairs (bluePawns) do

                if B.isPickedUp == 2 and B.cobraMove == 1 then
                
                    local newX, newY = cobraMove3(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1



                    for j, T in ipairs (cards) do


                        if T.cardState == "N2" then
                            T.cardState = "B1"
                        
                        
                        
                        elseif T.cardState == "B1" and T.cardName == "cobra" then
                            T.cardState = "N1"
                            
                        
                        

                        elseif T.cardState == "B2" and T.cardName == "cobra" then
                            T.cardState = "N1"

                        end

                    end        
                    destroyPawns()
                    gameState = 2
                    sounds["tick"]:play()
                end
                end 
            end
        

        elseif gameState == 2 then
            for i, R in ipairs (redPawns) do


            if R.isPickedUp == 2 and R.cobraMove == 1 then

                local newX, newY = cobraMove6(R.x, R.y, R.isPickedUp)
    
                -- Check for collisions with pawns of the same color
                local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                local notOutOfBounds = not isOutOfBounds(R, newX, newY) 

                if noCollision and notOutOfBounds then
                    R.x, R.y, R.isPickedUp = newX, newY, 1
                for I, T in ipairs (cards) do
                    if T.cardState == "R1" and T.cardName == "cobra" then
                        T.cardState = "N2"


                    elseif T.cardState == "R2" and T.cardName == "cobra" then
                        T.cardState = "N2"


                    elseif T.cardState == "N1" then
                            T.cardState = "R1"


                    end
                end
                destroyPawns()
                gameState = 1
                sounds["tick"]:play()
            end
            end

        
        end




        end

    end

    if love.keyboard.isDown('f') and love.keyboard.isDown('1') then
        if gameState == 1 then
            for i, B in ipairs(bluePawns) do
                if B.isPickedUp == 2 and B.frogMove == 1 then
                    local newX, newY = frogMove1(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1
    
                        for j, T in ipairs(cards) do
                            if T.cardState == "N2" then
                                T.cardState = "B1"
                            elseif T.cardState == "B1" and T.cardName == "frog" then
                                T.cardState = "N1"
                            elseif T.cardState == "B2" and T.cardName == "frog" then
                                T.cardState = "N1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
            end
        elseif gameState == 2 then
            for i, R in ipairs(redPawns) do
                if R.isPickedUp == 2 and R.frogMove == 1 then
                    local newX, newY = frogMove4(R.x, R.y, R.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                    local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        R.x, R.y, R.isPickedUp = newX, newY, 1
    
                        for I, T in ipairs(cards) do
                            if T.cardState == "R1" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "R2" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "N1" then
                                T.cardState = "R1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 1
                        sounds["tick"]:play()
                    end
                end
            end
        end
    end

    if love.keyboard.isDown('f') and love.keyboard.isDown('2') then
        if gameState == 1 then
            for i, B in ipairs(bluePawns) do
                if B.isPickedUp == 2 and B.frogMove == 1 then
                    local newX, newY = frogMove2(B.x, B.y, B.isPickedUp)
    
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then

                        B.x, B.y, B.isPickedUp = newX, newY, 1

    
                        for j, T in ipairs(cards) do
                            if T.cardState == "N2" then
                                T.cardState = "B1"
                            elseif T.cardState == "B1" and T.cardName == "frog" then
                                T.cardState = "N1"
                            elseif T.cardState == "B2" and T.cardName == "frog" then
                                T.cardState = "N1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
            end
        elseif gameState == 2 then
            for i, R in ipairs(redPawns) do
                if R.isPickedUp == 2 and R.frogMove == 1 then
                    local newX, newY = frogMove5(R.x, R.y, R.isPickedUp)
                    -- Check for collisions with pawns of the same color
                    local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                    local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        R.x, R.y, R.isPickedUp = newX, newY, 1
    
                        for I, T in ipairs(cards) do
                            if T.cardState == "R1" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "R2" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "N1" then
                                T.cardState = "R1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 1
                        sounds["tick"]:play()
                    end
                end
            end
        end
    end

    if love.keyboard.isDown('f') and love.keyboard.isDown('3') then
        if gameState == 1 then
            for i, B in ipairs(bluePawns) do
                if B.isPickedUp == 2 and B.frogMove == 1 then
                    local newX, newY = frogMove3(B.x, B.y, B.isPickedUp)
                    local noCollision = not hasCollisionWithSameColor(B, newX, newY) 
                    local notOutOfBounds = not isOutOfBounds(B, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        B.x, B.y, B.isPickedUp = newX, newY, 1
    
                        for j, T in ipairs(cards) do
                            if T.cardState == "N2" then
                                T.cardState = "B1"
                            elseif T.cardState == "B1" and T.cardName == "frog" then
                                T.cardState = "N1"
                            elseif T.cardState == "B2" and T.cardName == "frog" then
                                T.cardState = "N1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 2
                        sounds["tick"]:play()
                    end
                end
            end
        elseif gameState == 2 then
            for i, R in ipairs(redPawns) do
                if R.isPickedUp == 2 and R.frogMove == 1 then
                    local newX, newY = frogMove6(R.x, R.y, R.isPickedUp)
                    local noCollision = not hasCollisionWithSameColor(R, newX, newY)
                    local notOutOfBounds = not isOutOfBounds(R, newX, newY) 
    
                    if noCollision and notOutOfBounds then
                        R.x, R.y, R.isPickedUp = newX, newY, 1
    
                        for I, T in ipairs(cards) do
                            if T.cardState == "R1" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "R2" and T.cardName == "frog" then
                                T.cardState = "N2"
                            elseif T.cardState == "N1" then
                                T.cardState = "R1"
                            end
                        end
    
                        destroyPawns()
                        gameState = 1
                        sounds["tick"]:play()
                    end
                end
            end
        end
    end
    
end 

-- end of love.update function 



function love.keypressed(key)  -- this only does it once

    if key == "escape" then
        love.event.quit()

    end


    if key == "=" then
        for i, card in ipairs(cards) do

             moveCard(card, card.x, card.y, cards)

        end
    end


    if key == "9" then
        for i, C in ipairs (cards) do

            if C.cardState == "N2" then 
                C.cardState = "B1" 


            elseif C.cardState == "B1" then
                C.cardState = "N1"

            elseif C.cardState == "N1" then
                C.cardState = "N2"

            end

        end
    end


    
    if key == "8" then 
        for i, B in ipairs (bluePawns) do
            
           -- if B.isPickedUp == 1 then
               -- B.isPickedUp = 2

            --else
            if B.isPickedUp == 2 then
                B.isPickedUp = 1
                sounds["tick"]:play()
            end
            
    
        end
    end


    if key == "=" then
        saveGame()
    end
    --[[ need combos this wont work
    if key == "t" then
        for i, B in ipairs (bluePawns) do


            if B.isPickedUp == 2 and B.tigerMove == 1 then
                
                    print("About to call tigerMove")
                    B.x, B.y, B.isPickedUp = tigerMove(B.x, B.y, B.isPickedUp)
                    print("Called tigerMove")
            

            end

        end
       
    end
    ]]

    if key == "-" then 
        loadGame()
    end

end


function love.draw()


   

    animations.background:draw(background,0,0)
    animations.background:draw(background,288,200)
    
    animations.background:draw(background,288,0)

    love.graphics.draw(graveyard,0,224)

  --  gameBoard:draw()
   
    --love.graphics.draw(tile,0,0,nil, 4)

  --  gameMap:draw(55, 20, 3, 3)

   -- love.graphics.scale(3,3)

    gameMap:drawLayer(gameMap.layers["Layer1"])

    checkStuffDraw() -- order matters
    --love.graphics.draw(gameMap,0,0,nil,4)
    blueTeamDraw()

    redTeamDraw()

     --world:draw()

     cardsDraw() 
     logicDraw()
   
     -- love.graphics.print(tostring(B.isPickedUp), love.graphics.getHeight(), love.graphics.getWidth()/2)
    

    extraDraw()


     --love.graphics.print( tostring(blueKingStatus), love.graphics.getHeight(), love.graphics.getWidth()/2)

     --love.graphics.print(#cards, love.graphics.getWidth() - 50, 50) -- just for testing 

  
end
--[[ algo
((((16 *5) * 3) /  2) * (-1)) + love.graphics.getWidth() / 2, 
]]





function loadMap()
    gameMap = sti("gameMap.lua") -- loads map based on imported Tiled file


end

--print(#bluePawns)


--[[ adding mouse functions here instead
function love.mousepressed(x, y, button)

    if button == 1 then 
        if gameState == 1 then

            -- when gamestate is in blue's turn, then for loop through bluetiles 
            for i, B in ipairs(bluePawns) do -- fuck I need to redo some shit and come back
            
                
               -- if #bluePawns >= 1 then

                    local mouseToTile = distanceBetween(x, y, B.x, B.y )
                    -- I think this will work?
                
                    if mouseToTile < B.radius - 5 then 
                            if B.isPickedUp == 1 then

                                    B.isPickedUp = 2
                                
                                    --spawnHighBoxes(B.x, B.y)
                        
                                    print("test")
                            end
                            
                    --  elseif B.isPickedUp == 2 then

                 --  if mouseToTile > B.x + 64 then

                    elseif x > B.x + 64 then
                        print("About to call tigerMove")

                        --tigerMove(B.x, B.y, B.isPickedUp, B)
                        B.x, B.y, B.isPickedUp = tigerMove(B.x, B.y, B.isPickedUp, B)


                        print("Called tigerMove")
    
                    end         

               -- end


            end
    
            
        end--     elseif gameState == 2 then  

    end 
end  


]]

function love.mousepressed(x, y, button)

    if gameState == 1 then

        if button == 2 then

            for i, B in ipairs (bluePawns) do
                

                if B.isPickedUp == 2 then
                    B.isPickedUp = 1
                    sounds["tick"]:play()
                end
            end
        


        elseif button == 1 then 
            if gameState == 1 then
                for _, B in ipairs(bluePawns) do
                    local mouseToTile = distanceBetween(x, y, B.x, B.y)
                    
                    if mouseToTile < B.radius - 5 then 
                        if B.isPickedUp == 1 then
                            B.isPickedUp = 2
                            sounds["tick"]:play()
                --            print("Picked up blue pawn")

                            --[[ DECIDED TO JUST MAKE A WORK AROUND, DOING THE IT THING
                        elseif B.isPickedUp == 2 and x > B.x + 64 then
                            print("About to call tigerMove")
                            B.x, B.y, B.isPickedUp = tigerMove(B.x, B.y, B.isPickedUp, B)
                            print("Called tigerMove")

                            ]]
                        end
                    end
                end
            end
        end
    
    elseif gameState == 2 then

        if button == 2 then

            for _, R in ipairs (redPawns) do
                

                if R.isPickedUp == 2 then
                    R.isPickedUp = 1
                    sounds["tick"]:play()
                end
            end
        


            elseif button == 1 then 

            for _, R in ipairs(redPawns) do
                local mouseToTile = distanceBetween(x, y, R.x, R.y)
                
                if mouseToTile < R.radius - 5 then 
                    if R.isPickedUp == 1 then
                        R.isPickedUp = 2
                        sounds["tick"]:play()
                  --      print("Picked up red pawn")

                        --copied from blue
                    end
                end
            end 
        end
    end
end



