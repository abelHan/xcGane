--[[
	GameCtrl --游戏控制类
	RoleData --游戏全局数据
	RPGGame  --游戏UI显示
--]]


GameCtrl = class("GameCtrl")


GameCtrl.target = nil
GameCtrl.callbackFun = nil
	
function GameCtrl:ctor()

end

function GameCtrl:setCallbackFun(target, callbackFun)
	self.target = target
	self.callbackFun = callbackFun
end
function GameCtrl:openScene(name, data)
	if self.callbackFun == nil then return end
	self.callbackFun(self.target,"scene",name,data)

end

function GameCtrl:openUI(name, data, eType)
	if self.callbackFun == nil then return end
	self.callbackFun(self.target,"ui",name,data,eType)
end

function GameCtrl:clearAllUI()
	if self.callbackFun == nil then return end
	self.callbackFun(self.target,"clearAllUI")
end


return GameCtrl