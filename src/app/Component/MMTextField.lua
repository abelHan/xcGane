--[[

MMTextField
输入框
--]]


local MMTextField = class("MMTextField", function()
	return cc.Node:create()
end)


function MMTextField:ctor(pngUrl,areaSize,fontName,txt,fontSize)


	local imageView = ccui.ImageView:create()
	imageView:setScale9Enabled(true)
	imageView:loadTexture(pngUrl or g_load_ui .. "defaul/text_field_bg.png")
	imageView:setContentSize(areaSize)
	imageView:setPosition(cc.p(0,0))
	imageView:setAnchorPoint(cc.p(0,0))
	self:addChild(imageView)
	self.textBg = imageView
	
	
	
	self.textField = ccui.TextField:create()
	self.textField:setMaxLengthEnabled(true)
	self.textField:setMaxLength(100)
	self.textField:setTouchEnabled(true)
	self.textField:setFontName(fontName)
	self.textField:setFontSize(fontSize)
	self.textField:setPlaceHolder(txt)
	
	local function textFieldEvent(sender, eventType)
        if eventType == ccui.TextFiledEventType.attach_with_ime then
            local textField = sender
            local screenSize = cc.Director:getInstance():getWinSize()
            -- textField:runAction(cc.MoveTo:create(0.225,cc.p(screenSize.width / 2.0, screenSize.height / 2.0 + textField:getContentSize().height / 2.0)))
            local info = string.format("attach with IME max length %d",textField:getMaxLength())
			
            print(info)
        elseif eventType == ccui.TextFiledEventType.detach_with_ime then
            local textField = sender
            local screenSize = cc.Director:getInstance():getWinSize()
            -- textField:runAction(cc.MoveTo:create(0.175, cc.p(screenSize.width / 2.0, screenSize.height / 2.0)))
            local info = string.format("detach with IME max length %d",textField:getMaxLength())
			
            print(info)
        elseif eventType == ccui.TextFiledEventType.insert_text then
            local textField = sender
            local info = string.format("insert words max length %d",textField:getMaxLength())
			
            print(info)
        elseif eventType == ccui.TextFiledEventType.delete_backward then
            local textField = sender
            local info = string.format("delete word max length %d",textField:getMaxLength())
			
            print(info)
        end
    end
	self.textField:setPosition(cc.p(10,areaSize.height/2))
	self.textField:setAnchorPoint(cc.p(0,0.5))	
	self.textField:addEventListener(textFieldEvent)
	self:addChild(self.textField)
	

end


return MMTextField