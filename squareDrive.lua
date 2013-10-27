function squareDrive()
	repeat
	until (8 == nxt.ButtonRead()) -- will have time to unplug the usb
	count = 0
	repeat 
		while count  < 4  do
			speed()
			move(90)
			distance()
			count = count + 1
		end
	until (count < 4 )
	nxt.SoundTone(1000,10,10)
	nxt.OutputSetSpeed(1,32,0)	-- stop
	nxt.OutputSetSpeed(2,32,0)
end

function distance()
	
		if 4 == nxt.ButtonRead() then
			nxt.OutputSetSpeed(1,32,50)
			nxt.OutputSetSpeed(2,32,50)
			move(365)
		end
end


port = 1
function move(degrees)
  nxt.OutputSetRegulation(port,1,1)
  _,tacho = nxt.OutputGetStatus(port)
  nxt.OutputSetSpeed(port,0x20,nxt.sign(degrees)*50,nxt.abs(degrees))
  repeat
    _,curtacho = nxt.OutputGetStatus(port)
  until 4 > nxt.abs( curtacho - (tacho + degrees) )
end

function speed()
	local speed = 95		
			if speed <= -95 then 
				speed = speed + 5
				nxt.OutputSetSpeed(1,32,speed)
				nxt.OutputSetSpeed(3,32,speed)
				move(365)
			end
	nxt.OutputSetSpeed(1,0,0)
	nxt.OutputSetSpeed(3,0,0)
end		 


