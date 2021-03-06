--[[
	登录界面

--]]


local MMListView = requireM(g_require_com .. "MMListView")
local MMRichText = requireM(g_require_com .. "MMRichText")
local MMTabView  = requireM(g_require_com .. "MMTabView")

-- local LoginScene = class("LoginScene",function()
	-- return cc.Scene:create()
-- end)
local LoginScene = class("LoginScene",g_class.MMScene)


-- function LoginScene:create()
	-- local scene = LoginScene.new()
	-- scene:addChild(scene:createLayerSprite())
	-- scene:addChild(scene:createLayerLabelAndBtn())
	-- scene.index = 3
	-- return scene
-- end


function LoginScene:ctor()
	self.super.ctor(self)
	-- self:addChild(self:createLayerSprite())
	-- self:addChild(self:createLayerLabelAndBtn())
	self:addChild(self:createLayer())
	self.index = 3
end


function LoginScene:callFun(sender)
	print("see the data" .. self.index)
end
function LoginScene:callFun1(hasSelected)

	if self.label == nil then return end
	if hasSelected then
		self.label:setColor(cc.c3b(0,255,0))
	else
		self.label:setColor(cc.c3b(0,0,255))	
	end
end


function LoginScene:createLayer()

	local winSize = cc.Director:getInstance():getWinSize()
	
	local layerSprite = cc.Layer:create()
	local config = {parent = layerSprite,pos =cc.p(winSize.width/2,winSize.height/2),
		pngUrl = g_resManager.PlaySceneBg}
	local sprite = g_GUIcreator:createSprite(config)
	
	local configBtnLogin = {parent = layerSprite,pos = cc.p(winSize.width/2,winSize.height/2 - 100),
		normalUrl = g_resManager.PlayButton, txt = "用户登录", txtColor = cc.c3b(255,0,0),
		clickEvent = self.showLoginPanel, target = self}
	local tempBtn = g_GUIcreator:createButton(configBtnLogin)
	
	local configBtnBegin = {parent = layerSprite,pos = cc.p(winSize.width/2,winSize.height/2 - 200),
		normalUrl = g_resManager.PlayButton, txt = "游客开始", txtColor = cc.c3b(255,0,0),
		clickEvent = self.playAsVisitor, target = self}
	local tempBtn = g_GUIcreator:createButton(configBtnBegin)
	

	return layerSprite
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
		normalUrl = g_load_ui .. "PlayButton.png", txt = "开始", txtColor = cc.c3b(255,0,0),
		clickEvent = self.callFun, target = self}
	local tempBtn = g_GUIcreator:createButton(configBtn)
	
	--label
	local configLabel = {parent = layer,pos = cc.p(100, 500),
		txt = "人生若是久长时,\n又岂在朝朝暮暮",fontSize = 28,txtColor = cc.c3b(255,0,0),areaSize = cc.size(300,0)}
	local tempLabel = g_GUIcreator:createLabel(configLabel)
	self.label = tempLabel
	
	--ImageView
	local configImg ={parent = layer,pos = cc.p(100,500),
		pngUrl = g_load_ui .. "Star.png"}
	local tempImg = g_GUIcreator:createImg(configImg)
	
	local configCheck ={parent = layer,pos = cc.p(100,200),
		callBack = self.callFun1,target = self,txt = "字体颜色"}
	local tempCheck = g_GUIcreator:createMMCheck(configCheck)

	local configField ={parent = layer,pos = cc.p(100,400),areaSize=cc.size(200,50),
		fontSize = 24,target = self,txt = "aaaaaaaaaaaaaaaaaaaaaaaaaaaa"}
	local tempField = g_GUIcreator:createTextField(configField)	
	
	 local cellSize = cc.size(250,150)
	-- local tempListView = MMListView.new()
	-- layer:addChild(tempListView)
	-- tempListView:setSize(cc.size(500,500))
	-- tempListView:setCellSize(cellSize)
	-- tempListView:setRowNum(2)
	-- tempListView:setPosition(ccp(300,100))
	-- tempListView:setBackGroundImage()
	-- tempListView:createCellFunc(function (index,data,pos)
		-- print("see the cell data>>" .. data)
		-- local node = cc.Node:create()
		-- local configBtn = {parent = node,pos = cc.p(cellSize.width/2, cellSize.height/2),
			-- normalUrl = g_load_ui .. "PlayButton.png", txt = "开始", txtColor = cc.c3b(255,0,0),
			-- clickEvent = self.callFun, target = self}
		-- local box = g_GUIcreator:createButton(configBtn)
		-- return node	
	-- end)
	
	-- tempListView:reloadByData({1,2,3,4,5,6,7,8,9,10,11})
	-- tempListView:showRect()
	
	-- local richText = MMRichText.new(cc.size(600,600))
	-- richText:setPosition(cc.p(300,100))
	-- layer:addChild(richText)
	-- richText:addText({color = cc.c3b(255,0,255),text = "我与地坛",fontSize = 24})
	-- richText:addImage({color = cc.c3b(255,0,255),filePath = g_load_ui .. "Star.png"})
	
	
	-- local node = cc.Node:create()
	-- local configBtn = {parent = node,pos = cc.p(cellSize.width/2, 0),
		-- normalUrl = g_load_ui .. "PlayButton.png", txt = "开始", txtColor = cc.c3b(255,0,0),
		-- clickEvent = self.callFun, target = self}
	-- local box = g_GUIcreator:createButton(configBtn)
	-- richText:addCustomNode({color = cc.c3b(255,0,255),customNode = node})
	
	
	-- function MMTabView:ctor(areaSize,tabInfo,callBack,tabType)
	
	local tabInfo = {{txt = "tab1"},{txt = "tab2"},{txt = "tab3"},{txt = "tab4"}}
	local tabView =  MMTabView.new(cc.size(350,350),tabInfo,function(index)
		print("see the index>>>" .. index)
	end)
	
	layer:addChild(tabView)
	
	return layer
end

function LoginScene:showLoginPanel()
	print("showLoginPanel>>>")

end

function LoginScene:playAsVisitor()
	print("playAsVisitor>>>")

end


return LoginScene