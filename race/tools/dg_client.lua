--dg_client
----La Tropica Respawn System
local me = getLocalPlayer()

--Hunterarea
local screen_width, screen_height = guiGetScreenSize()
local RESPAWN_KEY = "space"
local showRespawn = false
local text = "#FFFFFFDruecke #FF9900"..RESPAWN_KEY.." #FFffffum die Fun Area zu betreten."
local scale = 1.5
local font = "default-bold"
local textWidth = dxGetTextWidth(text:gsub("#%x%x%x%x%x%x", ""), scale, font)
local fontHeight = dxGetFontHeight(scale, font)
local color = tocolor(255, 128, 0, 255)
setElementData(getLocalPlayer(), "respawn.playing", false, true)
setElementData(getLocalPlayer(), "hunterarea.playing", false, true)
local running = false
local vehicleData = {}
local SAVE_INTER = 22500
local saveTimer = nil
local reset = true -- reset timer
local lastSaved = 0
local randomMessagesHead = {
	[1] = "Vio-Race",
	[2] = "Info",
	[3] = "Bugs/Voschläge",
	[4] = "Info"
}
local randomMessagesText = {
	[1] = "Besuch unser Forum: www.vio-race.de",
	[2] = "Hast du Fragen?\nSchau mal in den FAQ's",
	[3] = "Du kennst Bugs oder hast Vorschläge\nPoste es! www.vio-race.de",
	[4] = "Du suchst den Kontakt zu den Admins\nNutze hierfür /report"
}
local radomMessagesValue = 4
-- When element data for the player changes, bind or unbind key.
addEventHandler("onClientElementDataChange", getLocalPlayer(),
function(dataName, oldValue)
	if(getElementType(source) ~= "player" or dataName ~= "state")then return end
	local newValue = getElementData(source, dataName)
	if(newValue == "dead")then
		reset = true
		setTimer(function()
			if(running)then
				showRespawn = false
				setElementData(getLocalPlayer(), "respawn.playing", false, true)
				--bindKey(RESPAWN_KEY, "up", respawn)
			end
		end,
		3000, 1)
		triggerEvent("VioRaceInfo", getLocalPlayer())
	else
		--unbindKey(RESPAWN_KEY, "up", respawn)
		showRespawn = false
		setElementData(getLocalPlayer(), "respawn.playing", false, true)
	end
	if(newValue == "alive" and oldValue ~= "alive")then
		reset = false
	end
end)

--[[function VioRaceInfo ()
	local randomID = math.random(1, radomMessagesValue)
	local head = randomMessagesHead[randomID]
	local textmes = randomMessagesText[randomID]
	displayClientInfo(head, textmes, 0, 0, 50)
end
addEvent("VioRaceInfo", true)
addEventHandler("VioRaceInfo", getLocalPlayer(), VioRaceInfo)]]

--[[
--create Spawnpoints
hunterMapSpawns = {
    {-1385.2529296875,-232.91130065918,13.998399734497,0,0,350},
    {-1341.5419921875,-267.70858764648,13.998399734497,0,0,350},
    {-1268.2869873047,29.526599884033,13.998399734497,0,0,112},
    {-1151.84375,-292.2802734375,13.998399734497,0,0,37},
    {-1216.6005859375,-117.3544921875,13.998399734497,0,0,84},
    {-1238.4658203125,-39.7109375,13.998399734497,0,0,84},
    {-1296.0169677734,89.006797790527,13.998399734497,0,0,124},
    {-1397.8280029297,115.55570220947,13.998399734497,0,0,152},
    {-1249.0537109375,166.9755859375,13.998399734497,0,0,124},
    {-1516.2458496094,-10.935400009155,13.998399734497,0,0,199},
    {-1431.8056640625,80.404296875,13.990900039673,0,0,199},
    {-1595.6700439453,-77.033401489258,13.998399734497,0,0,199},
    {-1712.8765869141,-458.14739990234,13.998399734497,0,0,10},
    {-1505.619140625,-249.5224609375,13.998399734497,0,0,15},
}

--Create Funmap
hunterMap = {}
hunterMapObjects = {
	{8355,-1257.8540039063,97.567497253418,-56.675201416016,90,0,45},
    {8355,-1618.2235107422,-508.74179077148,16.614799499512,0,90,44.994506835938},
    {8355,-1605.8254394531,-481.63000488281,16.614799499512,0,90,44.989013671875},
    {8355,-1513.7260742188,-259.8337097168,-7.5029997825623,0,90,101.26647949219},
    {8355,-1597.021484375,-490.5126953125,16.614799499512,0,90,44.989013671875},
}
                 ]]
