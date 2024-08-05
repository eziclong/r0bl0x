local player = game.Players.LocalPlayer
local teleportDelay = 0.02 -- 20 milliseconds

-- Function to teleport the player to all other players
local function teleportToPlayers()
    local players = game.Players:GetPlayers()

    for _, targetPlayer in pairs(players) do
        if targetPlayer ~= player then
            local character = targetPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = character.HumanoidRootPart.Position
                
                -- Teleporting the player's character
                player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                
                -- Wait for the delay
                wait(teleportDelay)
            end
        end
    end
end

-- GUI setup
local screenGui = Instance.new("ScreenGui")
local teleportButton = Instance.new("TextButton")

-- Configure the GUI
screenGui.Name = "TeleportGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

teleportButton.Name = "TeleportButton"
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.Position = UDim2.new(1, -210, 0, 10) -- Top-right corner
teleportButton.Text = "Teleport to All Players"
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
teleportButton.Parent = screenGui

-- Connect the button click to the teleport function
teleportButton.MouseButton1Click:Connect(teleportToPlayers)
