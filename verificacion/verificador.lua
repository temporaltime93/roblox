-- ! ServerScriptService > ban_script.lua

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- ? Descargar y ejecutar lista.lua desde GitHub
local success, response = pcall(function()
	return game:HttpGet("https://raw.githubusercontent.com/1RubiUwU1/ChatPgx/main/lista.lua")
end)

if success then
	local loadSuccess, err = pcall(function()
		loadstring(response)() -- Esto define _G.LISTANEGRA
	end)

	if not loadSuccess then
		warn("! Error ejecutando lista.lua:", err)
	end
else
	warn("! No se pudo descargar lista.lua:", response)
end

-- ? Convertir _G.LISTANEGRA (JSON string) a tabla
local function getBlacklist()
	if not _G.LISTANEGRA then return {} end

	local ok, result = pcall(function()
		return HttpService:JSONDecode(_G.LISTANEGRA)
	end)

	if ok and typeof(result) == "table" then
		return result
	else
		warn("! Error decodificando _G.LISTANEGRA:", result)
		return {}
	end
end

-- ? Verifica si el nombre del jugador está en la lista
local function isBlacklisted(username)
	for _, name in ipairs(getBlacklist()) do
		if name:lower() == username:lower() then
			return true
		end
	end
	return false
end

local nombre = game.Players.LocalPlayer.Name

if isBlacklisted(nombre) then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1RubiUwU1/ChatPgx/refs/heads/main/ban.lua"))()
	-- opcional: player:Kick("Estás baneado.")
else
	print("* " .. nombre .. " no está en la lista negra.")
end