--create Spawnpoints
hunterMapSpawns = {
    {5342.3,	-1796.8,	16,0,0,0},
    {5337.8,	-1796.7,	16,0,0,0},
    {5330.5,	-1796.9,	16,0,0,0},
    {5323.4,	-1796.3,	16,0,0,0},
    {5315.6,	-1796.3,	16,0,0,358},
    {5305.3,	-1796.1,	16,0,0,352},
    {5295.7,	-1794.1,	16,0,0,344},
    {5302.6,	-1738.1,	16,0,0,178},
	{5307.5,	-1737.5,	17.1,0,0,178},
	{5314.2,	-1736.6,	17.1,0,0,178},
	{5319.8,	-1736.6,	17.1,0,0,178},
	{5325.9,	-1736.8,	17.1,0,0,178},
	{5331.9,	-1736.8,	17.1,0,0,178},
	{5339.9,	-1737.5,	17.1,0,0,178},
	{5349.4,	-1738.3,	17.1,0,0,162},
	{5355.5,	-1740,		17.1,0,0,162},
	{5365.8,	-1742.8,	17.1,0,0,162},
	{5371.9,	-1744.8,	17.1,0,0,162},
	{5361.1,	-1742.2,	17.1,0,0,162},
}

--Create Funmap
hunterMap = {}
hunterMapObjects = {
	{13612,	5333.8,	-1766.8,	16,		0,0,0},
    {4141,	5343.7,	-1823.9,	26.6,	0,0,90},
    {5189,	5365.1,	-1724.5,	21.7,	0,0,78},
    {10195,	5380.6,	-1818.8,	22.3,	0,0,104},
    {10194,	5283.4,	-1817.4,	12.5,	0,0,72.5},
	{10193,	5319.9,	-1717.8,	51.5,	0,0,2},
	{10194,	5258.2,	-1803.9,	12.5,	0,0,51.25},
	{10194,	5240.1,	-1778.3,	12.5,	0,0,19.25},
	{10194,	5243.8,	-1745.7,	12.5,	0,0,331.25},
	{10194,	5264,	-1724.2,	12.5,	0,0,301.24},
	{10194,	5270.3,	-1719.2,	12.5,	0,0,289.23},
	{10194,	5274.6,	-1717.5,	12.5,	0,0,287.73},
	{10194,	5276.9,	-1718,		12.5,	0,0,290.47},
	{10195,	5310.8,	-1821.8,	21.9,	0,0,88},
	{10195, 5405.1,	-1807.9,	22.3,	0,0,122},
	{10195, 5425.4,	-1786.5,	22.3,	0,0,148.5},
	{10195,	5427.1,	-1764.3,	22.3,	0,0,182.5},
	{10195,	5412.5,	-1730.8,	22.3,	0,0,224.5},
	{10195, 5395.8,	-1721,		22.3,	0,0,250.7},
	{5189,	5365.2,	-1724,		27,		0,0,78},
	{5189,	5365.3,	-1723.6,	32.2,	0,0,78},
	{6965,	5341.7,	-1762.5,	17.4,	0,0,0},
	{9833,	5341.2,	-1762.5,	23.9,	0,0,0},
	{3271,	5395.5,	-1776.9,	15.2,	0,357.25,350.5},
	{3080,	5303,	-1782.5,	15.5,	0,0,68},
	{3080,	5295.3,	-1754.6,	16,		0,0,289.75},
	{3080,	5297.04,-1780.1,	15.5,	0,0,248},
	{3080,	5301.3,	-1752.4,	16,		0,0,109.75},
}

function destroyHunterMap()
	for id, object in ipairs(hunterMap) do
		if isElement(object) then destroyElement(object) end
	end
	hunterMap = {}
end

function createHunterMap()
	destroyHunterMap()
	for id, object in ipairs(hunterMapObjects) do
		local o = createObject(unpack(object))
		table.insert( hunterMap, o)
		setElementDimension(o, 279)
	end
end

