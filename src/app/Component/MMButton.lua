--[[
--按钮


--]]


local MMButton = class("MMButton", function()
	return ccui.Button:create()
 end)
 
 
function MMButton:ctor(png,x,y,txt,fontSize,selectedPng,isDisableShadow)
	if png then
		if string.byte(png) == 35 then   -- 35 #
			local filename = string.sub(png, 2)
			self:loadTextureNormal(filename, UI_TEX_TYPE_PLIST)
		else
			self:loadTextureNormal(png,UI_TEX_TYPE_LOCAL)		
		end
	
	end
	self:setPosition(cc.p(x or 0,y or 0))
	if txt then self:setTitleText(txt) end
	if fontSize then self:setTitleFontSize(fontSize) end
	--if selectedPng then end
	--if isDisableShadow then end
	self.clickEventFunc = nil
	self.touchEventFunc = nil

end

function MMButton:registerClickEventListener(func,target)
    if func == nil then return end
	self.clickEventFunc = func
	self.target = target	
	local function touchEvent(sender, eventType)
		-- print("position0   ss" .. eventType)			
		--播放音效
		--if eventType == ccui.TouchEventType.began then			
		--elseif eventType == ccui.TouchEventType.moved then		
		if eventType == ccui.TouchEventType.ended then
			if self.clickEventFunc then
				self.clickEventFunc(self.target,sender)
				return true
			end
		--elseif eventType == ccui.TouchEventType.canceled then		
		end
	end
	self:addTouchEventListener(touchEvent)
end


function MMButton:registerTouchEventListener(func,target)
    if func == nil then return end
	self.touchEventFunc = func
	self.target = target
	local function touchEvent(sender, eventType)		
		--播放音效
		--if eventType == ccui.TouchEventType.began then			
		--elseif eventType == ccui.TouchEventType.moved then		
		--if eventType == ccui.TouchEventType.ended then
			if self.touchEventFunc then
				self.touchEventFunc(self.target,sender)
				return true
			end
		--elseif eventType == ccui.TouchEventType.canceled then		
		--end
	end
	self:addTouchEventListener(touchEvent)
end

--
function MMButton:showRedPoint(png,x,y)
	if self.redPoint == nil then
		self.redPoint = nil
	end
	self.redPoint:setVisible(true)
end

function MMButton:hideRedPoint()
	if self.redPoint then
		self.redPoint:setVisible(false)
	end
end

return MMButton