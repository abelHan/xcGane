--[[

	MMNode

--]]


local MMNode = class("MMNode",function ()
	return cc.Node:create()
end)


function MMNode:ctor()
end

function MMNode:onEnter()
	if super then 
		print("MMNode:onEnter!")	
		super.onEnter(self)
	end
end

function MMNode:onExit()
	if super then 
		print("MMNode:onExit!")
		super.onExit(self) 
	end
	
	--移除消息监听
	if g_eventManager then
		g_eventManager:removeAll()
	end
	
	
end



return MMNode