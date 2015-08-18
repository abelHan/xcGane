--[[
	任务数据类

--]]


local TaskData = class("TaskData")

TaskData.id = nil				--任务的编号
TaskData.cur_progress = nil		--任务的进度
TaskData.done = nil				--是否完成：0否， 1完成
TaskData.info = nil				--任务的信息(表中的数据)

function TaskData:ctor()
	
end

--更新
function TaskData:updateData(data)
	self.id = data.id
	self.cur_progress = data.cur_progress
	self.done = data.done
	self.info = data.info
	self:checkShow()
end

-- 检查任务是否需要显示
function TaskData:checkShow()

end


return TaskData