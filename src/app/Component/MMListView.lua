--[[
MMListView


--]]


-- 使用方法
-- local tempListView = MMListView.new();
-- touchLayer:addWidget(tempListView)
-- tempListView:setSize(cc.size(504,146))
-- tempListView:setRowNum(2);
-- tempListView:setCellSize(cc.size(250,70))

-- tempListView:createCellFunc(function(index,data)
		-- local box = g_class.MMWidget.new();
		-- box:setMMContentSize(250,70)
		-- box:setAnchorPoint(ccp(0,0));
		-- local tempRender = RoleUIEquipItemAttrAddRender.new(data);
		-- box:addChild(tempRender)   
		-- tempRender:setPosition(ccp(40,box:getContentSize().height/2+20))             
		-- box:setSize(cc.size(250,70));
		-- box:ignoreContentAdaptWithSize(false);
		-- return box;
	-- end)

-- tempListView:reloadByData(data)
		
local MMListView = class("MMListView",function()
	return cc.Node:create() 
end)

function MMListView:ctor()

	local scrollView = ccui.ScrollView:create()
	self:addChild(scrollView,2)
	self.scrollView = scrollView

	self.rowNum = 1 						--列数
	self.cellTab = {} 						--cell对象
	self.cellCreateCallBack = nil 			--创建cell时用到的回调函数
	self.cellSize = nil 					--cell大小
	self.cellPos  = {}						--cell所有位置信息
	self.data  =nil   						--创建cell时用到的数据
end

function MMListView:setBackGroundImage(pngUrl)

	local showBg = ccui.ImageView:create()
	self.showBg = showBg
	
	showBg:setScale9Enabled(true)
	if self.contentSize then
		showBg:setContentSize(self.contentSize)
		self:adjustBg(self.contentSize)		
	end
	showBg:loadTexture(pngUrl or g_load_ui .."defaul/scrollview_bg.png")
	self:addChild(showBg,1)

	
end

function MMListView:initData()

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
	self.cellPos  = {}
	local cellNum = #self.cellData
	local lineNum = math.ceil(cellNum/self.rowNum) - 1
	local cellSize = self:getCellSize()
	local tempX,tempY = 0,cellSize.height *lineNum - 10
	local visibleSize = self.contentSize
	
	for i = 1,cellNum do
		self.cellPos[i] = cc.p(tempX, tempY)
		if (i % self.rowNum) == 0 then
			--换行
			tempY = tempY - cellSize.height
			tempX = 0
		else
			--同一行
			tempX = tempX + cellSize.width
		end
	end
	
	local tempHeihgt = cellSize.height * (lineNum + 1)
	if tempHeihgt >= visibleSize.height then
		self.scrollView:setBounceEnabled(true)
	else
		self.scrollView:setBounceEnabled(false)
		--不够时集体上移
		local length = visibleSize.height - tempHeihgt
		for i,v in ipairs(self.cellPos) do
			v.y = v.y + length
		end
	end
	
	--设置参数
	self.scrollView:setInnerContainerSize(cc.size(cellSize.width * self.rowNum,cellSize.height * (lineNum + 1)))
	
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

function MMListView:setSize(contentSize)
	self.contentSize = contentSize
	if self.scrollView then 
		self.scrollView:setContentSize(contentSize) 
	end
	
	self:adjustBg(contentSize)

end

function MMListView:adjustBg(contentSize)
	if contentSize == nil or self.showBg == nil then return  end
	if self.showBg then 
		local bgSize = cc.size(contentSize.width +20,contentSize.height + 20)
		self.showBg:setContentSize(bgSize)
		self.showBg:setPosition(cc.p(contentSize.width/2,contentSize.height/2))
	end	
end

--isFramingLoad 是否分帧加载
function MMListView:reloadByData(data, isFramingLoad)
	self.cellTab = {}
	self.scrollView:removeAllChildren()
	self.cellData = data
	if #data <= 0 then
		return
	end
	self:calculateCellsPos()
	
	for i,v in ipairs(self.cellData) do
		if self.cellCreateCallBack == nil then
			print("[reloadByData]:lack of cell creating function")
			break
		end
		
		local cellView = self.cellCreateCallBack(i,v,self.cellPos[i])
		if cellView then
			cellView:setPosition(self.cellPos[i])
			self.cellTab[#self.cellTab + 1] = cellView
			self.scrollView:addChild(cellView)		
		end
		
	end
	
	if self.onLoadCompleteFunc then
		self.onLoadCompleteFunc(self.cellData)
	end
	
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
	local tempSize = self.contentSize
	if tempSize == nil then return end
	
	local draw = cc.DrawNode:create()
	self:addChild(draw,3)
	draw:drawRect(cc.p(0,0),cc.p(tempSize.width,tempSize.height),cc.c4f(1,1,0,1))
end


return MMListView