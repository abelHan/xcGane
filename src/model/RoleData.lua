--[[
	数据

--]]

local RoleData = class("RoleData")

function RoleData:ctor()

end

--全局变量
RoleData.starNumMax = 3  --通关最大星数
--玩家数据
RoleData.player = nil            --玩家信息
RoleData.inventory = nil        --包裹
RoleData.events     = nil         --任务 成就
RoleData.levels        =nil         --关卡数据
--游戏状态

--function
--黑名单功能
function RoleData:setFunctionBlackList(data) 

end
function RoleData:isFunctionBlack(id) 

end
-- 数据变更
function RoleData:updateData(data) 

end

function RoleData:onPlayerInfoChange(data) 

end

function RoleData:onItemInfoChange(data) 

end

function RoleData:onTaskInfoChange(data) 

end
-- 关卡数据
function RoleData:getLevelInfoByEntry(entry) 

end

function RoleData:setLevelInfoByEntry(data) 

end

--  背包中的数据
function RoleData:getItemInfoByEntry(entry) 

end

function RoleData:setItemInfoByEntry(data) 

end

function RoleData:updateItemNum(id,num) 

end

function RoleData:removeBagItem(entry) 

end

-- 获取任务 
function RoleData:getTaskInfoByEntry(entry)  

end

function RoleData:setTaskInfoByEntry(entry,data)  

end

function RoleData:getAllTaskData()  

end

return RoleData
