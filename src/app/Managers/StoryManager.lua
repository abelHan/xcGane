--[[
	剧情管理
	StoryManager
--]]


local StoryManager = class("StoryManager")

function StoryManager:ctor()


end

-- 获得剧情显示panel
function StoryManager:show(storyData,callFunc)
	if self.curStoryPanel then
	
		self.curStoryPanel = nil
	end
	self.curStoryData = storyData
	self.callFunc = callFunc
	self.curStoryPanel = self:createStoryPanel()
	self:playStoryBegin()
	return self.curStoryPanel
end

function StoryManager:createStoryPanel()
	

end

-- 进场动画
function StoryManager:playStoryBegin()

end

-- 出场动画
function StoryManager:playStoryEnd()
	
end

-- 进度
function StoryManager:onAddingText()


end


-- 剧情播放结束
function StoryManager:completeAdding()
	
end

-- 清除剧情
function StoryManager:clearCurStory()
	self.curStoryPanel:removeFromParentAndCleanup()
	if self.callFunc then
		self.callFunc()
	end
	
	self.curStoryPanel = nil
	self.callFunc = nil
	self.curStoryData = nil

end

return StoryManager

