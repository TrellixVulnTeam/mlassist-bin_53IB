

common=require("common")
::begin::
	common.toTeleRoom("圣拉鲁卡村")	
	移动(7, 3,"村长的家")
	移动(2, 9,"圣拉鲁卡村")
	移动(32, 70,"装备品店")
	移动(14, 4,"1楼小房间")
	移动(9, 3,"地下工房")
	移动(18, 31)
	转向坐标(17, 31)
	等待服务器返回()
	对话选择(0,2)
	等待服务器返回()
	对话选择(0,0)	
	等待(2000)
