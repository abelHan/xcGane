
from xlrd import open_workbook

wb = open_workbook("xcGameData.xls")
values = []
for val in wb.sheets():
	print("sheet:", val.name)
	for row in range(val.nrows):
	
		for col in range(val.ncols):
			values.append(val.cell(row,col).value)
		#print(",".join(values))
		
for val in values:
        
        print("see the data>>>",val, "type>>>" , type(val))




