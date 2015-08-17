
--[[
	UI��������
	GUICreator
	
	UI ��config���ֶ�
	normalUrl   --δ����ʱ��ť��ʾͼƬ��·��
	selectedUrl       --����ʱ��ť��ʾͼƬ��·��
	disabledUrl       --���ɵ��ʱ��ť��ʾͼƬ��·��	
	pngUrl                --Ĭ��ͼƬ��·��
	plistUlr            --plist·��

	name            -- �ؼ��ı��
	text                 -- ��������
	fontSize        --����Ĵ�С
	fontFileName	--�����ļ�
	vAlignment		--����ˮƽ���뷽ʽ

	rect                 --��ʾ����
	anchor          --ê������
	isStroke        --�����Ƿ�����
	strokeColor  --��ߵ���ɫ
	textColor       --������ɫ
	align              --���뷽ʽ
	insectRect     --�ڱ߿�,�ֱ������ܵļ�࣬����x,y,width,height
	preferrSize     --���

	percent          --�ٷֱ�
	maxNum        --������
	callBack         --�ص�����

	--node ����
	ZOrder			--���ֵ
	
	scaleX			--x�����ű�
	scaleY			--y�����ű�
	scale			--�������ű�
	
	pos                --�ؼ���λ����Ϣccp
	x                    --�ؼ���λ����Ϣx
	y                    --�ؼ���λ����Ϣy
	
	areaSize        --�ؼ���С size
	width            --��
	height            --��
	
	rotation 		--rotation (angle) od the node in degrees
	
	parent            --����ָ��
	
	tag 			--���
	
	
--]]
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
	if config.parent and node:getParent() == nil then parent:addChild(node) end
	
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
	button = ccui.Button:create()
	button:setTouchEnabled(true)
	button:loadTextures(config.normalUrl or "",config.selectedUrl or "",config.disabledUrl or "")
	button:setTitleText(config.txt or "")
	button:setTitleColor(config.textColor or cc.c3b(0,255,0))
	button:setTitleFontSize(config.fontSize or 22)

	self:dealWithNoramlParameter(button, config)
	
	return button
	
 end
function   GUICreator:createLabel(config) 
	local label = nil
	label = cc.Label:createWithSystemFont(config.txt or "",config.fontFileName or "",config.fontSize or 22)
	
	--cc.VERTICAL_TEXT_ALIGNMENT_TOP,  -- ���붥��  
	--cc.VERTICAL_TEXT_ALIGNMENT_CENTER, -- ���ж���  
	--cc.VERTICAL_TEXT_ALIGNMENT_BOTTOM, -- �ײ�����
  
	label:setVerticalAlignment(config.vAlignment or cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	self:dealWithNoramlParameter(label)

	return label
 end
 
 
 return GUICreator