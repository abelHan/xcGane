--[[
	����

--]]

local RoleData = class("RoleData")

function RoleData:ctor()

end

--ȫ�ֱ���
RoleData.starNumMax = 3  --ͨ���������
--�������
RoleData.player = nil            --�����Ϣ
RoleData.inventory = nil        --����
RoleData.events     = nil         --���� �ɾ�
RoleData.levels        =nil         --�ؿ�����
--��Ϸ״̬

--function
--����������
function RoleData:setFunctionBlackList(data) 

end
function RoleData:isFunctionBlack(id) 

end
-- ���ݱ��
function RoleData:updateData(data) 

end

function RoleData:onPlayerInfoChange(data) 

end

function RoleData:onItemInfoChange(data) 

end

function RoleData:onTaskInfoChange(data) 

end
-- �ؿ�����
function RoleData:getLevelInfoByEntry(entry) 

end

function RoleData:setLevelInfoByEntry(data) 

end

--  �����е�����
function RoleData:getItemInfoByEntry(entry) 

end

function RoleData:setItemInfoByEntry(data) 

end

function RoleData:updateItemNum(id,num) 

end

function RoleData:removeBagItem(entry) 

end

-- ��ȡ���� 
function RoleData:getTaskInfoByEntry(entry)  

end

function RoleData:setTaskInfoByEntry(entry,data)  

end

function RoleData:getAllTaskData()  

end

return RoleData
