



local MyApp = class("MyApp")


function MyApp:onCreate()
    math.randomseed(os.time())
end


function MyApp:run()
	local LoginScene = require(g_require_view .. "LoginScene")
	local scene = LoginScene.new()
	
	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(scene)
	else
		cc.Director:getInstance():runWithScene(scene)
	end
end

return MyApp
