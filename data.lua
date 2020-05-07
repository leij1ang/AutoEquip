local _, AQSELF = ...

local merge = AQSELF.merge
local initSV = AQSELF.initSV


-- 棍子上的胡萝卜
AQSELF.carrot = 11122

-- 缓存胡萝卜换下的饰品
AQSELF.carrotBackup = 0

-- 常见的主动饰品id和buff持续时间数据
local buffTime = {}	
buffTime[19339] = 20                    -- 思维加速宝石
buffTime[19948] = 20                    -- 赞达拉饰品1
buffTime[19949] = 20                    -- 赞达拉饰品2
buffTime[19950] = 20                    -- 赞达拉饰品3
buffTime[18820] = 15                    -- 短暂能量护符
buffTime[19341] = 15                    -- 生命宝石
buffTime[11819] = 10                    -- 复苏之风
buffTime[20130] = 60                    -- 钻石水瓶
buffTime[19991] = 20                    -- 魔暴龙眼

-- 主动饰品集合
AQSELF.usable = {}
AQSELF.pveSet = {}

for k,v in pairs(buffTime) do
	table.insert(AQSELF.pveSet, k)
end

AQSELF.buffTime = buffTime

-- 能主动使用的衣服

local chestBuffTime = {}
chestBuffTime[14152] = 0				-- 大法师之袍

-- 可使用的胸甲集合
AQSELF.usableChests = {}

for k,v in pairs(chestBuffTime) do
	table.insert(AQSELF.usableChests, k)
end

AQSELF.buffTime = merge(AQSELF.buffTime, chestBuffTime)

-- 角色身上和背包中所有饰品
AQSELF.trinkets = {}
AQSELF.chests = {}

-- 联盟、部落各个职业的徽记
AQSELF.pvpSet = {
	18854,18856,18857,18858,18859,18862,18863,18864,
	18834,18845,18846,18849,18850,18851,18852,18853,
	10645
}

-- buffTime[14023] = 0                    	-- 管家铃（测试用）
buffTime[10645] = 0                    	-- 侏儒死亡射线

AQSELF.usable = merge(AQSELF.pveSet, AQSELF.pvpSet)

-- 徽记的buff时间都是0
for k,v in pairs(AQSELF.pvpSet) do
	AQSELF.buffTime[v] = 0
end

-- 记录当前角色的徽记
AQSELF.pvp = {}

-- 配置结束 --