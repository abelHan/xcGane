--[[
	数据管理类  从外部读取所有的数据
	DataManager
--]]


local DataManager = class("DataManager")


function DataManager:ctor()
	self:init()
	self:readGameConfig()
	self:readPlayerData()
	self:readRes()
	self:readAllLevelData()
	self:readAllEvent()
end

-- 读取所有配置档的名称
function DataManager:init()

end
-------------------------------读取配置----------------------------------
-- 读取游戏相关的配置 如是否开音效等
function DataManager:readGameConfig()

end

-- 读取某个的玩家信息
function DataManager:readPlayerData()

end

-- 读取资源的ID表
-- key  url
function DataManager:readRes()

end

-- 读取所有的关卡数据
function DataManager:readAllLevelData()

end

-- 读取所有的成就表
function DataManager:readAllTask()

end

-------------------------------------------------------------------------------

------------------------------获取数据-----------------------------------------

function DataManager:getGameConfig() 

end

function DataManager:getPlayerData() 

end

function DataManager:getLevelData() 

end

function DataManager:getTaskData() 

end

function DataManager:getResByID(id)
	local url = ""
	
	
	return url
end

-- 获取数据通过名称
-- game player level task
function DataManager:getDataByModel(model)
	if model == "game" then  return self:getGameConfig()  end
	if model == "player" then return self:getPlayerData() end
	if model == "level" then return self:getLevelData() end
	if model == "task"  then return self:getTaskData() end	
	return nil
end
-------------------------------------------------------------------------------

------------------------------游戏退出时保存数据-----------------------------------------

function DataManager:saveUserData()
	
end

-------------------------------------------------------------------------------

------------------------------,,,,,-----------------------------------------
return DataManager

