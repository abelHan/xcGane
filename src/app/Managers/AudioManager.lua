--[[
	音效

	AudioManager
--]]


local AudioManager = class("AudioManager")

function AudioManager:ctor()
	self._audioEngine = ccexp.AudioEngine
	self._volume = 1.0
	self.switchBGM = true
	self.switchEffect = true
	self.BGMAudio = nil
end

--获取上一次设置的数据
function AudioEngine:loadSetting()
	self._volume = 1.0
	self.switchBGM = true
	self.switchEffect = true
end

--设置音量
function AudioManager:getVolume()
	return self._volume or 1.0
end

function AudioManager:setVolume(value)
	if value and value <=1.0 and value >=0 then
		self._volume = value
		if self.BGMAudio then
			self._audioEngine:setVolume(self.BGMAudio, self._volume)
		end
	end
end

--开关音效
function AudioManager:setSwitchBGM(switch)
	if switch == true then
		self.switchBGM = true
	else
		self.switchBGM = false
		--关闭BGM
		self:playBGM()
	end
end

function AudioManager:setSwitchEffect(switch)
	if switch == true then
		self.switchEffect = true
	else
		self.switchEffect = false
	end
end

--播放BGM
function AudioManager:playBGM(resKey)
	if self.switchBGM ~= true then   return  end
	if self.BGMAudio or resKey == nil then
		self:_stopAudio(self.BGMAudio)
		self.BGMAudio = nil
	end	
	self.BGMAudio =  self._playAudio(resKey, true)
	return self.BGMAudio
end

--播放音效
function AudioManager:playEffect(resKey)
	if self.switchEffect ~= true or resKey == nil then 
		return 
	end	
	return self._playAudio(resKey)
end

function AudioManager:_playAudio(resKey,loopEnabled)
	if resKey == nil then return nil end
	
	local audioID = nil
	local resPath = g_resManager.resKey
	if resPath == nil then
		print("cannot find the res>>>>" .. resKey)
		return 0
	end
	audioID = self._audioEngine:play2d(resPath,loopEnabled or false,self._volume)
	return audioID
end

function AudioManager:_stopAudio(audioID)

	if audioID == nil then return end
	self._audioEngine:stop(audioID)
end

function AudioEngine:stopAll()
	self._audioEngine:stopAll()
end


return AudioManager