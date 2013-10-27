function circleDrive(radius)
button = 0
innerWheel = nxt.float(100, 0) -- inner wheel
outerWheel = nxt.float(112, 0) -- width of gap between drive wheels
r = nxt.float(radius, 0) -- desired turn gross radius
circumference = 2 * ((22 * r)/7) -- circumference
s = (circumference/350)*1000 -- time 
wheelSpeed1 = innerWheel + (r/r)*(outerWheel/2) -- wheel speed of 1
wheelSpeed2 = innerWheel - (innerWheel/r)*(outerWheel/2) -- wheel speed of 2 (outer)
	  repeat
	  until(8 == nxt.ButtonRead())
	  
	  nxt.OutputResetTacho(1,1,1,1) -- reset tacho
	  nxt.OutputResetTacho(2,1,1,1) -- reset tacho
	  
	  repeat
			nxt.OutputResetTacho(1,1,1,1)
			nxt.OutputResetTacho(2,1,1,1)
			
			speed,tacho = nxt.OutputGetStatus(1) 

			
			t = nxt.TimerRead()
			while t+s > nxt.TimerRead() do
				nxt.OutputSetSpeed(1, 32, nxt.int(wheelSpeed2)) -- convert float to int 
				nxt.OutputSetSpeed(2, 32, nxt.int(wheelSpeed1)) -- convert float to int
			end
			
			t = nxt.TimerRead()
			while t+800 > nxt.TimerRead() do
				nxt.OutputSetSpeed(1,0,0)
				nxt.OutputSetSpeed(2,0,0)
			end
			
			nxt.OutputSetSpeed(1,0,0)
			nxt.OutputSetSpeed(2,0,0)
			nxt.SoundTone(1000, 10, 10 )
			
			repeat
				button = nxt.ButtonRead()
			until(button > 0)
			
	  until(button == 4)
	  
	  nxt.OutputSetSpeed(1,0,0)
	  nxt.OutputSetSpeed(2,0,0)
end
