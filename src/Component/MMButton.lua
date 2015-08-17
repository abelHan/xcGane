--[[
--∞¥≈•


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
	self:setPosition(ccp(toint(x),toint(y)))
	if txt then self:setTitleText(txt) end
	if fontSize then self:setTitleFontSize(fontSize) end
	--if selectedPng then end
	--if isDisableShadow then end
	self.clickEventFunc = nil
	self.touchEventFunc = nil
	local function touchEvent(sender, eventType)
	
		if self.touchEventFunc then
			self.touchEventFunc(sender, eventType)
			return true
		end
			
		--≤•∑≈“Ù–ß
		if eventType == ccui.TouchEventType.began then
			
		elseif eventType == ccui.TouchEventType.moved then
		
		elseif eventType == ccui.TouchEventType.ended then
			if self.clickEventFunc then
				self.clickEventFunc(sender)
				return true
			end
		elseif eventType == ccui.TouchEventType.canceled then
		
	end


	self:addTouchEventListener(touchEvent)
end

function MMButton:registerClickEventListener(func)
	self.clickEventFunc = func
end


function MMButton:registerTouchEventListener(func)
	self.touchEventFunc = func
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