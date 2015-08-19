--[[

MMTextField
 ‰»ÎøÚ
--]]


local MMTextField = class("MMTextField", function()
	return ccui.TextField:create()
end)


function MMTextField:ctor()

	self:setMaxLengthEnabled(true)
	self:setMaxLength(3)
	self:setTouchEnabled(true)
	self:setFontName(fontName)
	self:setFontSize(fontSize)
	self:setPlaceHolder(txt)
	self:setPosition(ccp())
	
	local function textFieldEvent(sender, eventType)
        if eventType == ccui.TextFiledEventType.attach_with_ime then
            local textField = sender
            local screenSize = cc.Director:getInstance():getWinSize()
            textField:runAction(cc.MoveTo:create(0.225,cc.p(screenSize.width / 2.0, screenSize.height / 2.0 + textField:getContentSize().height / 2.0)))
            local info = string.format("attach with IME max length %d",textField:getMaxLength())
			
            self._displayValueLabel:setString(info)
        elseif eventType == ccui.TextFiledEventType.detach_with_ime then
            local textField = sender
            local screenSize = cc.Director:getInstance():getWinSize()
            textField:runAction(cc.MoveTo:create(0.175, cc.p(screenSize.width / 2.0, screenSize.height / 2.0)))
            local info = string.format("detach with IME max length %d",textField:getMaxLength())
			
            self._displayValueLabel:setString(info)
        elseif eventType == ccui.TextFiledEventType.insert_text then
            local textField = sender
            local info = string.format("insert words max length %d",textField:getMaxLength())
			
            self._displayValueLabel:setString(info)
        elseif eventType == ccui.TextFiledEventType.delete_backward then
            local textField = sender
            local info = string.format("delete word max length %d",textField:getMaxLength())
			
            self._displayValueLabel:setString(info)
        end
    end
	
	self:addEventListener(textFieldEvent)
	
end


return MMTextField