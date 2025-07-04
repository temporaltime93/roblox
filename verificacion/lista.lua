local HttpService = game:GetService("HttpService")

local LISTA_NEGRA = { "dasdasfgrg4", "tual", "otro" }

-- ? Convertimos la tabla a texto
local texto = HttpService:JSONEncode(LISTA_NEGRA)

-- ? Guardamos el string en la variable global
_G.LISTANEGRA = texto

print(_G.LISTANEGRA)
