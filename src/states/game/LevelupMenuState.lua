
--Level up menu state
LevelupMenuState = Class{__includes = BaseState}

function LevelupMenuState:init(playerPokemon, onClose)
    self.playerPokemon = playerPokemon
   
    --initializing stats to Menu
    self.levelMenu = Menu {
        cursor = false,
        font = "medium",
        x = VIRTUAL_WIDTH - 128,
        y = VIRTUAL_HEIGHT - 128,
        width = 128,
        height = 128,
        items = {
            {
                text = "HP: " .. (self.playerPokemon.baseHP - self.playerPokemon.HPIncrease) .. "+" 
                    .. self.playerPokemon.HPIncrease .. " = " .. self.playerPokemon.baseHP,
            },
            {
                text = "ATK: " .. (self.playerPokemon.baseAttack - self.playerPokemon.attackIncrease) .. "+" 
                .. self.playerPokemon.attackIncrease .. " = " .. self.playerPokemon.baseAttack,
            },
            {
                text = "DEF: " .. (self.playerPokemon.baseDefense - self.playerPokemon.defenseIncrease) .. "+" 
                .. self.playerPokemon.defenseIncrease .. " = " .. self.playerPokemon.baseDefense,
            },
            {
                text = "SPD: " .. (self.playerPokemon.baseSpeed - self.playerPokemon.speedIncrease) .. "+" 
                .. self.playerPokemon.speedIncrease .. " = " .. self.playerPokemon.baseSpeed,
            }
        }
    }
    self.onClose = onClose or function() end
end

--Update level up menu
function LevelupMenuState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:pop()
        self.onClose()
    end
    
    self.levelMenu:update(dt)
end

--render level up menu
function LevelupMenuState:render()
    self.levelMenu:render()
end