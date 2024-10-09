-- Script should be placed inside the part that triggers the teleportation (the part that the player touches).

local teleportPart = script.Parent  -- The part that players touch to teleport.
local targetPart = workspace.TeleportTarget  -- The part where players will be teleported to.

local function onTouch(otherPart)
    local character = otherPart.Parent  -- Get the character model of the touching object.
    
    if character and character:FindFirstChild("Humanoid") then
        -- Check if it's a player by verifying the presence of a Humanoid.
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")  -- Get the humanoid's root part (for teleporting).
        
        if humanoidRootPart then
            -- Teleport the player to the target part.
            humanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)  -- Add a slight offset to avoid spawning inside the target part.
        end
    end
end

teleportPart.Touched:Connect(onTouch)  -- Connect the Touched event to the onTouch function.
