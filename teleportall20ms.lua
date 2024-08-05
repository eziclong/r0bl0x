-- LocalScript inside StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local teleportDelay = 0.02 -- 20 milliseconds

-- Function to teleport to each player
local function teleportToPlayers()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player then
            local character = player.Character or player.CharacterAdded:Wait()
            local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()

            -- Wait for the character to be loaded
            if character and targetCharacter then
                -- Teleport to the target player
                character:SetPrimaryPartCFrame(targetCharacter.PrimaryPart.CFrame)
                
                -- Wait for 20 milliseconds before the next teleport
                wait(teleportDelay)
            end
        end
    end
end

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local TeleportButton = Instance.new("TextButton")

ScreenGui.Name = "TeleportGui"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

TeleportButton.Name = "TeleportButton"
TeleportButton.Size = UDim2.new(0, 200, 0, 50)
TeleportButton.Position = UDim2.new(0.5, -100, 0.5, -25)
TeleportButton.Text = "Teleport to Players"
TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Parent = ScreenGui

TeleportButton.MouseButton1Click:Connect(teleportToPlayers)
