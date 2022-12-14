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
CollectDeepslate = false

SelectedSlot = 1;

JunkSlot = 1;
-- JunkRemover3000
function RemoveJunk()
	while JunkSlot <= 12 do
		turtle.select(JunkSlot)
		JunkData = turtle.getItemDetail()
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:cobblestone" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:dirt" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:gravel" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:flint" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:granite" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:diorite" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:andesite" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:mossy_cobblestone" then
				turtle.drop()
			end
		end
		if turtle.getItemCount() > 0 then
			if JunkData.name == "minecraft:tuff" then
				turtle.drop()
			end
		end
		if CollectDeepslate == false then
			if turtle.getItemCount() > 0 then
				if JunkData.name == "minecraft:deepslate" then
					turtle.drop()
				end
			end
			if turtle.getItemCount() > 0 then
				if JunkData.name == "minecraft:cobbled_deepslate" then
					turtle.drop()
				end
			end
		end
		JunkSlot = JunkSlot + 1
	end
	JunkSlot = 1
	turtle.select(1)
end

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
			turtle.refuel(5)
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(14)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel(5)
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(15)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel(5)
			turtle.select(SelectedSlot)
		end
		return
	end
	turtle.select(16)
	if turtle.getItemCount() > 0 then
		if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
			turtle.refuel(5)
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
			if turtle.detect() == false then
				Move("forward")
			else
				turtle.dig()
				Move("forward")
			end
			
		else
			Move("left")
		end
	end
	while (StartX - TurtleX) < 0 do
		if TurtleRot == "west" then
			Refuel()
			if turtle.detect() == false then
				Move("forward")
			else
				turtle.dig()
				Move("forward")
			end
			
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) < 0 do
		if TurtleRot == "north" then
			Refuel()
			if turtle.detect() == false then
				Move("forward")
			else
				turtle.dig()
				Move("forward")
			end
			
		else
			Move("left")
		end
	end
	while (StartZ - TurtleZ) > 0 do
		if TurtleRot == "south" then
			Refuel()
			if turtle.detect() == false then
				Move("forward")
			else
				turtle.dig()
				Move("forward")
			end
			
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
		while TurtleX <= StartX + MineSizeX do
			while TurtleZ > StartZ + MineSizeZ do
				if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
				Refuel()
			end
			Move("right")
			if turtle.detect() == false then
				Move("forward")
			else
				turtle.dig()
				Move("forward")
			end
			Refuel()
			RemoveJunk()
			Move("right")
			while TurtleZ ~= StartZ do
				if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
				Refuel()
			end
			Move("left")
			if TurtleX < StartX + MineSizeX - 1 then
				if turtle.detect() == false then
					Move("forward")
				else
					turtle.dig()
					Move("forward")
				end
			end
			Refuel()
			RemoveJunk()
			Move("left")
		end
		Move("left")
		while TurtleX > StartX do
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

-- Main script
Refuel()
-- Get to the top of the mining area
while TurtleY < MineUpperY do
	if turtle.detectUp() == false then
		Move("up")
	else
		turtle.digUp()
		Move("up")
	end

end
Mineblocks()
