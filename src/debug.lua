--[[
	�������صķ���


--]]


local loadModelLua = {}
local loadAllLua = {}

local lastPrint = print
function print(...)
	lastPrint(...)
end

function lastDump = dump
function dump(...)
	lastDump(...)
end

function writeLogFun(str,model)
	if is_write_local_log ~= true then return end
	if str == nil or str == "" then return end
	if model == nil or model == "" then model = "LogInfo" end
	
	if type(str) == "userdata" then return end
	if type(str) == "function" then return end
	
	if type(str) == "boolean" then 
		if str == true then
			str = "true"
		else
			str = "false"
		end
	end
	
	if __FileLog == nil then
		__FileLog == io.open(FileUtils:getInstance():getWritablePath() .. "debug.log","wb")
	end
	
	local modelStr = "[".. model .."]  "
	__FileLog:write("\n" .. modelStr ..str)
	__FileLog:flush()
end

function __LogM(cls,model ,...)
	if cls == nil then return end
	
	cclog(cls)
	writeLogFun(cls,model)
end
function logI(cls,model,...)
	--10
	__LogM(cls,model,...)
	--7
end

function logR(cls,model,...)
	--13
	__LogM(cls,model,...)
	--7
end

-- ��װrequire����¼���ص�ģ��
function requireM(moduleFullName, model)
	
	if model ~= nil and model ~= "" then
		if loadModelLua[model] == nil then
			loadModelLua[model] = {}
		end
		
		local num = #loadModelLua[model] + 1
		loadModelLua[model][num] = moduleFullName
	
	end

	return require(moduleFullName)
end

-- �����¼��ģ��
function removeRequire(model)
	if model == nil or model == "" then return end
	local list = loadModelLua[model]
	if list ~= nil then
		for i = 1, #list do
			__LogM(list[i] .. " ����ɹ�","debug")
			package.loaded[list[i]] = nil	
		end
	end
	
	list = nil
	loadModelLua[model] = nil
end

