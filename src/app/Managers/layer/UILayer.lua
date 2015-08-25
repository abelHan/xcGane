--[[
	所有弹出UI的显示
	UILayer

--]]



local UILayer = class("UILayer",function()
	return cc.Layer.new()
end)

UILayer.gameResPanel = nil    --用户资源信息栏，得分，体力，金币等

function UILayer:ctor()


end

function UILayer:addUI(ui)
	self:addChild(ui)
	
	if ui.showScale == true then
		ui:setScale(0)
		ui:setAnchorPoint(cc.p(0.5,0.5))
		transition.scaleTo(ui,{scale = 1, time = 0.3,easing = "backout",delay=0.1})
	end

end



return UILayer