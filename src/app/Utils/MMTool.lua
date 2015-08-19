
--[[
MMTool 
工具类 

--]]

local MMTool = class("MMTool")


function MMTool:ctor()

end

function MMTool:stringSplit(s, delim)
    local start = 1;
    local t = {};
    while true do
        local pos = string.find (s, delim, start, true)
        if not pos then      break    end
        table.insert (t, string.sub (s, start, pos - 1))
        start = pos + string.len (delim)
    end
    table.insert (t, string.sub (s, start))
    return t; 

end

---支持中文字符串的获取长度
-- @param str
-- @return

function MMTools:strlen(str)
    if not str then
        return 0;
    end
    return string.len(string.gsub(str,"[\128-\255][\128-\255][\128-\255]"," "))
end



return MMTool