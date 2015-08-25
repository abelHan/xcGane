



local MyApp = class("MyApp")


function MyApp:onCreate()
    math.randomseed(os.time())
end


function MyApp.run()
	-- local LoginScene = require(g_require_scene .. "LoginScene")
	-- local scene = LoginScene:create()
	
	-- if cc.Director:getInstance():getRunningScene() then
		-- cc.Director:getInstance():replaceScene(scene)
	-- else
		-- cc.Director:getInstance():runWithScene(scene)
	-- end
	
	g_gameCtrl:openScene("LoginScene")
	
end

return MyApp
