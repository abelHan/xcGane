--[[
	数据管理类  从外部读取所有的数据
	DataManager
--]]


local DataManager = class("DataManager")

DataManager.dbList = {
	ui_config = nil,
	other = nil,

}

function DataManager:ctor()
	self:init()
	self:readGameConfig()
	self:readPlayerData()
	self:readRes()
	self:readAllLevelData()
	self:readAllTask()
end

-- 读取所有配置档的名称
function DataManager:init()
	-- self:openDB()
	self:openLua()
end

function DataManager:openLua()
	local luaPath = nil
	for key,value in pairs(self.dbList) do
		luaPath = g_load_data .. "key" .. ".lua"
		
		print("数据库>>" .. key .. "  open")
		
		self.dbList[key] = requirM(luaPath)
	end
end

function DataManager:openDB()
	local dbPath = nil
	
	for key,value in pairs(self.dbList) do
		local dbPath = g_load_data .. key .. "db"
		local db = sql.open(dbPath)
		
		print("数据库>>" .. key .. "  open")
		self.dbList[key] = db
	
	end
end

--关闭数据库
function DataManager:closeDB()
	for key,value in pairs(self.dbList) do
		if value ~= nil then
			value:close()
		end
	end
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

