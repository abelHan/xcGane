--[[
	包裹中物品的数据
--]]



local StockData = class("StockData")

StockData.id = nil		--物品的编号
StockData.amount = nil	--物品的数量
StockData.info = nil	--物品的信息(表中读出来的信息)
StockData.gainDate = nil --物品的获取时间


function StockData:ctor()

end
--更新数据
function StockData:updateData(data)
	self.id = data.id
	self.amount = data.amount
	self.info = data.info
	self.gainDate = data.gainDate
end
--获取物品的显示数据
function StockData:getStockShowInfo()
	local tempUrl = ""
	local info = {
		url = tempUrl,
		amount = self.amount,
		desc1 = self.info.desc1,
		gainDate = self.gainDate,
		quality = self.quality}
		
	return info
end

--获取物品的保存数据
function StockData:getStockSavedInfo()
	local info = {
		id = self.id,
		amount = self.amount,
		gainDate = self.gainDate}
	
	return info
end


return StockData
