--[[
	登录界面

--]]

local LoginScene = class("LoginScene",function()
	return cc.Scene:create()
end)

function LoginScene:create()
	local scene = LoginScene.new()
	scene:addChild(scene:createLayerSprite())
	scene:addChild(scene:createLayerLabelAndBtn())
	return scene
end

function LoginScene:ctor()
	
end

function LoginScene:createLayerSprite()
	print("hello11 ")
	local layerSprite = cc.Layer:create()
	local config = {parent = layerSprite,pos =cc.p(200,200),
		pngUrl = g_load_ui .. "PlaySceneBg.jpg"}
	local sprite = g_GUIcreator:createSprite(config)

	return layerSprite
end

function LoginScene:createLayerLabelAndBtn()
	print("hello22 ")
	local layer = cc.Layer:create()
	--button
	local configBtn = {parent = layer,pos = cc.p(100,100),
		normalUrl = g_load_ui .. "PlayButton.png", txt = "开始", txtColor = cc.c3b(255,0,0)}
	local tempBtn = g_GUIcreator:createButton(configBtn)
	
	--label
	local configLabel = {parent = layer,pos = cc.p(200, 500),
		txt = "人生如是久长时",fontSize = 28,txtColor = cc.c3b(255,0,0)}
	local tempLabel = g_GUIcreator:createLabel(configLabel)
	
	--ImageView
	local configImg ={parent = layer,pos = cc.p(100,500),
		pngUrl = g_load_ui .. "Star.png"}
	local tempImg = g_GUIcreator:createImg(configImg)
	
	
	return layer
end

return LoginScene