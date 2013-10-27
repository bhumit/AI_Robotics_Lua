function wander()
	nxt.InputSetType(1,1) -- set the input type
	
	repeat
	until (8 == nxt.ButtonRead()) -- will have time to unplug the usb
	
	repeat
	
		while nxt.InputGetStatus(1) > 500 do -- more than 500 (no obstacle)
		
			nxt.OutputSetSpeed(1,32,nxt.random(100,0)) -- drive randomly
			nxt.OutputSetSpeed(2,32,nxt.random(100,0)) --
		
		end
		
		if (nxt.InputGetStatus(1) < 500) then -- crashed into obstacle
			--get timer read
			tm = nxt.TimerRead()
			--add 500 ms 
			while tm + 500 > nxt.TimerRead() do -- stop (because it crashed)
				nxt.OutputSetSpeed(1,32,0)
				nxt.OutputSetSpeed(2,32,0)
			end
			tm = nxt.TimerRead()	
			while tm + 500 > nxt.TimerRead() do		-- reverse for 500 ms
					nxt.OutputSetSpeed(1,32,-100)  
			end
		end
	until (nxt.ButtonRead() > 0)
	nxt.OutputSetSpeed(1,32,0)	-- stop
	nxt.OutputSetSpeed(2,32,0)
		
end
wander()