addEvent("onClientMapStopping", true)
addEventHandler("onClientMapStopping", root, 
	function()
		destroyHunterMap()
	end
)

--[[ respawn player, later add "checkpoints"
function respawn()
	reset = false
	--unbindKey(RESPAWN_KEY, "up", respawn)
	showRespawn = false
	setElementData(getLocalPlayer(), "respawn.playing", true, true)
	outputDebugString("Spawning in Fun Area")
	triggerServerEvent("onClientRequestRespawn", getLocalPlayer(), hunterMapSpawns[math.random(1,#hunterMapSpawns)])
	createHunterMap()
	setElementData(getLocalPlayer(), "hunterarea.playing", true, true)
	bindKey("rctrl", "down", cdoshoot)
	bindKey("lctrl", "down", cdoshoot)
	bindKey("mouse1", "down", cdoshoot)
	bindKey("lshift", "down", cdjump)
	bindKey("rshift", "down", cdjump)
	bindKey("lalt", "down", cdspeed)
end]]


addEventHandler("onClientRender", getRootElement(),
function()
	-- Dont show text if player is not allowed to respawn.
	if not showRespawn then return end
	local x, y = screen_width/2 - textWidth/2, screen_height * 0.75 - fontHeight/2
	dxDrawColoredText(text, x, y+screen_height*0.1, screen_width, screen_height, color, scale, font)
end)

addEvent("onClientRaceStateChanging", true)
addEventHandler("onClientRaceStateChanging", getRootElement(),
function(newState, oldState)
	if(newState == "Running")then
		local state = tostring(getElementData(getLocalPlayer(), "state"))
		if(state == "waiting")then
			--[[
			reset = false
			running = true
			vehicleData = {}
			saveRespawnToSpawnpoint(getLocalPlayer())
			showRespawn = true
			setElementData(getLocalPlayer(), "respawn.playing", false, true)
			bindKey(RESPAWN_KEY, "up", respawn)
			--]]
		elseif(state == "alive" or state == "not ready")then
			reset = false
			running = true
		end
	end
	if(newState == "PostFinish" or newState == "NoMap")then
		reset = true
		running = false
		unbindKey(RESPAWN_KEY, "up", respawn)
		showRespawn = false
		setElementData(getLocalPlayer(), "respawn.playing", false, true)
		setElementData(getLocalPlayer(), "hunterarea.playing", false, true)
		unbindKey("rctrl", "down", cdoshoot)
		unbindKey("lctrl", "down", cdoshoot)
		unbindKey("mouse1", "down", cdoshoot)
		unbindKey("lshift", "down", cdjump)
		unbindKey("rshift", "down", cdjump)
		unbindKey("lalt", "down", cdspeed)
	end
end)

addEventHandler("onClientPlayerWasted", getLocalPlayer(),
function()
	if(source ~= getLocalPlayer())then return end
	reset = true
	setElementData(getLocalPlayer(), "respawn.playing", false, true)
	setTimer(function()
	local statea = getElementData(getLocalPlayer(), "hunterarea.playing")
	if statea then
		setElementData(getLocalPlayer(), "hunterarea.playing", false, true)
		unbindKey("rctrl", "down", cdoshoot)
		unbindKey("lctrl", "down", cdoshoot)
		unbindKey("mouse1", "down", cdoshoot)
		unbindKey("lshift", "down", cdjump)
		unbindKey("rshift", "down", cdjump)
		unbindKey("lalt", "down", cdspeed)
	end
	end,1500,1)
	
	setTimer(function()
		--local state = getElementData(getLocalPlayer(), "respawn.playing") or true
			if(running)then
				showRespawn = true
				setElementData(getLocalPlayer(), "respawn.playing", false, true)
				--bindKey(RESPAWN_KEY, "up", respawn)
			end
		end,
	3000, 1)
end)

function dxDrawColoredText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI)
	-- Making them optional.
	right = right or screen_width
	bottom = bottom or screen_height
	while(left < 0) do
		left = screen_width - math.abs(left)
	end
	while(top < 0) do
		top = screen_height - math.abs(top)
	end
	while(right < 0) do
		right = screen_width - math.abs(right)
	end
	while(bottom < 0) do
		bottom = screen_height - math.abs(bottom)
	end
	if(right > screen_width)then right = screen_width end
	if(bottom > screen_height)then bottom = screen_height end
	color = color or tocolor(255, 255, 255, 200)
	scale = scale or 1
	font = font or "default"
	alignX = alignX or "left"
	alignY = alignY or "top"
	clip = clip or false
	wordBreak = wordBreak or false
	postGUI = postGUI or true
	local alpha = intToAlpha(color)
	local text_width = 0
	local offset = 0
	local text_height = dxGetFontHeight(scale, font)
	local TEXT_WIDTH = dxGetTextWidth(text:gsub("#%x%x%x%x%x%x", ""), scale, font)
	local off = -TEXT_WIDTH
	local width = 0
	local height = 0
	if(alignX == "center")then
		left = left + width/2 - TEXT_WIDTH/2
	end
	if(alignX == "right")then
		left = left + width - TEXT_WIDTH
	end
	if(alignY == "center")then
		top = top + height/2 - text_height/2
	end
	if(alignY == "bottom")then
		top = top + height - text_height
	end
	alignX = "left"
	alignY = "top"
	
	-- 0 index ?
	local col1, col2 = string.find(text, "#%x%x%x%x%x%x")
	if col1 ~= nil then col1 = col1-1 end
	
	-- draw text with the color we sent until we find hexadecimal code.
	for i = 1, col1 or string.len(text) do
		text_width = dxGetTextWidth(string.sub(text, i, i), scale, font)
		dxDrawText(string.sub(text, i, i), left + offset, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI)
		offset = offset + text_width
	end
	while(string.find(text, "#%x%x%x%x%x%x", i))do
		local hex1, hex2 = string.find(text, "#%x%x%x%x%x%x")
		local r, g, b, a = getColorFromString(string.sub(text, hex1, hex2))
		text = string.sub(text, hex2 + 1)
		hex1, hex2 = string.find(text, "#%x%x%x%x%x%x")
		if hex1 ~= nil then hex1 = hex1-1 end
		for i = 1, hex1 or string.len(text) do
			text_width = dxGetTextWidth(string.sub(text, i, i), scale, font)
			dxDrawText(string.sub(text, i, i), left + offset, top, right, bottom, tocolor(r, g, b, alpha), scale, font, alignX, alignY, clip, wordBreak, postGUI)
			offset = offset + text_width
		end
	end
end

function intToAlpha(color)
	local a = 16777216
	local red, green, blue, alpha = 0, 0, 0, 0
	local ap = 1
	
	if(color < 0)then
		color = 2147483648 + (-color)
		alpha = 383
		ap = -ap
	end
	
	while(color >= a)do
		alpha = alpha + ap
		color = color - a
	end
	return alpha
end


function cdoshoot()
	if not isTimer(bindTrigger) then
		if getElementData(me,"state") == "funarea" then
			local vehicle = getPedOccupiedVehicle(me)
			local x,y,z = getElementPosition(vehicle)
			local rX,rY,rZ = getElementRotation(vehicle)
			local x = x+4*math.cos(math.rad(rZ+90))
			local y = y+4*math.sin(math.rad(rZ+90))
			createProjectile(vehicle, 19, x, y, z, 1.0, nil)
			bindTrigger = setTimer(allowShoots, 2000, 1)
		end
	end
end

function cdjump()
	if not isTimer(bindTrigger2) then
		if getElementData(me,"state") == "funarea" then
			local vehicle = getPedOccupiedVehicle(me)
			if isVehicleOnGround(vehicle) then
				local x,y,z = getElementVelocity(vehicle)
				setElementVelocity(vehicle,x,y,z+0.6)
				bindTrigger2 = setTimer(allowShoots, 12000, 1)
			end	
		end
	end	
end

function cdspeed()
	if not isTimer(bindTrigger3) then
		if getElementData(me,"state") == "funarea" then
			local vehicle = getPedOccupiedVehicle(me)
			if isVehicleOnGround(vehicle) then
				local x,y,z = getElementVelocity(vehicle)
				local rX,rY,rZ = getElementRotation(vehicle)
				local x = x+0.9*math.cos(math.rad(rZ+90))
				local y = y+0.9*math.sin(math.rad(rZ+90))
				setElementVelocity(vehicle,x,y,z)
				bindTrigger3 = setTimer(allowShoots, 6000, 1)
			end	
		end
	end	
end

function allowShoots ()
--Nothing but the beeest for youuuuuuuuuuuuu ^^
end
