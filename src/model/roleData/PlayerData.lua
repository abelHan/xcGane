--[[
	玩家的用户数据
--]]

local PlayerData = class("PlayerData")

PlayerData.id = nil			--用户ID，本地保存
PlayerData.userName = nil;	--用户昵称，可以更改
PlayerData.xp = nil			--经验值
PlayerData.level = nil		--等级
PlayerData.energy = nil		--体力
PlayerData.userIcon = nil	--用户头像编号
PlayerData.gold = nil		--用户金币值
PlayerData.last_normal_level = nil	--上一次关闭游戏时简单模式的最后关卡
PlayerData.last_hard_level = nil	--上一次关闭游戏时困难模式的最后关卡
PlayerData.highest_normal_level = nil	--简单模式的最高关卡
PlayerData.highest_hard_level = nil		--困难模式的最高关卡
PlayerData.honor = nil					--成就编号

function PlayerData:ctor()

end

function PlayerData:updateData(data)
	self.id = data.id
	self.userName = data.userName
	self.xp = data.xp
	self.level = data.level
	self.energy = data.energy
	self.userIcon = data.userIcon
	self.gold = data.gold
	self.last_normal_level = data.last_normal_level
	self.last_hard_level = data.last_hard_level
	self.highest_normal_level = data.highest_normal_level
	self.highest_hard_level = data.highest_hard_level
	self.honor = data.honor
	
end

function PlayerData:getHeadUrl()
	local tempUrl = ""
	
	
	return tempUrl
end

--获取需要保存的信息
function PlayerData:getPlayerSavedInfo()
	local  info = {id = self.id,
	userName = self.userName ,
	xp = self.xp ,
	level = self.level ,
	energy = self.energy ,
	userIcon = self.userIcon ,
	gold = self.gold ,
	last_normal_level = self.last_normal_level ,
	last_hard_level = self.last_hard_level ,
	highest_normal_level = self.highest_normal_level ,
	highest_hard_level = self.highest_hard_level,
	honor = self.honor}
	
	return info
end