--[[

FunctionCtrl.lua
��Ϸscene,UIת��

--]]

FunctionCtrl = class("FunctionCtrl")

function FunctionCtrl:ctor()
	self:initData()
	self:initListener()
end

--��ʼ������
function FunctionCtrl:initData()
	
end

--��ʼ����Ϣ����
function FunctionCtrl:initListener()


end

--��ս������
function FunctionCtrl:openFight(data)


end

--ֱ�Ӵ�ĳ������
function FunctionCtrl:openUIByIDNotCheck(functionID, data)

end

--�ⲿ���ã���ĳ������
function FunctionCtrl:openUIByID(functionID, data)
	
	
	self:openUIByIDNotCheck(functionID,data)
end

--���ĳ�������淨�Ƿ񿪷�
function FunctionCtrl:checkIsOpened(functionID)

	return true
end

--��ȡĳ���淨�ķ��ŵȼ�
function FunctionCtrl:getOpenLevel(functionID)


end




