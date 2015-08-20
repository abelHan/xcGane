--[[
MMLabel

--]]

local MMLabel = class("MMLabel",function(config)
		return cc.Label:create()
	end)

function MMLabel:ctor(txt, fontFilePath, fontSize, areaSize)
	self:setString(txt or nil)
	
	local ttfConfig = {}
	ttfConfig.fontFilePath = fontFilePath or "res/font/font_youer.ttf"
	ttfConfig.fontSize = fontSize or 22
	self:setTTFConfig(ttfConfig)
	
	if areaSize then
		self:setDimensions(areaSize.width, areaSize.height)
	end
	
	
end


return MMLabel
	
	
