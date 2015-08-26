--[[
	所有弹出UI的显示
	UILayer

--]]



local UILayer = class("UILayer",g_class.MMLayer)

UILayer.gameResPanel = nil    --用户资源信息栏，得分，体力，金币等

function UILayer:ctor()
	self.super.ctor(self)

end

function UILayer:addUI(ui)
	self:addChild(ui)
	
	if ui.showScale == true then
		ui:setScale(0)
		ui:setAnchorPoint(cc.p(0.5,0.5))
		transition.scaleTo(ui,{scale = 1, time = 0.3,easing = "backout",delay=0.1})
	end

end

-- titleData 含义
-- isShowBackBtn   --是否显示返回按钮
-- title           --标题
-- resAry          --资源的种类
-- isShowNotify	   --是否显示通知按钮，入口
function UILayer:showRes(resData)
	print("see the title >>>")
	if self.gameResPanel == nil then
	
	end
	self.gameResPanel:setVisible(true)
	self.gameResPanel:update(resData)

end

function UILayer:hideRes()
	print("hide the title >>>")
	if self.gameResPanel then
		self.gameResPanel:setVisible(false)
	end
end


return UILayer