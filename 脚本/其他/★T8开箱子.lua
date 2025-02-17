艾岛启动，T8开箱子

common=require("common")
设置("自动扔",1,"卡片？")
设置("自动扔",1,"艾夏糖")
设置("自动扔",1,"串烧哥布林")
设置("自动扔",1,"家族兽之笛")
设置("自动扔",1,"绿头盔")
设置("自动扔",1,"红头盔")
设置("自动扔",1,"赖光的头盔")
设置("自动扔",1,"中型的土之宝石")
设置("自动扔",1,"中型的水之宝石")
设置("自动扔",1,"中型的火之宝石")
设置("自动扔",1,"中型的风之宝石")
设置("自动扔",1,"14400,14449")--人形系 龙系 野兽系 昆虫系 特殊系 -封印卡扔
设置("自动扔",1,"14460,14499")--人飞行系 不死系 植物系 全系 -封印卡扔
设置("自动扔",1,"14801,14882")--妖花之前卡片全扔
设置("自动扔",1,"14884,14914")--妖花到吓人箱卡片全扔
设置("自动扔",1,"14921,15055")--纯白吓人箱到半兽人卡片全扔
设置("自动扔",1,"15600,15621")--生命力回复药 1-10 全扔
设置("自动扔",1,"18602,18615")--大地鼠 火焰鼠 鸟人 寒冰翼龙设计图  全扔
设置("自动扔",1,"18641,18652")--水蜘蛛 绿色口臭鬼 设计图  全扔
设置("自动扔",1,"18939,18943")--改造水蜘蛛 设计图  全扔
设置("自动扔",1,"巨石|绿头盔|星之砂|秘文之皮|奇香木|坚硬的鳞片|曼陀罗草的皮|衣服？|古钱？|5610|9604|4412|15605|3610|魔石|宝石？|17200|5200|40|弓？|1633|9236|2851|6041|杖？|鞋？|铠甲？|607926|盾？|布？|头盔？|双手斧？|靴？|小刀？|18311|18312|枪？|单手剑？|回力镖？|18313|斧？|水晶？|3214|9605|线？|帽子？|袍？|戒指？|铁杉|10006|18310|10001|9601|10002|10004|4407|10005|9600|皮袍|皮盔|粗布帽|羽毛衣|9603|14482|10007|10000|14443|14473|6012|14461|6411|14460|14433|607680|14483|9602|梅布尔椰子|盖雷布伦坚果|坐垫")
设置("自动叠",1,"地的水晶碎片&999|水的水晶碎片&999|火的水晶碎片&999|风的水晶碎片&999|神之金&20|龙角&20|隐秘的徽记（地）&20|隐秘的徽记（水）&20|隐秘的徽记（火）&20|隐秘的徽记（风）&20|阿尔卡迪亚古钱&999|魔族的水晶&5|钢骑之矿&5|德特家的布&5|誓言之证&5|能量结晶&99|巨石&20|长老之证&7|铜钥匙&999|白钥匙&999|黑钥匙&999|坐垫&10")
local keyType="铜钥匙"
local 铜钥匙数量=999
local openCount=0		--开箱子数
local keyMapPosList={
	["铜钥匙"]={{102,50},{67,105},{121,129},{125,146}}
	}
local index=1
local keyPosSize=common.getTableSize(keyMapPosList[keyType])
日志("大小"..keyPosSize)
function 去买钥匙()
::去买钥匙::
	自动寻路(102,131)
	等待到指定地图("安其摩酒吧", 16,23)
	自动寻路(19,6)
	等待到指定地图("酒吧里面", 17,7)
	自动寻路(21,1)
	等待到指定地图("客房", 7,11)
	自动寻路(8,3)
	
::买钥匙::	
	转向(0)	
	喊话("头目万岁",2,3,5)
	等待服务器返回()	
	对话选择(4, 0)		
	if(取物品叠加数量("铜钥匙") >= 铜钥匙数量)then
		回城()
		return
	end
	goto 买钥匙
