function calculateTimeBonus()
	-- Assign time bonus multiplier for specific stages
	-- Act 1
	if (stageID == "cpz200") then
	    tbMultiplier = 100
	-- Act 1-2
	elseif (stageID == "ghz200") then
	    tbMultiplier = 350
	-- Act 2
	elseif (stageID == "csc200") then
	    tbMultiplier = 100
	-- Act 2-2
	elseif (stageID == "ssz200") then
	    tbMultiplier = 600
	-- Act 3
	elseif (stageID == "cte200") then
	    tbMultiplier = 100
	-- Act 4
	elseif (stageID == "euc200") then
	    tbMultiplier = 500
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
	if (stageID == "cpz200") then
		sbMultiplier = 200
	-- Act 1-2
	elseif (stageID == "ghz200") then
		sbMultiplier = 50
	-- Act 2
	elseif (stageID == "csc200") then
		sbMultiplier = 40
	-- Act 2-2
	elseif (stageID == "ssz200") then
		sbMultiplier = 50
	-- Act 3
	elseif (stageID == "cte200") then
		sbMultiplier = 0
	-- Act 4
	elseif (stageID == "euc200") then
		sbMultiplier = 40
	else
		sbMultiplier = 0
	end
	-- Print variable to console for debugging.
	print("sbMultiplier = " .. sbMultiplier)

	-- Calculate speed bonus.
	totalVelocity = math.max(0.0, totalVelocity - 20.0) * sbMultiplier

	return math.clamp(math.round(totalVelocity), 0, scoreLimit)
end