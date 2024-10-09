-- Script inside ServerScriptService

game.Players.PlayerAdded:Connect(function(player)
    -- Create a new leaderboard folder for each player
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Create a new Points value inside the leaderboard
    local points = Instance.new("IntValue")
    points.Name = "Points"
    points.Value = 0  -- Initial Points value
    points.Parent = leaderstats
end)
