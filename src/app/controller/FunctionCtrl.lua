--[[

FunctionCtrl.lua
游戏scene,UI转换

--]]

local FunctionCtrl = class("FunctionCtrl")

FunctionCtrl.functionAry ={
	{1001001, "1001001"},
	{1001002, "1001002"},	
	{1001003, "1001003"},
	{1001004, "1001004"}}

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

function FunctionCtrl:getUINameByID(functionID)
	for v,k in pairs(self.functionAry) do
		if v[1] == functionID then
			return v[2]
		end
	
	end
	print("未找到指定的UI....."  .. functionID)
	return nil

end
--直接打开某个界面
function FunctionCtrl:openUIByIDNotCheck(functionID, data)
	
	local name = self.getUINameByID(functionID)
	local uiData = 	g_dataManager.getUIConfigByID(functionID)
		
	if functionID == 0 then
	
	end

	if name then
		g_gameCtrl:openUI(name, {config = uiData, detail = data})
	end
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


return FunctionCtrl

