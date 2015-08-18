--[[

FunctionCtrl.lua
游戏scene,UI转换

--]]

FunctionCtrl = class("FunctionCtrl")

function FunctionCtrl:ctor()
	self:initData()
	self:initListener()
end

--初始化数据
function FunctionCtrl:initData()
	
end

--初始化消息监听
function FunctionCtrl:initListener()


end

--打开战斗界面
function FunctionCtrl:openFight(data)


end

--直接打开某个界面
function FunctionCtrl:openUIByIDNotCheck(functionID, data)

end

--外部调用，打开某个界面
function FunctionCtrl:openUIByID(functionID, data)
	
	
	self:openUIByIDNotCheck(functionID,data)
end

--检测某个界面玩法是否开放
function FunctionCtrl:checkIsOpened(functionID)

	return true
end

--获取某个玩法的发放等级
function FunctionCtrl:getOpenLevel(functionID)


end




