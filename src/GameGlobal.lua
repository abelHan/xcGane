
--[[
ȫ�ֱ���
��Ϸ��ʼ�ʹ���
--]]

g_gender_male  = 1  --����
g_gender_female = 2 --Ů��

g_race =  1  --ְҵ
g_class = {}
--UI
g_class.MMNode = requireM()
g_class.MMButton = requireM()
g_class.MMBaseUI = requireM()
g_class.MMAlert    = requireM()
--manager
g_timeManager = requireM()
g_dataManager = requireM()
g_resourceManager = requireM()
g_audioManager = requireM()
g_newGuideManager = requireM()
g_layerManager = requireM()
g_renderManager = requireM()
g_armatureManager = requireM()
g_storyManager = requireM()
--tools
g_tools = requireM()
g_lan = requireM()  
g_GUIcreator =  requireM()
g_GUITool = requireM()

g_functionCtrl = requireM().new()