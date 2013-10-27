function bberg()

  nxt.InputSetType(1,5,0x80)  -- set the light sensor to recieve 
  nxt.InputSetType(3,5,0x80)  -- set the light sensor to recieve 

  
  repeat
  until( 8 == nxt.ButtonRead())
  repeat
  until( 0 == nxt.ButtonRead())
  
  repeat
	 valL = nxt.InputGetStatus(1); -- value from left light sensor
   valR = nxt.InputGetStatus(3); -- value from right light sensor
      
    -- move towards left if the light source is near left light sensor
     if ((valL > 500) and  (valR < 500))then 
		 speedR = 80
		 print (speedR)
		 nxt.OutputSetSpeed(1,32,speedR)
		 nxt.OutputSetSpeed(2,32,0)
     -- move towards right if the light source is near right light sensor
     elseif ((valR > 500) and  (valL < 500))then 
		 speedL = 80
		 print (speedL)
         nxt.OutputSetSpeed(1,32,0)
         nxt.OutputSetSpeed(2,32,speedL)
     else
		 print ("valL: " .. valL .. " valR: " .. valR)
	 end
  until( 8 == nxt.ButtonRead())
end

bberg()
