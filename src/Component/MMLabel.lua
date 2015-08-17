--[[
MMLabel

--]]

local MMLabel = class("MMLabel",function(config)
		return cc.Label:createWithSystemFont(config.txt,"Arial",config.fontSize,config.areaSize)
	end)

function MMLabel:ctor()


end


	
	
	
