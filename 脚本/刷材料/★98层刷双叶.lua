全程自动跑98层刷箱子！遇到：艾德奇美拉 欧奴奇美拉 艾克尼奇美拉 伊鲁特奇美拉 欧特奇美拉可设置逃跑！

	
设置("自动战斗", 1)			-- 开启自动战斗，0不自动战斗，1自动战斗
设置("高速战斗", 1)			-- 开启高速战斗
--设置("高速延时", 4)			-- 高速战斗速度，0不延时 
--设置("遇敌全跑", 1)			-- 开启遇敌全跑 
设置("自动加血", 0)			-- 关闭自动加血，脚本对话加血 
--设置("自动扔",1,"不可思议的鳞片")
--设置("自动扔",1,"地的水晶碎片|水的水晶碎片|火的水晶碎片|风的水晶碎片")
设置("自动扔",1,"水之宠物水晶LV8|１怪物硬币|水之宠物水晶LV4|猫眼石的碎片")
设置("自动扔",1,"５怪物硬币|硬币？|魔石|精灵？|１０怪物硬币|液体？|布？|皮？")
设置("自动扔",1,"9401,9440")		--宠物水晶  全扔
设置("自动叠",1,"地的水晶碎片&999")
设置("自动叠",1,"水的水晶碎片&999")
设置("自动叠",1,"火的水晶碎片&999")
设置("自动叠",1,"德特家的布&5")
设置("自动叠",1,"誓言之证&5")
设置("自动叠",1,"火焰之魂&5")
设置("自动叠",1,"妖草的血&5")
设置("自动叠",1,"曼陀罗草的皮&5")
设置("自动叠",1,"风龙蜥的甲壳&5")
--设置("自动扔",1,"14801,14882")--妖花之前卡片全扔
--设置("自动扔",1,"14884,14914")--妖花到吓人箱卡片全扔
--设置("自动扔",1,"14921,15055")--纯白吓人箱到半兽人卡片全扔
设置("自动扔",1,"15600,15621")--生命力回复药 1-10 全扔
--设置("自动扔",1,"18602,18615")--大地鼠 火焰鼠 鸟人 寒冰翼龙设计图  全扔
--设置("自动扔",1,"18641,18652")--水蜘蛛 绿色口臭鬼 设计图  全扔
--设置("自动扔",1,"18939,18943")--改造水蜘蛛 设计图  全扔
--设置("自动扔",1,"606600,606603")--改造水蜘蛛 设计图  全扔
--设置("自动扔",1,"606609,606691")--改造水蜘蛛 设计图  全扔

local 走路加速值=120	
local 走路还原值=100	
local doctorName="星落护士"
local 身上最少金币=5000				--少于去取
local 身上最多金币=1000000			--大于去存
local 身上预置金币=200000			--取和拿后 身上保留金币

common=require("common")

local boxList={"谜语箱１","谜语箱２","谜语箱３","谜语箱４","谜语箱５","谜语箱６","谜语箱７","谜语箱８","谜语箱９","谜语箱１０"}

     
local 补魔值=用户输入框( "多少魔以下去补给", "400")
local 补血值=用户输入框( "多少血以下去补给", "2")
local 宠补魔值=用户输入框( "宠多少魔以下去补给", "50")
local 宠补血值=用户输入框( "宠多少血以下去补给", "1")

local position=1
function 开箱子(name)
	使用物品(name)
	等待服务器返回()	
	对话选择(4,0)	
	等待(500)
end

function 包裹箱子数量()
	local boxCount=0
	for i,v in ipairs(boxList) do
		local tmpCount=取物品数量(v) 
		if(tmpCount > 0)then 			
			boxCount=boxCount+tmpCount
		end	
	end    
	return boxCount
end

function 循环开箱子()
	for i,v in ipairs(boxList) do
		if(取物品数量(v) > 0)then 
			开箱子(v)
		end	
		等待(1000)
	end
end

function 多余箱子扔和开()
	local tmpCount=包裹箱子数量()
	if(tmpCount < 1)then
		return
	elseif(tmpCount == 1)then
		循环开箱子()
		if(包裹箱子数量()==1)then
			循环开箱子()		
		end
		return
	end
::begin::
	if(tmpCount >= 2)then 		
		for i,v in ipairs(boxList) do
			if(取物品数量(v) > 0)then 
				扔(v)				
			end			
		end	
		if(string.find(最新系统消息(),"无法放置")~=nil)then 			
			if(position == 1)then goto 移位1 
			elseif(position == 2)then goto 移位2
			elseif(position == 3)then goto 移位3 
			elseif(position == 4)then goto 移位4 
			elseif(position == 5)then goto 移位5 		
			elseif(position == 6)then goto 移位6
			end
			goto 移位1	
		end
		等待(2000)
		tmpCount=包裹箱子数量()
		goto begin	
	end
	--再捡起来开
	for i,v in ipairs(boxList) do
		mapUnit=查周围信息(v,0)
		while mapUnit ~= nil do
			移动到目标附近(mapUnit.x,mapUnit.y)
			转向坐标(mapUnit.x,mapUnit.y)
			等待(2000)
			循环开箱子()
			mapUnit=查周围信息(v,0)
		end	
	end	
	if true then return end 
::移位1::
	清除系统消息()
	移动(119,104)
	position=position+1
	goto begin
::移位2::
	清除系统消息()
	移动(115,107)	
	position=position+1
	goto begin
::移位3::
	清除系统消息()
	移动(118,101)
	position=position+1
	goto begin
::移位4::
	清除系统消息()
	移动(120,107)
	position=position+1
	goto begin
::移位5::
	清除系统消息()
	移动(113,101)
	position=position+1
	goto begin
