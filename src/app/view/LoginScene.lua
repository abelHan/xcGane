--[[
	登录界面

--]]

local LoginScene = class("LoginScene",function
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
	local layerSprite = cc.Layer:create()
	local config = {parent = layerSprite,pos =cc.p(200,200),
		pngUrl = g_load_ui .. "PlaySceneBg.jpg"}
	local sprite = g_GUIcreator:createSprite(config)

	return layerSprite
end

function LoginScene:createLayerLabelAndBtn()
	local layer = cc.Layer:create()
	--button
	local configBtn = {parent = layer,pos = cc.p(100,100),
		normalUrl = g_load_ui .. "PlayButton.png", txt = "开始", txtColor = cc.c3b(255,0,0)}
	local tempBtn = g_GUIcreator:createButton(configBtn)
	
	--label
	local configLabel = {parent = layer,pos = cc.p(100, 300),
		txt = "游戏说明",fontSize = 24}
	local tempLabel = g_GUIcreator:createLabel(configLabel)
	
	--ImageView
	local configImg ={parent = layer,pos = cc.p(100,500),
		pngUrl = g_load_ui .. "Star.png"}
	local tempImg = g_GUIcreator:createImg(configImg)
	
	
	return layer
end

return LoginScene