--[[
	���ݹ�����  ���ⲿ��ȡ���е�����
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

-- ��ȡ�������õ�������
function DataManager:init()
	-- self:openDB()
end

function DataManager:openDB()
	local dbPath = nil
	
	for key,value in pairs(self.dbList) do
		local dbPath = g_load_data .. key .. "db"
		local db = sql.open(dbPath)
		
		print("���ݿ�>>" .. key .. "  open")
		self.dbList[key] = db
	
	end
end

--�ر����ݿ�
function DataManager:closeDB()
	for key,value in pairs(self.dbList) do
		if value ~= nil then
			value:close()
		end
	end
end
-------------------------------��ȡ����----------------------------------
-- ��ȡ��Ϸ��ص����� ���Ƿ���Ч��
function DataManager:readGameConfig()

end

-- ��ȡĳ���������Ϣ
function DataManager:readPlayerData()

end

-- ��ȡ��Դ��ID��
-- key  url
function DataManager:readRes()

end

-- ��ȡ���еĹؿ�����
function DataManager:readAllLevelData()

end

-- ��ȡ���еĳɾͱ�
function DataManager:readAllTask()

end

-------------------------------------------------------------------------------

------------------------------��ȡ����-----------------------------------------

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

-- ��ȡ����ͨ������
-- game player level task
function DataManager:getDataByModel(model)
	if model == "game" then  return self:getGameConfig()  end
	if model == "player" then return self:getPlayerData() end
	if model == "level" then return self:getLevelData() end
	if model == "task"  then return self:getTaskData() end	
	return nil
end
-------------------------------------------------------------------------------

------------------------------��Ϸ�˳�ʱ��������-----------------------------------------

function DataManager:saveUserData()
	
end

-------------------------------------------------------------------------------

------------------------------,,,,,-----------------------------------------
return DataManager

