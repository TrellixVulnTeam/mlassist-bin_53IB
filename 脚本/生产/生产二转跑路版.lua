生产2转，设自己吃血瓶,开始计时，提前设置全跑，扔魔石，设置小于300血吃血瓶,提前用交易卡上，身上空8格以上
 
common=require("common")

--设置("高速延时",3) 
设置("自动战斗",1)
设置("高速战斗",1)
设置("遇敌全跑",1)

设置("自动加血",0)
设置("移动速度",110)--速度还是110吧  120容易掉哦
扔("好像很好喝的酒")
扔("好像很好吃的起司")
::StartBegin::
	x,y=取当前坐标()	
	if (x==140 and y==105 )then	-- 
		goto kaishi
	elseif (x==72 and y==123 )then	-- 西2登录点
		goto w2
	elseif (x==233 and y==78 )then	-- 东2登录点
		goto e2
	elseif (x==162 and y==130 )then	-- 南2登录点
		goto s2
	elseif (x==63 and y==79 )then	-- 西1登录点
		goto w1
	elseif (x==242 and y==100 )then	-- 东1登录点
		goto e1
	elseif (x==141 and y==148 )then	-- 南1登录点
		goto s1
	end	
	回城()	
	等待(2000)
	goto StartBegin
::w2::	-- 西2登录点
	转向(2)			-- 转向东	
	等待到指定地图("法兰城",233,78)
	
::e2::	-- 东2登录点
	转向(0)		-- 转向北	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)	
	转向(0)		-- 转向北	

::s2::	-- 南2登录点
	
	等待到指定地图("法兰城",162,130)	
	移动(153,130)
	goto Go

::w1::	-- 西1登录点
	转向(0)		-- 转向北	
	等待到指定地图("法兰城", 242, 100)	
	

::e1::	-- 东1登录点
	转向(2)		-- 转向东	
	等待到指定地图("市场三楼 - 修理专区", 46, 16)	
	转向(0)		-- 转向北	

::s1::	-- 南1登录点
	等待到指定地图("法兰城",141,148)
	移动(153,148)
::Go::	
	移动(153,100)
	等待到指定地图("里谢里雅堡")		
	移动(28,88)
	等待服务器返回()			
	对话选择(32,0)
	等待服务器返回()			
	对话选择(32,0)
	等待服务器返回()		
	对话选择(32,0)
	等待服务器返回()			
	对话选择(32,0)
	等待服务器返回()	
	对话选择(4,0)
	等待到指定地图("？")	
	移动(19, 20)
	移动一格(4,1)	
	等待到指定地图("法兰城遗迹")		
	移动(98, 138)
	等待到指定地图("盖雷布伦森林")
	移动(124, 168)
	等待到指定地图("温迪尔平原")		
	移动(264, 108)	
	等待到指定地图("艾尔莎岛")		
	移动(141, 106)		
	对话选是(1)	
	移动(140, 105)
::maixue::	
	回城()	
	等待到指定地图("艾尔莎岛")		
	移动(141, 105)		
	对话选是(0)	
	等待到指定地图("里谢里雅堡")		
	移动(34,88)        
	renew(2)		
	移动(65,54)
	等待到指定地图("法兰城")
	移动(221, 83)        
    goto yiyu

::yiyu::
	等待到指定地图("医院")	
	移动(15, 35)		
	对话(2)       -- 转向东
	等待服务器返回()			
	对话选择(0, 0)
	等待服务器返回()			
	买(0, 18)       -- 栏数   0为1
	等待服务器返回()	
	回城()
::kaishi::	
	等待(500)
	移动(140,105)		
	对话选是(1)	
	等待到指定地图("里谢里雅堡")	
	转向(2)	
	移动(41,50)	
	等待到指定地图("里谢里雅堡 1楼")
	移动(45,20)
	等待到指定地图("启程之间", 1)	
	移动(25, 27)
::jianacun::	
	移动(8, 44)		
	转向(0)
	dlg=等待服务器返回()
	if(dlg.message~=nil and (string.find(dlg.message,"此传送点的资格")~=nil or string.find(dlg.message,"很抱歉")~=nil ))then
		日志(dlg.message,1)
		执行脚本("./脚本/直通车/★开传送-加纳村.lua")
		goto jncsd
	end
	对话选择("4", "", "")	
::jncsd::
	等待到指定地图("加纳村的传送点")
	移动(5,12)	
	等待到指定地图("村长的家")
	移动(1,9)
	等待到指定地图("加纳村")	
	移动(51,34)
	等待到指定地图("酒吧")
	移动(12,5)	
    喊话("3",2,3,5)	
	等待(1000)
    喊话("2",2,3,5)	
	等待(1000)
    喊话("1",2,3,5)	
	等待(1000)
    喊话(os.date("%Y-%m-%d %H:%M:%S").."开始",2,3,5)	
::ccc::
	移动(12,5)	
	对话选是(2)	
	接任务时间=os.time() 
	移动(11, 3)
	等待(1100)
