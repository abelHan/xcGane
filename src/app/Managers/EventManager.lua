--[[
	采用观察者模式 管理消息传递
	EventManager
	自定义
--]]

local EventManager = class("EventManager")

function EventManager:ctor()
	self._observerList = {}
	self._eventPair = {}
end


function EventManager:dispatchEvent(event,...)
	if event == nil then return end
	local args = {...}
	self._doDispatchEvent(event,args)
end

function EventManager:_doDispatchEvent(event, args)
	local eventObs = self._observerList[event]
	if eventObs == nil then return false end
	
	for key,value in pairs(eventObs) do
		if value ~= nil and type(value) == "table" then
			if value.obj ~= nil and value.callBack ~= nil then
				value.callBack(value.obj,unpack(args))
			elseif value.callBack ~= nil then
				value.callBack(unpack(args))
			end		
		end	
	end

end

function EventManager:removeListenerWithTarget(target)
	if target == nil then return end
	
	local eventAry = self._eventPair[target]
	if eventAry == nil then return end
	
	for key,value in pairs(eventAry) do
		if value ~= nil then
			self:removeListenerWithEvent(value, target)
		end
	end
	
	self._eventPair[target] = nil

	
end


function EventManager:removeListenerWithEvent(event,target)
	if event ==nil or target == nil then  return end
	
	local eventObs = self._observerList[event]
	if eventObs == nil then  return end
	
	for key,value in ipairs(eventObs) do
		if type(value) == "table" and value.obj == target then
			table.remove(self._observerList[event], key)
			return true
		end
	end
	
	return false
end

function EventManager:addEventListener(event,func,target)
	if event == nil or func == nil then return false end
	
	self:_addListener(event,func,target)
end

function EventManager:_addListener(event,func,target)

	local obj = self._observerList[event]
	local pos = 1
	if obj == nil or type(obj) ~= "table" then
		self._observerList[event] = {}
		pos = 1
	else
		pos = table.getn(obj) + 1
	end
	
	table.insert(self._observerList[event],pos,{obj = target, callBack =func})
	
	if target ~= nil then
		local pos = 1
		if self._eventPair[target] == nil or 
			type(self._eventPair[target]) ~= "table" then
			self._eventPair[target] = {}
		else
			pos = table.getn(self._eventPair[target]) + 1
		end	
		
		table.insert(self._eventPair[target],pos,event)
	end
end

--移除所有的监听
function EventManager:removeAll()
	if self._eventPair == nil then return end
	
	for key,value in  ipairs(self._eventPair) do
		self:removeListenerWithTarget(key)
	end
	
	self._eventPair = {}

end





return EventManager
