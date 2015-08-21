--[[
	富文本框
	MMRichText
	1、多样化的文本显示
	2. 显示图片和一些特殊元素
	3. 支持图片，文字的超链接功能
	4. 换行
	5. 支持设置控件爱的最大显示行数
	6. 支持数据的分类显示
	
	注释：待优化
	
--]]



local MMRichText = class("MMRichText",function ()
	return ccui.RichText:create()
end)


function MMRichText:ctor(areaSize)
	self:ignoreContentAdaptWithSize(false)
	self:setContentSize(areaSize)
	self.totalElement = 0
end


--[[
	设置元素key,config
	tag: number 标号
	color: color3d_tabel   cc.c3b(255,0,255)
	opacity: number	
	text: string
	fontName: string
	fontSize: fontSize
	
	filePath: string
	
	customNode: cc.Node
--]]
function MMRichText:addText(config)
	if config == nil then return end
	
	self.totalElement = self.totalElement + 1
	local tag = config.tag or self.totalElement
	local color = config.color or cc.c3b(255,255,255)
	local opacity = config.opacity or 255
	local text = config.text or " "
	local fontName = config.fontName or "Helvetica"
	local fontSize = config.fontSize or 22
	
	local ele = ccui.RichElementText:create(tag,color,opacity,text,fontName,fontSize)
	self:pushBackElement(ele)
	return ele
end

function MMRichText:addImage(config)
	if config == nil or config.filePath == nil then return end
	
	self.totalElement = self.totalElement + 1
	local tag = config.tag or self.totalElement
	local color = config.color or cc.c3b(255,255,255)
	local opacity = config.opacity or 255
	local filePath = config.filePath
	
	local ele = ccui.RichElementImage:create(tag,color,opacity,filePath)
	self:pushBackElement(ele)
	return ele
end

function MMRichText:addCustomNode(config)
	if config == nil or config.customNode == nil then return end
	
	self.totalElement = self.totalElement + 1
	local tag = config.tag or self.totalElement
	local color = config.color or cc.c3b(255,255,255)
	local opacity = config.opacity or 255
	local customNode = config.customNode
	
	local ele = ccui.RichElementCustomNode:create(tag,color,opacity,customNode)
	self:pushBackElement(ele)
	return ele
end


return MMRichText



