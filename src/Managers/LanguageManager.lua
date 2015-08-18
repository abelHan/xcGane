--[[
	多语言管理
	

--]]


local LanguageManager = class("LanguageManager")

--语言包
local languageData = requireM("language.Language_"..CONFIG_LANAGUE)

function LanguageManager:ctor()

end

function LanguageManager:getTxt(id, list)
    local replaceNum=list and #list or 0
    local txt = languageData[id..""] or ""
    if replaceNum==0 or txt=="" then return  txt end
    local strList=g_tools:string_split(txt,"$")
    local strNum=#strList
    txt=""
    local curIndex=1
    for inx=1,strNum do
        txt=txt..strList[inx]
        if inx<strNum then
            txt=txt..(curIndex<=replaceNum and list[curIndex] or "")
        end
        curIndex=curIndex+1
    end
    return txt
end


return LanguageManager