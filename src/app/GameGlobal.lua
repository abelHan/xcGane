
--[[
全局变量
游戏开始就存在
--]]

-- 路径

g_load_assets = "res/assets/"
g_load_ui = g_load_assets .. "ui/"
g_load_data = g_load_assets .. "data/"

g_require_app = "src/app/"
g_require_view = g_require_app .. "view/"
g_require_scene = g_require_view .. "scene/"
g_require_ui = g_require_view .. "ui/"

g_require_model = g_require_app .. "model/"
g_require_ctrl = g_require_app .. "controller/"
g_require_util = g_require_app .. "utils/"
g_require_manager = g_require_app .. "managers/"
g_require_com = g_require_app .. "Component/"

g_gender_male  = 1  --男性
g_gender_female = 2 --女性

g_race =  1  --职业
g_class = {}
--UI
g_class.MMNode = requireM(g_require_com .. "MMNode")
g_class.MMBaseUI = requireM(g_require_com .. "MMBaseUI")
g_class.MMScene = requireM(g_require_com .. "MMScene")
g_class.MMLayer = requireM(g_require_com .. "MMLayer")


--manager
-- g_timeManager = requireM()
g_dataManager = requireM(g_require_manager .. "DataManager").new()
g_eventManager = requireM(g_require_manager .. "EventManager").new()
-- g_resourceManager = requireM()
-- g_audioManager = requireM()
-- g_newGuideManager = requireM()
g_layerManager = requireM(g_require_manager .. "TopLevelManager").new()
-- g_renderManager = requireM()
-- g_armatureManager = requireM()
-- g_storyManager = requireM()
--tools
-- g_tools = requireM()
-- g_lan = requireM()  
g_GUIcreator =  requireM(g_require_util .. "GUICreator").new()
-- g_GUITool = requireM()
g_resManager = requireM(g_load_assets .. "ResManager")



--
g_gameCtrl = requireM(g_require_ctrl .. "GameCtrl").new()
g_rpgGame = requireM(g_require_view .. "RPGGame").new()
g_roleData = requireM(g_require_model .. "RoleData").new()

















