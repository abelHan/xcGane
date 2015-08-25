--[[
	整个游戏过程中一直存在
	界面显示
--]]



local RPGGame = class("RPGGame")

function RPGGame:ctor()
	self:init()
	self:initListener()

end

function RPGGame:init()
	self.uiNameAry = {}
	self.uiAry = {}
	self.ui = nil
	self.uiName = nil
	
	g_gameCtrl:setCallbackFun(self,self.changeModuleFun)
end

function RPGGame:initListener()


end
--modType : scene,ui,clearAllUI,fight
function RPGGame:changeModuleFun(modType, name, data, eType)  
	if modType == "scene" then
		self:switchScene(name, data)
		return
	end
	
	if modType == "ui" then
		self:switchUI(name, data, eType)
		return
	end
	
	if modType == "clearAllUI" then
		self:clearAllUI()
		return
	end
end

function RPGGame:switchScene(name,data) 

	local sceneClass = requireM(g_require_scene .. name)
	
	local scene = sceneClass.new()
	
	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(scene)
	else
		cc.Director:getInstance():runWithScene(scene)
	end
	self.scene = scene
	if scene.initByData  then scene:initByData(data) end
	

end

function RPGGame:switchUI(name,data) 
	-- 当前界面已经打开
	if self.uiName == name then return end
	-- 打开的已经在打开列表里
	local tempLen1 = #self.uiNameAry
	
	for i = 1, tempLen1 do 
		if self.uiNameAry[i] == name then
			local tempName = name
			self.uiName = tempName
			self.uiNameAry[#self.uiNameAry + 1] = tempName
			tabel.remove(self.uiNameAry, i)
			
			local tempUI = self.uiAry[i]
			self.ui:hide()
			local tempZOrder = self.ui:getZOrder()
			self.ui = tempUI
			self.ui:show()
			self.ui:setZOrder(tempZOrder + 1)
			self.uiAry[#self.uiAry + 1] = tempUI
			tabel.remove(self.uiAry, i)
			
			return
		end
	end
	
	--打开新的界面
	local tempZOrder1 = 0
	if self.ui then 
		self.ui:hide()
		tempZOrder1 = self.ui:getZOrder()
	end
	
	self.uiName = name
	
	self.ui = requireM(g_require_ui .. name).new(data)
	
	g_layerManager.UILayer:addUI(self.ui)
	self.ui:setZOrder(tempZOrder1)
	
end

function RPGGame:clearAllUI() 
	for key,value in ipairs(self.uiAry) do
		if value then
			value:close()
		end
	end
	
	self.ui = nil
	self.uiName = nil
	self.uiAry = {}
	self.uiNameAry = {}
	
	g_layerManager.UILayer:hideRes()
end

--退出游戏
function RPGGame:onBackGame()
	

end

return RPGGame