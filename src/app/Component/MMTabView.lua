--[[
	MMTabView
	页签群

--]]


local MMTabView = class("MMTabView",function ()
	return cc.Node:create()
end)
--[[
	tab 信息 key含义
	normalUrl   --未按下时按钮显示图片的路径
	selectedUrl       --按下时按钮显示图片的路径
	text                 -- 文字内容
	
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
	
	self:createBg()
	self:createTabGroup(self.tabInfo)
end

function MMTabView:createTabGroup(tabInfo)
	if #self.tabList~= 0 then
		for i,v in ipairs(self.tabList) do
			self:removeChild(v)
		end
		self.tabList = {}
	end
	for i,v in ipairs(tabInfo) do
		local node = self:createTab(v)
		node:setPosition(self.tabPos[i])
		self:addChild(node)
		self.tabList[#self.tabList + 1] = node	
	end

end

function MMTabView:calcTabPos()
	self.tabPos = {}
	
end

function MMTabView:createTab(info)
	local node = cc.Node:create()
	
	
	
	return node
end

function MMTabView:createBg(pngUrl)
	if pngUrl == nil then pngUrl = g_load_ui .. "defaul/tabview_bg.png" end
	
	local bgImg =  ccui.ImageView:create()
	bgImg:loadTexture(pngUrl)
	self:addChild(bgImg)
	self.bgImg = bgImg
	
	bgImg:setScale9Enabled(true)
	bgImg:setContentSize(self.areaSize)

end

function MMTabView:setCallBackFunc(callBack)
	self.callBack = callBack
end






return MMTabView
