
--[[
	UI创建函数
	GUICreator
	
	UI 中config的字段
	normalUrl   --未按下时按钮显示图片的路径
	selectedUrl       --按下时按钮显示图片的路径
	disabledUrl       --不可点击时按钮显示图片的路径	
	pngUrl                --默认图片的路径
	plistUlr            --plist路径

	name            -- 控件的标号
	text                 -- 文字内容
	fontSize        --字体的大小
	fontFileName	--字体文件
	vAlignment		--字体水平对齐方式

	rect                 --显示区域
	anchor          --锚点坐标
	isStroke        --字体是否打开描边
	strokeColor  --描边的颜色
	textColor       --字体颜色
	align              --对齐方式
	insectRect     --内边框,分别是四周的间距，不是x,y,width,height
	preferrSize     --宽高

	percent          --百分比
	maxNum        --最大个数
	callBack         --回调函数
	clickEvent		--点击事件回调函数
	touchEvent		--触摸事件回调函数

	--node 属性
	ZOrder			--深度值
	
	scaleX			--x轴缩放比
	scaleY			--y轴缩放比
	scale			--整体缩放比
	
	pos                --控件的位置信息ccp
	x                    --控件的位置信息x
	y                    --控件的位置信息y
	
	areaSize        --控件大小 size
	width            --宽
	height            --高
	
	rotation 		--rotation (angle) od the node in degrees
	
	parent            --父类指针
	
	tag 			--标号
	
	
--]]

local MMButton = requireM(g_require_com .. "MMButton")
local MMCheck  = requireM(g_require_com .. "MMCheck")
local MMLabel  = requireM(g_require_com .. "MMLabel")
local MMScrollView = requireM(g_require_com .. "MMScrollView")
local MMTabGroup   = requireM(g_require_com .. "MMTabGroup")
local MMTextField  = requireM(g_require_com .. "MMTextField")


local GUICreator = class("GUICreator")

function GUICreator:ctor()

end

function GUICreator:dealWithNoramlParameter(node,config)
	if node == nil or config == nil then  return false end
	
	--ZOrder
	if config.ZOrder then node:setZOrder(config.ZOrder) end
	
	--scale
	local tempScaleX = config.scale or config.scaleX or 1
	local tempScaleY = config.scale or config.scaleY or 1
	node:setScale(tempScaleX, tempScaleY)
	
	-- position
	local tempPos = config.pos or (ccp(config.x or 0, config.y or 0))
	node:setPosition(tempPos)

	-- anchor
	if config.anchor then node:setAnchorPoint(config.anchor) end
	
	-- contentSize
	if config.areaSize then node:setContentSize(config.areaSize) end
	
	-- rotation
	if config.rotation then node:setRotation(config.rotation) end
	
	-- parent
	if config.parent and node:getParent() == nil then config.parent:addChild(node) end
	
	--tag
	if config.tag then node:setTag(config.tag) end
	
	--name
	if config.name then node:setName(config.name) end
	
end

function   GUICreator:createImg(config)

	-- url, pos, anchor
	local imageView = ccui.ImageView:create()
	if config.pngUrl then imageView:loadTexture(config.pngUrl) end
	
	self:dealWithNoramlParameter(imageView,config)
	return imageView
	
 end
function   GUICreator:createSprite(config) 
	local sprite = nil
	sprite = cc.Sprite:create()
	if config.pngUrl then sprite:setTexture(config.pngUrl) end
	self:dealWithNoramlParameter(sprite,config)
	
	
	return sprite
 end
function   GUICreator:createButton(config) 
	--normalUrl, selectedUrl, disabledUrl, pos, btnName, txt, txtSize
	
	local button = nil
	-- button = ccui.Button:create()
	-- function MMButton:ctor(png,x,y,txt,fontSize,selectedPng,isDisableShadow)
	button = MMButton.new()
	button:setTouchEnabled(true)
	button:loadTextures(config.normalUrl or "",config.selectedUrl or "",config.disabledUrl or "")
	button:setTitleText(config.txt or "")
	button:setTitleColor(config.textColor or cc.c3b(0,255,0))
	button:setTitleFontSize(config.fontSize or 22)
	button:registerClickEventListener(config.clickEvent,config.target)
	button:registerTouchEventListener(config.touchEvent,config.target)

	self:dealWithNoramlParameter(button, config)
	
	return button
	
 end
function   GUICreator:createLabel(config) 
	local label = nil
	-- label = cc.Label:createWithTTF(config.txt or "",config.fontFileName or "res/font/font_youer.ttf",config.fontSize or 22)
	-- label = cc.Label:createWithSystemFont(config.txt or "",config.fontFileName or "Marker Felt",config.fontSize or 22)
	
	--cc.VERTICAL_TEXT_ALIGNMENT_TOP,  -- 对齐顶部  
	--cc.VERTICAL_TEXT_ALIGNMENT_CENTER, -- 居中对齐  
	--cc.VERTICAL_TEXT_ALIGNMENT_BOTTOM, -- 底部对齐
	
	label = MMLabel.new(config.txt or "",config.fontFileName or "res/font/font_youer.ttf",
		config.fontSize or 22,config.areaSize)
	label:setVerticalAlignment(config.vAlignment or cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	self:dealWithNoramlParameter(label,config)

	return label
 end
 
 function GUICreator:createMMCheck(config)
	local check = nil
	check = MMCheck.new(config.pngs,config.txt,config.fontSize)
	check:setSelectedEvent(config.callBack,config.target)
	self:dealWithNoramlParameter(check,config)
	return check
 end
 
 
 
 
 return GUICreator
 
 
 