end
function 检查金属封印卡()
	if(取物品数量("封印卡（金属系）") < 1)then 
		common.toTeleRoom("杰诺瓦镇")					
		自动寻路(14, 6,"村长的家")	 
		自动寻路(1, 9,"杰诺瓦镇")
		自动寻路(43, 23,"杂货店")	
		自动寻路(11, 12)
		转向(2)
		等待服务器返回()
		对话选择(0,1)
		等待服务器返回()
		买(2,40)
		等待(2000)		
	end		
end
function 检查人宠血魔()
	if(人物("血") < 100 or 宠物("血") < 100 or 宠物("魔") < 100)then
		common.supplyCastle()
		common.checkHealth()
	end
end
function main()
	if(取物品叠加数量("铜钥匙") < 100)then
		common.gotoFaLanCity()
		去买钥匙()
	end
	
::begin::
	等待空闲()
	当前地图名=取当前地图名()
	mapNum=取当前地图编号()
	if(当前地图名=="艾尔莎岛")then
		goto aiersha	
	elseif (当前地图名=="利夏岛" )then	
		goto map59522
	elseif (当前地图名=="国民会馆" )then	
		goto map59552
	elseif (当前地图名=="雪拉威森塔１层" )then	
		goto map59801
	elseif (当前地图名=="雪拉威森塔８层" )then	
		goto map59808
	elseif (当前地图名=="雪拉威森塔９层" )then	
		goto map59809	
	elseif (当前地图名=="雪拉威森塔１０层" )then	
		goto map59810	
	end
	等待(1000)	
	回城()
	goto begin 
::aiersha::	
	自动寻路(165, 153)
	转向(4)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(4, 0)		
	等待(1000)
::map59522::					--利夏岛
	if(取当前地图名() ~= "利夏岛")then
		goto begin
	end
	自动寻路(90,99,"国民会馆")
::map59552::					--国民会馆
	自动寻路(109,51)
	回复(108,52)	
	自动寻路(108,39,"雪拉威森塔１层")
	goto begin
::map59801::					--雪拉威森塔１层
	自动寻路(76,58,'雪拉威森塔１０层')		
	goto begin
::map59808::
	index=1
	while true do
		if(取物品数量(keyType) < 1)then
			日志("包裹已没有钥匙，脚本退出",1)
			return
		end
		if(取当前地图编号() ~= 59808)then break end
		检查人宠血魔()
		检查金属封印卡()
		if(index <= keyPosSize)then
			local pos = keyMapPosList[keyType][index]
			local keyCount = 取物品叠加数量(keyType)

			if(pos[1] == 121 and pos[2] == 129)then
				自动寻路(120,130)
				转向坐标(pos[1],pos[2])
			else
				自动寻路(pos[1],pos[2])
				移动到目标附近(pos[1],pos[2])
				转向坐标(pos[1],pos[2])
			end 
			等待(1000)
			使用物品(keyType)
			等待(1000)
			if(是否战斗中())then 等待战斗结束() end
			if(取物品叠加数量(keyType) < keyCount)then
				openCount=openCount+1
				日志("星落T8开箱子脚本：找到箱子【"..pos[1]..","..pos[2].."】，已开箱子数：【"..openCount.."】",1)
			else
				日志("星落T8开箱子脚本：没有找到箱子【"..pos[1]..","..pos[2].."】")
			end
			index=index+1
		else
			index=1
		end	
	end
	goto begin
::map59809::
	自动寻路(106,40)
	自动寻路(106,43)
	自动寻路(107,43)
	自动寻路(129,61)
	自动寻路(132,61)
	自动寻路(132,63)
	自动寻路(132,67,"雪拉威森塔８层")
	goto begin
::map59810::
	自动寻路(56,25,"雪拉威森塔９层")
	goto begin
end
	

main()