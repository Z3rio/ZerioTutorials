function DrawTextOnScreen(text)
   SetTextProportional(0) -- Might not be needed. Play around with it I guess
   SetTextFont(4) -- Font for the text we are drawing
   SetTextOutline()
   SetTextScale(1.0,2.0)
   SetTextColour(255,80,60, 255)
   SetTextEntry("STRING") -- Initiates a new string for our text
   AddTextComponentString(text) -- Sets the text
   DrawText(0.8, 0.85) -- Draws the text (x, y on your screen)
end

Citizen.CreateThread(function()
    while true do -- Infinite loop
        local Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6 -- Gets the vehicle speed

        if GetVehiclePedIsIn(GetPlayerPed(-1)) ~= 0 then -- Checks if the player is in a vehicle
            DrawTextOnScreen(string.format("%.1f", tostring(Speed)) .. " KM/H") -- Draws the text on the screen if the check is passed
        else
            Citizen.Wait(100)
        end
        Citizen.Wait(0) -- Wait so the loop doesnt crash our game
    end
end)