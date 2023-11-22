-- Lets write this in Algo

-- make a table that will store all the cards

cards = {}


function cardsLoad()
    -- start off with one card
   tigerSprite = love.graphics.newImage("sprites/tiger.png")
   dragonSprite = love.graphics.newImage("sprites/dragon.png")
    frogSprite = love.graphics.newImage("sprites/frog.png")
    roosterSprite = love.graphics.newImage("sprites/rooster.png")
    cobraSprite = love.graphics.newImage("sprites/cobra.png")
   
    gooseSprite = love.graphics.newImage("sprites/goose.png")
    elephantSprite = love.graphics.newImage("sprites/elephant.png")
    oxSprite = love.graphics.newImage("sprites/ox.png")
    horseSprite = love.graphics.newImage("sprites/horse.png")
    mantisSprite = love.graphics.newImage("sprites/mantis.png")
        
    
    
    -- each card will need the following 
   
   
   --[[
    tiger = {}
    -- create tiger card table 
        Sprite = tigerSprite
        --sprite = tiger.Sprite --or Sprites[1]
        tiger.x = 0
        tiger.y = 0
        inGame = true -- will set cards not in game to false
        tiger.cardState = neutral1
        tiger.width = 64
        tiger.height = 64
    table.insert(cards, tiger)

    ]]


    --[[ quick reference for possible CardStates:

    -- nuetral1
    -- nuetral2
    -- blue1
    -- blue2
    --red1
    --red2
    ]]
   
    inGameCards()

end





function cardsUpdate(dt) 
 
  
    -- need to use a for loop to keep checking

    checkCardState()

    for i=#cards, 1, -1 do
        local b = cards[i]
        if b.inGame == "out" then
            table.remove(cards, i) 
        end
    end 


   -- print("hello")


end



function cardsDraw()

 



    for i, B in ipairs (cards) do 

    



        if B.cardName == "tiger" then
            
        end

    
    if B.inGame == "in" then

            
            if B.cardState == "N1" then

        -- for i, b in ipairs (cards) do
              --      sprite = checkCardName(B,B.cardName,sprite)
                
                love.graphics.draw(B.Sprite, B.x, B.y,0, 0.5, 0.5) 
                

            elseif B.cardState == "N2" then

                    -- for i, b in ipairs (cards) do
                        
                love.graphics.draw(B.Sprite, B.x, B.y,0, 0.5, 0.5)     
                
            elseif B.cardState == "B1" then
                -- this does 90 degrees 
                love.graphics.draw(B.Sprite, B.x + 64, B.y, math.pi/2)

            
            elseif B.cardState == "B2" then 
                love.graphics.draw(B.Sprite, B.x + 64, B.y, math.pi/2)


                -- wow finally adding draw for cards in Red Zones

            elseif B.cardState == "R1" then 
                love.graphics.draw(B.Sprite, B.x, B.y + 64, 4.71239)

            elseif B.cardState == "R2" then 
                love.graphics.draw(B.Sprite, B.x, B.y + 64, 4.71239)

            
            


            else
                print("attempting to print other cards")
            end
        end
    
    end

end


function checkCardName(card,cardName,sprite)

    local sprite = tigerSprite


    if card.cardName == "tiger" then


        sprite = tigerSprite
  
    elseif card.cardName == "dragon" then

        sprite = dragonSprite

    elseif card.cardName == "frog" then
        sprite = frogSprite

    elseif card.cardName == "rooster" then
        sprite = roosterSprite

    elseif card.cardName == "cobra" then
        sprite = cobraSprite

    
        return sprite 

    end 

end



function inGameCards()

    local TS = tigerSprite 

    tiger = {
    -- create tiger card table 
        Sprite = TS ,
        cardName = "tiger",
        cardState = "B1" ,
        --sprite = tiger.Sprite --or Sprites[1]
        x = 0 ,
        y = 0 ,
     
        inGame = "in" ,-- will set cards not in game to false
       
        width = 64 ,
        height = 64 ,
        }
        table.insert(cards, tiger)

     

    -- create more cards just for rotation 
    --Base cards
