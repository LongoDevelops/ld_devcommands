RegisterCommand('myCoords', function()
    print(coords)
end)

RegisterCommand('clear', function()
    TriggerEvent("chat:clear")
end)

-- Refreshing variables
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        myHealth = GetEntityHealth(PlayerPedId())
         coords = GetEntityCoords(PlayerPedId())
    end
end)

Citizen.CreateThread(function()
    isAlive = false
    while true do 
        Citizen.Wait(2)
        if GetEntityHealth(PlayerPedId()) > 0 then
            isAlive = true 
        else 
            isAlive = false
        end

        if isAlive then
            if (IsControlJustReleased(0, 304)) then
                TriggerEvent("chatMessage", "Your ~g~health~w~ is: " .. myHealth)
            end
        end
    end
end)
print("Longo Development | Dev Commands | List of commands in client.lua")
--[[
    This script includes the following:
        /myCoords (This is in the chat (FiveM))
        Press H to see your health (This is in the chat(FiveM))
        /clear (This clears the chat (Client-Sided))
]]