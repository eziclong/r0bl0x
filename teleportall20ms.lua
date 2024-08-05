local player = game.Players.LocalPlayer

while true do
    wait(0.02) -- Wait for 20 milliseconds

    local players = game.Players:GetPlayers() -- Get all players
    local teleportTime = 0.02 -- Time to teleport to each player (20ms)

    for _, targetPlayer in ipairs(players) do
        if targetPlayer ~= player then -- Don't teleport to yourself
            local character = targetPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = character.HumanoidRootPart.Position
                
                -- Teleport to the player
                player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)

                -- Wait for the specified teleportation time before moving to the next player
                wait(teleportTime)
            end
        end
    end
end