--DHCFMRGEO+T

    -- Dragon 
    dragon = {
        Sprite = dragonSprite,
        cardName = "dragon",
        cardState = "B2" ,
        --sprite = tiger.Sprite --or Sprites[1]
        x = 0 ,
        y = 0 ,
        inGame = "in" ,-- will set cards not in game to false
       
        width = 64 ,
        height = 64 ,
        }
        table.insert(cards, dragon)


        -- Horse
        horse = {
            Sprite = horseSprite,
            cardName = "horse",
            cardState = "out" ,
            --sprite = tiger.Sprite --or Sprites[1]
            x = 0 ,
            y = 0 ,
            inGame = "out" ,-- will set cards not in game to false
           
            width = 64 ,
            height = 64 ,
            }
        table.insert(cards, horse)

        --Cobra 
        cobra = {
            Sprite = cobraSprite ,
            cardName = "cobra",
            cardState = "R2" ,
            --sprite = tiger.Sprite --or Sprites[1]
            x = 0 ,
            y = 0 ,
            inGame = "in" ,-- will set cards not in game to false
           
            width = 64 ,
            height = 64 ,
            }
            table.insert(cards, cobra)

        -- Frog
        frog = {
        Sprite = frogSprite ,
        cardName = "frog",
        cardState = "N2" ,
        --sprite = tiger.Sprite --or Sprites[1]
        x = 0 ,
        y = 0 ,
        inGame = "in" ,-- will set cards not in game to false
       
        width = 64 ,
        height = 64 ,
        }
        table.insert(cards, frog)

    -- Mantis
        mantis = {
            Sprite = mantisSprite,
            cardName = "mantis",
            cardState = 'out',
            x = 0,
            y = 0,
            inGame = "out",  -- Set cards not in the game to "out"
            width = 64,
            height = 64,
        }
        table.insert(cards, mantis)
    
    -- Rooster

    rooster = {
        Sprite = roosterSprite ,
        cardName = "rooster",
        cardState = "R1" ,
        --sprite = tiger.Sprite --or Sprites[1]
        x = 0 ,
        y = 0 ,
        inGame = "in" ,-- will set cards not in game to false
       
        width = 64 ,
        height = 64 ,
        }
        table.insert(cards, rooster)

    -- Goose
    goose = {
        Sprite = gooseSprite,
        cardName = "goose",
        cardState = "out" ,
        --sprite = tiger.Sprite --or Sprites[1]
        x = 0 ,
        y = 0 ,
        inGame = "out" ,-- will set cards not in game to false
       
        width = 64 ,
        height = 64 ,
        }
        table.insert(cards, goose)
    
    -- Ox

    
    elephant = {
        Sprite = elephantSprite,
        cardName = "elephant",
        cardState = "out",  -- Adjust the initial state as needed
        x = 0,
        y = 0,
        inGame = "out",
        width = 64,
        height = 64,
    }
    table.insert(cards, elephant)
    
    ox = {
        Sprite = oxSprite,
        cardName = "ox",
        cardState = "out",  -- Adjust the initial state as needed
        x = 0,
        y = 0,
        inGame = "out",
        width = 64,
        height = 64,
    }
    table.insert(cards, ox)



end

function checkCardState(x,y,cardState) -- pretty proud of this one
    for i, C in ipairs (cards) do
        
    -- checks card state and moves accodingly, resizing happens in draw function
        if C.cardState =="N1" then
            C.x = 128
            C.y = 0

        elseif C.cardState == "N2" then
            C.x = 128
            C.y = 192

        elseif C.cardState == "B1" then
            C.x = 0
            C.y = 32

        elseif  C.cardState == "B2" then
            C.x = 0
            C.y = 128

        elseif  C.cardState == "R1" then
            C.x = 224
            C.y = 32

        elseif  C.cardState == "R2" then
             C.x = 224
             C.y = 128    

        end

    --    print(C.cardState)

    end

end
