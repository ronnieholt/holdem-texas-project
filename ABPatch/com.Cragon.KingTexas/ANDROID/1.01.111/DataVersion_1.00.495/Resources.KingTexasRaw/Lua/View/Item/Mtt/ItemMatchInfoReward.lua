ItemMatchInfoReward = {}

function ItemMatchInfoReward:new(o,com,reward,view_mgr)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.LoaderRankIcon = com:GetChild("LoaderRankIcon").asLoader
	o.GTextRank = com:GetChild("TextRank").asTextField
	o.GTextRawardConent = com:GetChild("TextRawardConent").asTextField
	o.GTextMasterPoint = com:GetChild("TextMasterPoint").asTextField
	local rank_begin = reward.RankingBegin
	local ran_end = reward.RankingEnd
	if(rank_begin == ran_end)
	then
		if(rank_begin >=1 and rank_begin <=3)
		then
			o.LoaderRankIcon.url = CS.FairyGUI.UIPackage.GetItemURL("Common","Rank"..rank_begin)
		else
			o.GTextRank.text = rank_begin
		end
	else
		o.GTextRank.text = rank_begin .."-" .. ran_end
	end
	local temp = {}
	if(reward.Gold ~= 0)
	then
		table.insert(temp,UiChipShowHelper:getGoldShowStr(reward.Gold,view_mgr.LanMgr.LanBase))
		table.insert(temp,view_mgr.LanMgr:getLanValue("Chip"))
	end
	if(reward.RedEnvelopes ~= 0)
	then
		local l_t = #temp
		if l_t >0 then
			table.insert(temp," + ")
		end
		table.insert(temp,UiChipShowHelper:getGoldShowStr(reward.RedEnvelopes,view_mgr.LanMgr.LanBase))
		table.insert(temp,view_mgr.LanMgr:getLanValue("WechatRedEnvelopes"))
	end
	if(reward.ItemId ~= 0)
	then
		local tbData_mgr = CS.Casinos.CasinosContext.Instance.TbDataMgrLua
		local data = tbData_mgr:GetData("Item",reward.ItemId)
		table.insert(temp," + ")
		table.insert(temp,data.Name)
	end
	o.GTextRawardConent.text = table.concat(temp)
	o.GTextMasterPoint.text = 0
	return o
end

