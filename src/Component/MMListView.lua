--[[
MMListView


--]]

local MMListView = class("MMListView",function()
	return ScrollView:create()
end)

function MMListView:ctor()
	self.rowNum = 1 						--列数
	self.cellTab = {} 						--cell对象
	self.cellCreateCallBack = nil 			--创建cell时用到的回调函数
	self.cellSize = nil 					--cell大小
	self.data  =nil   						--创建cell时用到的数据
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

--isFramingLoad 是否分帧加载
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

--显示整个控件区域
function MMListView:showRect()

end





return MMListView