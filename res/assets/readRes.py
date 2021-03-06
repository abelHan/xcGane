
import re
import os
import time
import json

lua_file_name = "ResManager.lua"
lua_file_head = "local ResManager =nil \n ResManager = {"
lua_file_end = "}\n return ResManager"
lua_root = "g_load_assets .. "

#获取当前工作空间的目录
def getcwd():
    return os.getcwd()

#获取指定文件夹下的所有文件及文件夹
def listall(dir_path):
    if os.path.exists(dir_path):
        return os.listdir(dir_path)
    else:
        print(dir_path + "路径不存在")

#判断是否是文件
def isfile(file_path):
    if os.path.exists(file_path):
        return os.path.isfile(file_path)
    else:
        print("")
    

#判断是否是路径
def isdir(dir_path):
    if os.path.exists(dir_path):
        return os.path.isdir(dir_path)
    else:
        print("")
        
#获取当前路径下的所有路径名
def listdir(dir_path):
    templist = listall(dir_path)
    resultlist = []
    for value in templist:
        if isdir(dir_path + "\\" + value):
            resultlist.append(value)

    return resultlist
    

#获取当前路径下的说有文件名
def listfile(dir_path):
    templist = listall(dir_path)
    resultlist = []
    for value in templist:
        if isfile(dir_path + "\\" + value):
            resultlist.append(value)

    return resultlist   
#将绝对路径转换为lua可以用的路径
def toluapath(path):
    cwd = os.getcwd()

    tempStr = path[(len(cwd + "\\")):]

    
    return lua_root + "\"" + tempStr.replace("\\","/")+ "\""
    
if __name__ == '__main__':
    print('当前的工作空间是：{0}'.format(getcwd()))
    print('#' * 40)
    print('#' * 40)    
        

    rootDir = [getcwd()]
    filePath = {}
    for index in range(4):
        #print("搜寻目录：",rootDir)
        newDir = {}
        for value in rootDir:
            print("搜寻目录：",value)
            print("文件：",listfile(value))

            #记录文件
            tempfile = listfile(value)
            if len(tempfile) != 0:
                filePath[value] = tempfile
            #记录路径
            templist = listdir(value)

            if len(templist) != 0:
                newDir[value] = templist
            
        del rootDir[:]
        for key,value in newDir.items():
            if value:
                for v in value:
                    rootDir.append(key + "\\" + v)
        if len(rootDir) <= 0:
            break
    print('#' * 40)
    print('#' * 40)



    #记录结果
    curPath = getcwd()
    fp = open(curPath + "\\" + lua_file_name,'w+')
    fp.write(lua_file_head)
    
    for key,value in filePath.items():
        if value:
            for v in value:
                fullPath =  key + "\\" + v
                name = os.path.splitext(v)
                #content = json.dumps({"name":name[0],"fullPath":fullPath})
                #fp.write(content + "\n")
                fp.write("\t" + name[0] + " = " +  toluapath(fullPath) + ",\n")

    fp.write(lua_file_end)
    fp.flush()
    fp.close()






    
