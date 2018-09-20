ItemPrivateMatch = {}

function ItemPrivateMatch:new(o,com,match_info,view_mgr)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.MatchGuid = match_info.Guid
	o.ViewMgr = view_mgr
	local com_info = o.com:GetChild("ComInfo").asCom
	local text_startScore = com_info:GetChild("TextStartChip").asTextField
	text_startScore.text = UiChipShowHelper:getGoldShowStr3(match_info.RaiseBlindTbInfo.StartScore)
	local text_raiseBlidTime = com_info:GetChild("TextRiseBlindTime").asTextField
	text_raiseBlidTime.text = math.floor(match_info.RaiseBlindTbInfo.StartScore.RaiseBlindTmSpan/60) .. "min"
	local text_matchName = com:GetChild("TextMatchTitle").asTextField
	text_matchName.text = match_info.Name
	local match_beginTime = com:GetChild("TextMatchStartTime").asTextField
	match_beginTime.text = string.format("%02s",match_info.DtMatchBegin.Month).."-"..
			               string.format("%02s",match_info.DtMatchBegin.Day).." "..
			               string.format("%02s",match_info.DtMatchBegin.Hour)..":"..
			               string.format("%02s",match_info.DtMatchBegin.Minute)
	o.GTextSignupNum = com_info:GetChild("TextApplyNumber").asTextField
	o.GTextSignupNum.text = match_info.PlayerNum
	o.GTextMatchState = com:GetChild("TextMatchState").asTextField
	local nowtm = CS.System.DateTime.Now
	if(match_info.DtMatchBegin >= nowtm)
	then
		o:SetMatchState("比赛中")
	else
		o:SetMatchState("报名中")
	end
	o.IsSelfJoin = false
	return o
end

function ItemPrivateMatch:onClickSelf()
	local view_privateMatchMoreInfo = self.ViewMgr:createView("PrivateMatchInfo")
	view_privateMatchMoreInfo:Init(self.MatchGuid,self.IsSelfJoin)
end

function ItemPrivateMatch:SetMatchState(state)
	self.MatchState = state
	self.GTextMatchState.text = state
end
