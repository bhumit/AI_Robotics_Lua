heading  = {12,2,3,4,2,2,4,2,2,2,3,42,2,2,2,34,4,3}
distance = {34,5,4,3,3,2,2,34,44,3,,3,2,223,44,3}
pathTable = {}
pathTable[1] = heading
pathTable[2] = distance

function pathDrive( pathTable )

	repeat
	until(8 == nxt.ButtonRead())

	index = 1
	repeat
		pathTableSize = #pathTable  -- leghth of table
		headingSize = #pathTable[1]		--length 
		distanceSize = #pathTable[2]	-- get length

		while index < headingSize do
			head = pathTable[1][index]
			tim = nxt.TimerRead()
			while t + (head * 10) > nxt.TimerRead() do
				nxt.OutputSetSpeed(1,32,100)
			end
			nxt.OutputSetSpeed(1,0,0)
			nxt.OutputSetSpeed(2,0,0)

			dist = pathTable[2][index]
			tim = nxt.TimerRead()
			while t + dist > nxt.TimerRead() do
				nxt.OutputSetSpeed(1,32,100)
				nxt.OutputSetSpeed(2,32,100)
			end
			nxt.OutputSetSpeed(1,0,0)
			nxt.OutputSetSpeed(2,0,0)

			index = index + 1
			nxt.SoundTone(1000,10,10)
		end
	until(nxt.ButtonRead() > 0)
	nxt.OutputSetSpeed(1,0,0)
	nxt.OutputSetSpeed(2,0,0)
end
