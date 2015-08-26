--[[
	MMBaseUI
	--仿照《有杀气童话-子UI》
--]]

local MMBaseUI = class("MMBaseUI", function()
	return cc.Layer:create()
end)


MMBaseUI.showScale  = nil  --出场时是否有动画


--titleData 含义
-- isShowBackBtn   --是否显示返回按钮
-- title           --标题
-- resAry          --资源的种类
-- isShowNotify	   --是否显示通知按钮，入口

function MMBaseUI:ctor(titleData,data,showScale)
	self.data = data
	self.titleData = titleData
	self.showScale = showScale or true
	
end

function MMBaseUI:onEnter()
	if super then 
		print("MMBaseUI:onEnter!")	
		super.onEnter(self)
	end
end


function MMBaseUI:onExit()
	if super then 
		print("MMBaseUI:onExit!")
		super.onExit(self) 
	end	
	--移除消息监听
	if g_eventManager then
		g_eventManager:removeAll()
	end
end

function MMBaseUI:hide()
	self:setVisible(false)
end

function MMBaseUI:show()
	self:setVisible(true)
	
	--显示上面的资源，title，返回等
	if self.titleData and g_layerManager then
		g_layerManager.UILayer:showRes(self.titleData)
	end
end

function MMBaseUI:close()
    if self.showScale == true then
        transition.scaleTo(self, {scale = 0, time = 0.3,easing = "backin",onComplete = function (  )
        	if self:getParent() ~= nil then
             	self:removeFromParent()
         	end
        end})
    else
    	if self:getParent() ~= nil then
        	self:removeFromParent()
        end
    end
end







return MMBaseUI