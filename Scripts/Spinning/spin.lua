local part = script.Parent

while true do
	part.CFrame = part.CFrame * CFrame.Angles(0,math.rad(10),0)
	wait(0.05)
end
