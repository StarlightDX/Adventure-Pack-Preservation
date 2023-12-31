function calculateTimeBonus()
	-- Assign time bonus multiplier for specific stages
	-- Act 1
	if (stageID == "ssz200") then
	    tbMultiplier = 450
	-- Act 1-2
	elseif (stageID == "ssh200") then
	    tbMultiplier = 200
	-- Act 2
	elseif (stageID == "pla200") then
	    tbMultiplier = 2500
	-- Act 3 (set to forbidden)
	else
		tbMultiplier = 0
	end
	-- Print variable to console for debugging.
	print("tbMultiplier = " .. tbMultiplier)

	-- Calculate time bonus.
	if (elapsedTime < minSeconds) then
		elapsedTime = (minSeconds - elapsedTime) * tbMultiplier
	else
		elapsedTime = 0
	end
	
	return math.clamp(elapsedTime, 0, scoreLimit)
end

function calculateSpeedBonus()
	-- Assign speed bonus multiplier for specific stages
	-- Act 1
	if (stageID == "ssz200") then
		sbMultiplier = 4.5
	-- Act 1-2
	elseif (stageID == "ssh200") then
		sbMultiplier = 5
	-- Act 2
	elseif (stageID == "pla200") then
		sbMultiplier = 0
	-- Act 3 (set to forbidden)
	else
		sbMultiplier = 0
	end
	-- Print variable to console for debugging.
	print("sbMultiplier = " .. sbMultiplier)

	-- Calculate speed bonus.
	totalVelocity = totalVelocity * sbMultiplier

	return math.clamp(math.round(totalVelocity), 0, scoreLimit)
end