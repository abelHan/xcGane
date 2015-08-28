#-*-coding:utf-8-*- 

#Python 3.4
#xlrd-0.9.4
'''
例子
http://www.cnblogs.com/lhj588/archive/2012/01/06/2314181.html

'''
#指定第三方库的路径
import sys
sys.path.append('C:\\Python34\\Lib\\site-packages')

import xlrd
import os


lua_file_begin = "local {0} = nil \n {0} = "
lua_item_int = "\t\t{0} = {1},\n"
lua_item_str = "\t\t{0} = \"{1}\",\n"
lua_file_end = "\n return {0}"

#获取当前工作空间的路径
def getcwd():
    return os.getcwd()     

#获取一行的lua数据key = value
def get_row_data(key,value):
        if len(value) < 0:
                return
        result = {}
        for i in range(len(key)):
                tempData = value[i]
                if isinstance(tempData,float):
                        tempData = int(tempData)
                result[key[i]] = tempData

        return result
                
        

#将一个sheet数据转化为字典，
def get_sheet_data(sheet):
        #检查sheet是否合法
        result = []
        dataKye = sheet.row_values(0)
        for index in range(sheet.nrows):
                if index == 0:
                        continue
                result.append(get_row_data(dataKye,sheet.row_values(index)))


        return result
        

#打开Excel
def open_excel(fileName = "xcGameData.xls"):
        #try:
                data = xlrd.open_workbook(fileName)
                return data
        #except Exception,e:
         #       print str(e)
#将一个字典转换为一张lua
def dic2lua(name,value):
        cur_path = getcwd()
        fp = open(cur_path + "\\" + name + ".lua", "w+")
        fp.write(lua_file_begin.format(name))
        fp.write( "{")
        for v in value:
                fp.write( "{")               
                for j,l in v.items():
                        if isinstance(l,str):
                                fp.write(lua_item_str.format(j,l))
                        else:
                                fp.write(lua_item_int.format(j,l))
                fp.write("},\n\t\t")

        fp.write("}")
        fp.write(lua_file_end.format(name))
        fp.flush()
        fp.close()

#主函数
def main():
        print("hello")
        tables = open_excel()
        data_list = {}
        for v in tables.sheets():
                data_list[v.name] = get_sheet_data(v)

        #记录结果
        for k,v in data_list.items():
               dic2lua(k,v) 

                

if __name__=="__main__":
        main()




