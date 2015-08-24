--[[
	MMTabView
	页签群

--]]

local MMLabel  = requireM(g_require_com .. "MMLabel")


local MMTabView = class("MMTabView",function ()
	return cc.Node:create()
end)
--[[
	tab 信息 key含义
	normalUrl   --未按下时按钮显示图片的路径
	selectedUrl       --按下时按钮显示图片的路径
	txt                 -- 文字内容
	
--]]
MMTabView.TAB_LEFT = 1
MMTabView.TAB_RIGHT = 2
MMTabView.TAB_TOP = 3
MMTabView.TAB_BOTTOM = 4
function MMTabView:ctor(areaSize,tabInfo,callBack,tabType)
	self.areaSize = areaSize			--
	self.tabInfo = tabInfo
	self.callBack = callBack
	self.tabType = tabType
	self.tabList = {}
	self.labelList = {}
	
	self:createBg()
	self:createTabGroup(self.tabInfo)
end

function MMTabView:createTabGroup(tabInfo)
	self.menu = cc.Menu:create()
	self:addChild(self.menu)
	
	if #self.tabList~= 0 then
		for i,v in ipairs(self.tabList) do
			self.menu:removeChild(v)
		end
		self.tabList = {}
	end
	for i,v in ipairs(tabInfo) do
		local node = self:createTab(v,i)
		
		self.menu:addChild(node)
		self.tabList[#self.tabList + 1] = node

		--添加文字
		-- local label = MMLabel.new(v.txt or "",v.fontFileName or "res/font/font_youer.ttf",
			-- v.fontSize or 22,v.areaSize)
		-- node:addChild(label)
		-- local tempSize = node:getContentSize()
		-- label:setPosition(cc.p(tempSize.width/2,tempSize.height/2))
		-- label:setZOrder(100)
	end
	
	--定位
	self:calcTabPos()
	for i,v in ipairs(self.tabList) do
		if v then
			v:setPosition(self.tabPos[i])
		end	
	end

end

function MMTabView:calcTabPos()
	self.tabPos = {}
	local tempWidth = 50
	local tempHeight = 50
	local space = 20
	if self.tabList[1] then
		local tempSize = self.tabList[1]:getContentSize()
		tempWidth = tempSize.width
		tempHeight = tempSize.height
	end
	
	if self.areaSize then
		for i = 1, #self.tabList do
			local x = self.areaSize.width/2 + tempWidth/2
			local y = self.areaSize.height/2 - tempHeight/2 - (i-1) *(tempHeight + space)
			self.tabPos[#self.tabPos + 1] = cc.p(x,y)			
		end
	end
	
end

function MMTabView:createTab(info,tag)
	local normalUrl = info.normalUrl or  g_load_ui .. "defaul/tabview_btn1.png"
	local selectedUrl = info.selectedUrl or g_load_ui .. "defaul/tabview_btn2.png"
	local node1 = cc.MenuItemImage:create(normalUrl, normalUrl)
	local node2 = cc.MenuItemImage:create(selectedUrl, selectedUrl)	
	local nodeToggle = cc.MenuItemToggle:create(node1,node2)
	--文字内容
	local label = MMLabel.new(info.txt or "",info.fontFileName or "res/font/font_youer.ttf",
		info.fontSize or 22,info.areaSize)
	node1:addChild(label)
	local tempSize = node1:getContentSize()
	label:setPosition(cc.p(tempSize.width/2,tempSize.height/2))
	
	local label2 = MMLabel.new(info.txt or "",info.fontFileName or "res/font/font_youer.ttf",
		info.fontSize or 22,info.areaSize)
	node2:addChild(label2)
	local tempSize = node2:getContentSize()
	label2:setPosition(cc.p(tempSize.width/2,tempSize.height/2))	

	nodeToggle:registerScriptTapHandler(function (index, target)
			self:resetTabs()
			target:setSelectedIndex(1)
			print("see selected index>>>>" .. index)
			if self.callBack then			
				self.callBack(index)
			end				
		end)
	nodeToggle:setTag(tag or 0)
	
	return nodeToggle
end

function MMTabView:resetTabs()
	if self.tabList == nil then return end
	
	for i,v in ipairs(self.tabList) do
		if v then
			v:setSelectedIndex(0)
		end
	end
end


function MMTabView:createBg(pngUrl)
	if pngUrl == nil then pngUrl = g_load_ui .. "defaul/tabview_bg.png" end
	
	local bgImg =  ccui.ImageView:create()
	bgImg:loadTexture(pngUrl)
	self:addChild(bgImg)	
	bgImg:setScale9Enabled(true)
	bgImg:setContentSize(self.areaSize)
	local s = cc.Director:getInstance():getWinSize()
	bgImg:setPosition(cc.p(s.width/2,s.height/2))
	
	self.bgImg = bgImg

end

function MMTabView:setCallBackFunc(callBack)
	self.callBack = callBack
end
return MMTabView




