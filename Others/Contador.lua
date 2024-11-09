if game.PlaceId == 893973440 then
-- Configuração da Interface
local function criarInterface()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ContadorGUI"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Criação do novo rótulo acima do número
    local labelTitulo = Instance.new("TextLabel")
    labelTitulo.Size = UDim2.new(0, 100, 0, 50)
    labelTitulo.Position = UDim2.new(0.5, 157, 0.5, -197) -- Ajuste para ficar acima
    labelTitulo.Text = "Prancha"
    labelTitulo.Font = Enum.Font.SourceSans
    labelTitulo.TextSize = 24
    labelTitulo.TextColor3 = Color3.new(1, 1, 1)
    labelTitulo.BackgroundTransparency = 1
    labelTitulo.Parent = screenGui
    
    -- Criação do label para o número
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 100, 0, 50)
    textLabel.Position = UDim2.new(0.5, 157, 0.5, -167)
    textLabel.Text = "0"
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 24
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = screenGui
    
    return textLabel
end

-- Classe Contador
local Contador = {}
Contador.__index = Contador

function Contador.new(textLabel)
    local self = setmetatable({}, Contador)
    self.valor = 0
    self.textLabel = textLabel
    return self
end

function Contador:incrementar()
    self.valor += 1
    self:atualizarTexto(self.valor .. "min")
end

function Contador:resetar()
    self.valor = 0
    self:atualizarTexto()
end

function Contador:atualizarTexto()
    if self.textLabel then
        self.textLabel.Text = tostring(self.valor)
    end
end

-- Função Principal de Monitoramento
local function monitorarCaptura(contador)
    local player = game:GetService("Players").LocalPlayer
    local Ragdoll = player.TempPlayerStatsModule.Ragdoll
    local isGameActive = game:GetService("ReplicatedStorage").IsGameActive

    while true do
        wait(1)

        if isGameActive.Value then
            if Ragdoll.Value then
                contador:incrementar()

                -- Espera até Captured ficar falso para novo incremento
                repeat
                    wait(0.1)
                until not Ragdoll.Value
            end
        else
            -- Aguarda de 2 a 3 segundos e reseta o contador se isGameActive estiver falso
            wait(math.random(3,4))
            contador:resetar()
        end
    end
end

-- Execução do Script
local textLabel = criarInterface()
local meuContador = Contador.new(textLabel)
spawn(function() monitorarCaptura(meuContador) end)
end
