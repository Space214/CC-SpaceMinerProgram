-- Variables
TurtleX = 961 -- Starting Location
TurtleY = 70 -- Starting Location
TurtleZ = -788 -- Starting Location
TurtleRot = "north" -- Starting Rotation
StartX = 996 -- Mine Location
StartZ = -820 -- Mine Location
MineUpperY = 69 -- Mine Upper Location
MineLowerY = 39 -- Mine Lower Location
MineSizeX = 16 -- Mine Size (must be 2,4,6,8,10,12,14,16,ect...)
MineSizeZ = -16 -- Mine Size (must be 2,4,6,8,10,12,14,16,ect...)
SelectedSlot = 1;

-- Movement function
function Move(Action)
	if Action == "left" then
		if TurtleRot == "north" then
			TurtleRot = "west"
			turtle.turnLeft() 
			return
		end
		if TurtleRot == "east" then
			TurtleRot = "north"
			turtle.turnLeft() 
			return
		end
		if TurtleRot == "south" then
			TurtleRot = "east"
			turtle.turnLeft() 
			return
		end
		if TurtleRot == "west" then
			TurtleRot = "south"
			turtle.turnLeft() 
			return
		end
	end
	if Action == "right" then
		if TurtleRot == "north" then
			TurtleRot = "east"
			turtle.turnRight()  
			return
		end
		if TurtleRot == "east" then
			TurtleRot = "south"
			turtle.turnRight() 
			return
		end
		if TurtleRot == "south" then
			TurtleRot = "west"
			turtle.turnRight() 
			return
		end
		if TurtleRot == "west" then
			TurtleRot = "north"
			turtle.turnRight() 
			return
		end
	end
	
	if Action == "up" then
		if turtle.detectUp() == false then
			TurtleY = TurtleY + 1
			turtle.up() 
		end
		return
	end
	if Action == "down" then
		if turtle.detectDown() == false then
			TurtleY = TurtleY - 1
			turtle.down()
		end
		return
	end
	
	if TurtleRot == "north" then
	--
		if Action == "forward" then			
			if turtle.detect() == false then
				TurtleZ = TurtleZ - 1
				turtle.forward() 
			end
		end
		return
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
		return
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
		return
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
		return
	--	
	end
end

-- Refuel function
function Refuel()
	SelectedSlot = turtle.getSelectedSlot()
	turtle.select(13)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel()
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(14)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel()
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(15)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel()
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(16)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel()
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(SelectedSlot)
end

-- Mining function
function Mineblocks()
	while (StartX - TurtleX) > 0 do
		if TurtleRot == "east" then
			Refuel()
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartX - TurtleX) < 0 do
		if TurtleRot == "west" then
			Refuel()
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) < 0 do
		if TurtleRot == "north" then
			Refuel()
			Move("forward")
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) > 0 do
		if TurtleRot == "south" then
			Refuel()
			Move("forward")
		else
			Move("left")
		end
	end
	while (MineUpperY - TurtleY) < 0 do
		if TurtleRot == "north" then
			Refuel()
			if turtle.detectDown() == false then
				Move("down")
			else
				turtle.digDown()
			end
			
		else
			Move("left")
		end
	end
	while (MineLowerY - TurtleY) < 0 do
		while TurtleX ~= StartX + MineSizeX
			while TurtleZ ~= StartZ + MineSizeZ
				if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
			end
			Move("right")
			if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
			Move("right")
			while TurtleZ ~= StartZ
				if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
			end
			Move("left")
			if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
			Move("left")
		end
		Move("left")
		while TurtleZ ~= StartZ
			Move("forward")
		end
		Move("right")
		if turtle.detectDown() == false then
			Move("down")
		else
			turtle.digDown()
			Move("down")
		end
	end
	
end

-- 20,480 blocks for 4 stacks of coal
-- Iron: Y128 to Y320
-- Main script
Refuel()
Move("forward")
Move("forward")
while (100 - TurtleY) > 1 do
	Move("up")
end
Mineblocks()
