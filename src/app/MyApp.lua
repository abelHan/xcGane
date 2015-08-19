
require "app.debug"
require "app.GameGlobal"


local MyApp = class("MyApp")


function MyApp:onCreate()
    math.randomseed(os.time())
end


function MyApp:run()
	
	
end


return MyApp
