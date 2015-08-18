--[[
	关卡数据

--]]


local LevelData = class("LevelData")

LevelData.id = nil				--关卡编号
LevelData.star = nil			--星数
LevelData.eType = nil			--关卡类型
LevelData.play_count = 0		--尝试的次数
LevelData.total_count = nil		--每天尝试的最大次数
LevelData.icon_id  = nil		--关卡的显示图片ID
LevelData.x = 0					--位置X
LevelData.y = 0					--位置Y

function LevelData:ctor()

end
--更新数据
function LevelData:updateData(data)
	self.id = data.id
	self.star = data.star
	self.play_count = data.play_count or 0
	self.eType = data.eType	
	self.total_count = data.total_count
	self.icon_id = data.icon_id
	self.x = data.x
	self.y = data.y
end

--获取显示信息
function LevelData:getLevelShowInfo()
	local url = ""
	local info = {
		play_count = self.play_count,
		total_count = self.total_count,
		icon_id = self.icon_id,
		x = self.x,
		y = self.y}
	return  info
end

--获取需要保存的信息
function LevelData:getLevelSavedInfo()
	local info = {id = self.id, 
		star = self.star, 
		play_count = self.play_count}
	return info
end

return LevelData