::zouhvi_1::
	移动(3,4)	
	等待到指定地图("加纳村")
	移动(47,77)	
	等待到指定地图("索奇亚")	
	移动(402,304)	
	等待到指定地图("角笛大风穴")		
	移动(18,6)
	等待到指定地图("索奇亚")	
	移动(294,324)
	等待到指定地图("奇利村")	
	移动(64,56)
	等待到指定地图("医院")
	移动(11,6)
	renew(0)			-- 转向北边恢复人宠血魔		
	移动(3,9)
	等待到指定地图("奇利村")	
	移动(59,45)
	等待到指定地图("索奇亚")	
	移动(240,265)
	等待到指定地图("索奇亚海底洞窟 地下1楼")	
	移动(7,42)
	等待(3000)		
	对话选是(0)	
	等待到指定地图("索奇亚海底洞窟 地下1楼", 7,39)		
	移动(24,13)
	等待到指定地图("索奇亚海底洞窟 地下2楼")		
	移动(49,46)
	等待到指定地图("索奇亚海底洞窟 地下1楼")		
	移动(10,5)	
	等待到指定地图("芙蕾雅")		
	移动(330,481)
	等待到指定地图("维诺亚村")	
	移动(61,53)
	等待到指定地图("医院")	
	移动(11,9)
	移动(11,5)
	renew(2)			-- 转向东边恢复人宠血魔		
	移动(2,9)
	等待到指定地图("维诺亚村")
	移动(67,47)
	等待到指定地图("芙蕾雅")		
	移动(442,349)
	等待到指定地图("维诺亚洞穴 地下3楼")	
	移动(10,59)
	等待到指定地图("小路")	
	移动(51,16)	
	等待到指定地图("维诺亚洞穴 地下1楼")	
	移动(11,13)	
	对话选是(4)			
	等待到指定地图("维诺亚洞穴 地下1楼", 13,17)	
	移动(20,14)
	等待到指定地图("芙蕾雅", 471,317)
	移动(424,253)
	等待到指定地图("法兰城")
	移动(153,100)
	等待到指定地图("里谢里雅堡")	
	等待(500)
	移动(41,83)
	goto jietou1

::yaltc::
	等待(500)
	移动(140,105)		
	对话选是(1)		
	等待到指定地图("里谢里雅堡")		
::jietou1::
	移动(34,88)        
	renew(2)	
	移动(65,54)
	等待到指定地图("法兰城", 1)	
	移动(281,88)
	等待到指定地图("芙蕾雅", 1)
	移动(672,223)
	等待到指定地图("哈巴鲁东边洞穴 地下1楼", 1)
	移动(41,8)
	等待到指定地图("哈巴鲁东边洞穴 地下2楼", 1)	
	移动(33,4)	
	移动到目标附近(33,3)
	对话选是(33,3)		
	等待到指定地图("哈巴鲁东边洞穴 地下2楼", 24,7)
	移动(16,11)
	等待到指定地图("哈巴鲁东边洞穴 地下1楼", 1)
	移动(30,4)
	等待到指定地图("芙蕾雅", 1)
	移动(596,84)
	等待到指定地图("亚留特村", 1)	
	移动(56,48)
	等待到指定地图("村长的家", 1)
	移动(17,12)
::fangd1::
	喊话("打个哈欠~~",2,3,5)
        
        
::等::
	if((os.time() - 接任务时间) > 3603)then
		goto ylt
	end	
	等待(500)
	goto 等
::ylt::
	移动(16,11)		
	对话选是(2)		
	喊话(os.date("%Y-%m-%d %H:%M:%S").."继续下一个",2,3,5)
	接任务时间=os.time() 
	移动(6,13)
	等待到指定地图("亚留特村", 1)	
	移动(66,64)
	等待到指定地图("芙蕾雅", 1)	
	移动(691,188)
	等待到指定地图("哈巴鲁东边洞穴 地下1楼", 1)	
	移动(21,39)
	等待到指定地图("哈巴鲁东边洞穴 地下2楼", 1)	
	移动(23,7)
	移动(24,7)
	对话选是(25,7)			
	等待到指定地图("哈巴鲁东边洞穴 地下2楼", 32,4)		
	移动(62,65)		
	等待到指定地图("哈巴鲁东边洞穴 地下1楼", 1)		
	移动(9,37)
	等待到指定地图("芙蕾雅", 672,223)			
	移动(470,196)
	等待到指定地图("法兰城", 1)	
	移动(233,78)
	转向(0)	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)	
	转向(0)	
	等待到指定地图("法兰城",162,130)		
	移动(153,100)
	等待到指定地图("里谢里雅堡", 1)
	
	等待(500)
	移动(41,83)
	goto jietou2
::jiec::
	等待(500)        
    等待到指定地图("艾尔莎岛",1)		
	对话选是(1)		
	等待到指定地图("里谢里雅堡",1)
::jietou2::
	移动(34,89)
	renew(1)		
	移动(40,98)
	等待到指定地图("法兰城",1)	
	移动(141,148)
	转向(0)	
	等待到指定地图("法兰城")
	移动(22,87)
	等待到指定地图("芙蕾雅",1)	
	移动(201,166)		
	对话选是(0)		
	等待到指定地图("莎莲娜海底洞窟 地下1楼")	
	移动(20,8)
	等待到指定地图("莎莲娜海底洞窟 地下2楼")	
	移动(11,9)
	等待到指定地图("莎莲娜海底洞窟 地下1楼")	
	移动(24,11)
	等待到指定地图("莎莲娜")
	移动(217,455)
	等待到指定地图("杰诺瓦镇")	
	移动(38,59)
	等待到指定地图("民家")
    移动(8,3)
::fangd2::
	喊话("打个哈欠~~",2,3,5)
        
        
::deng2::
	if((os.time() - 接任务时间) > 3603)then
		goto ccc20
	end	
	等待(500)	
	goto deng2
::ccc20::		
    对话选是(2)		
	喊话("任务完成~~",2,3,5)



