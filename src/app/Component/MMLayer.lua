--[[

	MMLayer

--]]


local MMLayer = class("MMLayer",function()
	return cc.Layer:create()
end)

function MMLayer:ctor()
	

end

function MMLayer:onEnter()
	if super then 
		print("MMLayer:onEnter!")	
		super.onEnter(self)
	end
end


function MMLayer:onExit()
	if super then 
		print("MMLayer:onExit!")
		super.onExit(self) 
	end	
	--移除消息监听
	if g_eventManager then
		g_eventManager:removeAll()
	end
end



return MMLayer