::移位6::
	清除系统消息()
	移动(113,104)
	position=1
	goto begin
end

function main()
	
::kaishi::
	等待空闲()
	common.checkGold(身上最少金币,身上最多金币,身上预置金币)
	当前地图名=取当前地图名()	
	if(当前地图名=="雪拉威森塔９６层")then	
		goto T96
	elseif(当前地图名=="雪拉威森塔９７层")then		
		goto T97
	elseif(当前地图名=="雪拉威森塔９８层")then		
		goto T98	
	end
	common.checkHealth(doctorName)	
	common.supplyCastle()
	--if(取物品数量( "谜语箱４") >=  1)then goto  sale_2 end
	if(取物品数量("塞特的护身符") > 0)then goto  saite end
	if(取物品数量("梅雅的护身符") > 0)then goto  meiya end
	if(取物品数量("提斯的护身符") > 0)then goto  tisi end	
	if(当前地图名=="艾尔莎岛")then		
		goto 雪拉威森塔
	end
	回城()
	goto kaishi
::雪拉威森塔::		
	移动(165, 153)	
	转向(4)
	等待服务器返回()	
	对话选择(32,0)
	等待服务器返回()
	对话选择(4, 0)	
	等待到指定地图("利夏岛")		
	移动(90,99,"国民会馆")
	移动(108, 54)	
	回复(0)		
	移动(108, 39)	
	等待到指定地图("雪拉威森塔１层")		
	移动(75, 50)	
	等待到指定地图("雪拉威森塔５０层")		
	移动(16, 44)	
	等待到指定地图("雪拉威森塔９５层")	
	移动(26, 104)
	移动(27, 104)		
	转向(2)
	等待服务器返回()	
	对话选择("32", "", "")	
	对话选择("4", "", "")	
	对话选择("32", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９６层")		
	goto lookbu

	
::saite::	
	使用物品("塞特的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９５层")		
	转向(2, "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９６层")			
::T96::
	移动(86, 120)
	移动(87, 119)			
	转向(1, "")
	等待服务器返回()	
	对话选择("32", "", "")	
	等待服务器返回()	
	对话选择("32", "", "")	
	等待服务器返回()	
	对话选择("4", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９７层")		
	goto lookbu

::meiya::	
	使用物品("梅雅的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９６层")	
	转向(2, "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９７层")	
::T97::
	移动(117, 126)	
	转向(0)
	等待服务器返回()	
	对话选择("32", "", "")	
	对话选择("32", "", "")	
	对话选择("32", "", "")	
	对话选择("4", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９８层")		
	goto lookbu
::tisi::	
	使用物品("提斯的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９７层")	
	转向(2)
	等待服务器返回()
	对话选择("1", "", "")		
	等待(2000)
::T98::	
	if(取当前地图名() == "雪拉威森塔９８层")then
		goto yd
	elseif(取当前地图名() == "雪拉威森塔９５层")then
		转向(2)
		等待服务器返回()	
		对话选择("32", "", "")	
		对话选择("4", "", "")	
		对话选择("32", "", "")
		等待服务器返回()
		对话选择("1", "", "")	
		等待到指定地图("雪拉威森塔９６层")	
		goto kaishi		
	end		
::yd::
	移动(116, 105)
	开始遇敌()         -- 开始自动遇敌
	goto scriptstart 
::scriptstart::	
	if(人物("血") < 补血值) then goto  ting end
	if(人物("健康") > 0) then goto  ting end
	if(人物("魔") < 补魔值) then goto  ting end
	if(宠物("血") < 宠补血值) then goto  ting end
	if(宠物("魔") < 宠补魔值) then goto  ting end
	if(取物品数量("谜语箱１") > 0)then goto ting2 end
	if(取当前地图名() ~= "雪拉威森塔９８层")then goto ting end
	-- if(取物品数量("谜语箱２") > 0)then goto ting2 end
	-- if(取物品数量("谜语箱４") > 0)then goto ting2 end
	if(是否战斗中())then 等待战斗结束() end
	等待(5000)
	goto scriptstart          --自动遇敌中 循环判断血魔
::ting::
	清除系统消息()
	停止遇敌()	
	goto lookbu
::ting2::	--开箱子
	清除系统消息()
	停止遇敌()
	等待空闲()
	多余箱子扔和开()	
	goto yd

::sale_2::			-- 存银行
	等待到指定地图("艾尔莎岛")
	移动(143,108)
	移动(157,94)        
	转向(1)	
	等待到指定地图("艾夏岛")	
	移动(114, 104,"银行")		
	移动(49,25)
	转向(2)
	等待服务器返回()
::sale_4::
	for i,v in ipairs(boxList) do
		if(取物品数量(v) > 0)then 			
			银行("全存",v)
		end	
	end    
	等待(2000)
	if(取包裹空格() < 2)then
		goto manle
	end	
	goto kaishi 
::manle::
	日志("包裹满了，结束",1)
	等待(15000)
	goto manle 
::lookbu::
	local needSupply = false
	if(人物("血") < 人物("最大血") or 人物("魔") < 人物("最大魔")) then
		needSupply=true
	end
	if(宠物("血") < 宠物("最大血") or 宠物("魔") < 宠物("最大魔")) then
		needSupply=true
	end
	if(人物("健康") > 0)then needSupply = true end
	if(needSupply == false)then
		goto kaishi
	end
	回城()
	等待到指定地图("艾尔莎岛")	
	转向(1)
	等待服务器返回()
	对话选择(4,0)	
	等待到指定地图("里谢里雅堡")		
	移动(34, 89)	
	回复(1)	
	common.checkHealth(doctorName)	
	等待(2000)
	goto kaishi 
end
main()