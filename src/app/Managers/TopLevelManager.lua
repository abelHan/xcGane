--[[
	悬浮界面

--]]


local TopLevelManager = class("TopLevelManager")

TopLevelManager.rootNode = nil			--层级管理

TopLevelManager.maskLayer   = nil 		--遮罩层
TopLevelManager.alertLayer  = nil 		--弹出提示框层
TopLevelManager.loadingLayer = nil 		--loading 层级管理
TopLevelManager.storyLayer   = nil 		--剧情层
TopLevelManager.guideLayer   = nil 		--新手引导层
function TopLevelManager:ctor()
	self:init()
end

function TopLevelManager:init()
	self.rootNode = self:createRoot()
	
	self.maskLayer = nil
	self.alertLayer = nil
	self.loadingLayer = nil
	self.storyLayer = nil
	self.guideLayer = nil
	
	self.rootNode:addChild(self.maskLayer)
	self.rootNode:addChild(self.alertLayer)
	self.rootNode:addChild(self.loadingLayer)
	self.rootNode:addChild(self.storyLayer)
	self.rootNode:addChild(self.guideLayer)
	
	
end

function TopLevelManager:createRoot()
	local tempScene = cc.Scene:create()
	cc.Director:getInstance():setNotificationNode(tempScene)
	tempScene:onEnter()
	tempScene:onEnterTransitionDidFinish()

	return tempScene
end




return TopLevelManager