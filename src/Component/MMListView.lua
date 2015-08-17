--[[
MMListView


--]]

local MMListView = class("MMListView",function()
	return ScrollView:create()
end)

function MMListView:ctor()
	self.rowNum = 1 						--����
	self.cellTab = {} 						--cell����
	self.cellCreateCallBack = nil 			--����cellʱ�õ��Ļص�����
	self.cellSize = nil 					--cell��С
	self.data  =nil   						--����cellʱ�õ�������
end

function MMListView:setRowNum(row)
	self.rowNum = row
end

function MMListView:getRowNum()
	return self.rowNum
end

function MMListView:createCellFunc(func)
	self.cellCreateCallBack = func
end

function MMListView:calculateCellsPos()

end

function MMListView:setCellSize(cellSize)
	self.cellSize = cellSize
end

function MMListView:getCellSize()
	return self.cellSize
end

function MMListView:onLoadComplete(func)
	self.onLoadCompleteFunc = func
end

function MMListView:getData()
	return self.data
end

function MMListView:getCell()
	return self.cellTab
end

--isFramingLoad �Ƿ��֡����
function MMListView:reloadByData(data, isFramingLoad)

end

function MMListView:appendData(data)

end

function MMListView:startScheduler()


end

function MMListView:stopScheduler()


end

function MMListView:removeAllCell()

end

--��ʾ�����ؼ�����
function MMListView:showRect()

end





return MMListView