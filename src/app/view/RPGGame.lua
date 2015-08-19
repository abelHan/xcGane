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

end

function RPGGame:switchUI(name,data) 

end

function RPGGame:clearAllUI() 

end

--退出游戏
function RPGGame:onBackGame()


end

return RPGGame