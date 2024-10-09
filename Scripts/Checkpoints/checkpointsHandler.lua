-- Table to store checkpoint spawn locations for each player
local checkpointPositions = {}

game.Players.PlayerAdded:Connect(function(player)
	
	player.CharacterAdded:Connect(function(character)
		-- Function to handle checkpoint touch
		local function onCheckpointTouched(checkpoint)
			local stage = player.leaderstats and player.leaderstats.Stage
			if stage then
				-- Update the stage based on checkpoint
				local checkpointNumber = tonumber(checkpoint.Name:match("Checkpoint(%d+)"))
				-- Only update the stage if the checkpoint number is greater than the current stage
				if checkpointNumber > stage.Value then
					stage.Value = checkpointNumber  -- Update player stage if they reached a higher checkpoint
					
					-- Save the checkpoint position for respawn
					checkpointPositions[player] = checkpoint.Position + Vector3.new(0, 5, 0)  -- Adjust Y-coordinate (5 units higher)
				end
			end
		end

		-- Connect checkpoints to the "Touched" event
		for _, checkpoint in pairs(workspace:GetChildren()) do
			if checkpoint:IsA("BasePart") and checkpoint.Name:match("Checkpoint(%d+)") then
				checkpoint.Touched:Connect(function(hit)
					local playerTouched = game.Players:GetPlayerFromCharacter(hit.Parent)
					if playerTouched == player then
						onCheckpointTouched(checkpoint)
					end
				end)
			end
		end
		
		-- When the player dies, respawn at the latest checkpoint
		character:WaitForChild("Humanoid").Died:Connect(function()
			-- If a checkpoint position exists, respawn the player at that position
			local respawnPosition = checkpointPositions[player]
			if respawnPosition then
				player.CharacterAdded:Wait()  -- Wait for the character to respawn
				player.Character:SetPrimaryPartCFrame(CFrame.new(respawnPosition))  -- Set the spawn position
			end
		end)
		
	end)
end)
