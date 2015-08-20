--[[
	复选框

--]]


local MMCheck = class("MMCheck", function ()
	return ccui.CheckBox:create()
end)


function MMCheck:ctor(pngs,txt,fontSize,callFun,target)
	self:setTouchEnabled(true)
	self:setSelected(true)
	if pngs == nil then
		pngs = {background = g_load_ui .. "defaul/check_box_normal.png",
			backgroundSelected = g_load_ui .. "defaul/check_box_normal_press.png",
			cross = g_load_ui .. "defaul/check_box_active.png",
			backgroundDisabled = g_load_ui .. "defaul/check_box_normal_disable.png",
			frontCrossDisabled = g_load_ui .. "defaul/check_box_active_disable.png"}
	end
	self:loadTextures(pngs.background,
			pngs.backgroundSelected,
			pngs.cross,
			pngs.backgroundDisabled,
			pngs.frontCrossDisabled
	)
	self.callFun = callFun
	self.target = target
	local function selectedEvent(sender, eventType)
		local hasSelected = false
		if eventType == ccui.CheckBoxEventType.selected then
			hasSelected = true
		elseif eventType == ccui.CheckBoxEventType.unselectd then
			hasSelected = false
		end
		if self.callFun then
			self.callFun(self.target,hasSelected)
		end
	end
	self:addEventListener(selectedEvent)
	
	--文字
	local label = cc.Label:createWithTTF(txt or "","res/font/font_youer.ttf",fontSize or 22)
	label:setVerticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	local tempSize = self:getContentSize()
	label:setPosition(ccp(tempSize.width,tempSize.height/2))
	label:setAnchorPoint(cc.p(0,0.5))
	self:addChild(label)
	self.label = label
	
end

function MMCheck:setSelectedEvent(func,target)
	self.callFun = func
	self.target = target
end

return MMCheck 