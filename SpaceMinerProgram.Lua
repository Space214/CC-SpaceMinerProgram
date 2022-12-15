-- Variables
TurtleX = 961 -- Starting Location
TurtleY = 70 -- Starting Location
TurtleZ = -788 -- Starting Location
TurtleRot = "north" -- Starting Rotation
StartX = 996 -- Mine Location
StartZ = -820 -- Mine Location
MineUpperY = 69 -- Mine Upper Location
MineLowerY = 39 -- Mine Lower Location
MineSizeX = 16 -- Mine Size
MineSizeZ = 16 -- Mine Size
Y128 to Y320
-- Movement function
function Move(Action)
	if Action == "turn left" then
		if TurtleRot == "north" then
			TurtleRot = "west"
			turtle.turnLeft() 
		end
		if TurtleRot == "east" then
			TurtleRot = "north"
			turtle.turnLeft() 
		end
		if TurtleRot == "south" then
			TurtleRot = "east"
			turtle.turnLeft() 
		end
		if TurtleRot == "west" then
			TurtleRot = "south"
			turtle.turnLeft() 
		end
	end
	if Action == "turn right" then
		if TurtleRot == "north" then
			TurtleRot = "east"
			turtle.turnRight()  
		end
		if TurtleRot == "east" then
			TurtleRot = "south"
			turtle.turnRight() 
		end
		if TurtleRot == "south" then
			TurtleRot = "west"
			turtle.turnRight() 
		end
		if TurtleRot == "west" then
			TurtleRot = "north"
			turtle.turnRight() 
		end
	end
	
	if Action == "up" then
			if turtle.detectUp() == false then
				TurtleY = TurtleY + 1
				turtle.up() 
			end
		end
	if Action == "down" then
		if turtle.detectDown() == false then
			TurtleY = TurtleY - 1
			turtle.down()
		end
	end
	
	if TurtleRot == "north" then
	--
		if Action == "forward" then			
			if turtle.detect() == false then
				TurtleZ = TurtleZ - 1
				turtle.forward() 
			end
		end
	--
	end
	if TurtleRot == "east" then
	--
		if Action == "forward" then			
			if turtle.detect() == false then
				TurtleX = TurtleX + 1
				turtle.forward() 
			end
		end
	--	
	end
	if TurtleRot == "south" then
	--
		if Action == "forward" then			
			if turtle.detect() == false then
				TurtleZ = TurtleZ + 1
				turtle.forward() 
			end
		end
	--		
	end
	if TurtleRot == "west" then
	--
		if Action == "forward" then			
			if turtle.detect() == false then
				TurtleX = TurtleX - 1
				turtle.forward() 
			end
		end
	--	
	end
end

-- Refuel function
function Refuel()
    if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
		turtle.refuel()
    end
end

-- Mining function
function Mineblocks()
	while (StartX - TurtleX) > 0 do
		if TurtleRot == "north" then
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartX - TurtleX) < 0 do
		if TurtleRot == "south" then
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) > 0 do
		if TurtleRot == "east" then
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) < 0 do
		if TurtleRot == "west" then
			Move("forward")
		else
			Move("left")
		end
	end
	while (MineUpperY - TurtleY) < 0 do
		if TurtleRot == "north" then
			if turtle.detectDown() == false then
				Move("down")
			else
				turtle.digDown()
			end
			
		else
			Move("left")
		end
	end
end

-- 20,480 blocks for 4 stacks of coal
-- Iron: Y128 to Y320
-- Main script
Move("forward")
Move("forward")
while (100 - TurtleY) > 1 do
	Move("up")
end
Mineblocks()
