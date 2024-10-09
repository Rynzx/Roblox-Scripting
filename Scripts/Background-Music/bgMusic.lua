-- Create a new Sound instance
local bgMusic = Instance.new("Sound")

-- Set the properties for the music
bgMusic.Name = "Lofi Background Music"
bgMusic.SoundId = "rbxassetid://71557483400828" -- Replace with your music asset ID
bgMusic.Looped = true  -- Set the sound to loop
bgMusic.Volume = 0.5   -- Set the volume (0 to 1)
bgMusic.Parent = game.Workspace  -- Add the music to the Workspace

-- Play the music
bgMusic:Play()
