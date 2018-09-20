ViewShootingText = ViewBase:new(nil)

function ViewShootingText:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.ViewMgr = nil
	o.GoUi = nil
	o.ComUi = nil
	o.Panel = nil
	o.UILayer = nil
	o.InitDepth = nil
	o.ViewKey = nil
	self.ShootingTextArea = 0.5
	self.ShootingTextMoveSpeed = 200
	self.PackName = "ShootingText"

	return o
end

function ViewShootingText:onCreate()
	self.ControllerPlayerMarquee = self.ViewMgr.ControllerMgr:GetController("Marquee")
	self.ViewPool = self.ViewMgr:getView("Pool")
	self.MapItemShootingText = {}
	self.ViewMgr:bindEvListener("EvEntityReceiceMarquee",self)
end

function ViewShootingText:onDestroy()
	self.ViewMgr:unbindEvListener(self)
	if (self.Marquee ~= nil)
	then
		self.Marquee:destroy()
	end
	if (self.MapItemShootingText ~= nil)
	then
		for k,v in pairs(self.MapItemShootingText) do
			self.GCoShootingText:RemoveChild(k)
			self.ViewPool:shootingTextEnque(k)
		end
		self.MapItemShootingText = nil
	end
end

function ViewShootingText:onHandleEv(ev)
	if(ev ~= nil)
	then
		if(ev.EventName == "EvEntityReceiceMarquee")
		then
			self.Marquee:setHaveMarquee()
		end
	end
end

function ViewShootingText:onUpdate(elapsed_tm)
	if (self.Marquee ~= nil)
	then
		self.Marquee:update(elapsed_tm)
	end
end

function ViewShootingText:init(always_show_marquee, show_top,show_bg)
	self.GCoShootingTextParent = self.ComUi:GetChild("ShootingTextParent").asCom
	self.GCoMarqueeParentTop = self.ComUi:GetChild("MarqueeParentTop").asCom
	self.GCoMarqueeTop = CS.FairyGUI.UIPackage.CreateObject(self.PackName, "ComMarquee").asCom
	self.GCoMarqueeParentTop:AddChild(self.GCoMarqueeTop)
	local marquee_top_pos = self.GCoMarqueeTop.position
	marquee_top_pos.x = -self.GCoMarqueeTop.width / 2
	self.GCoMarqueeTop.position = marquee_top_pos
	self.GCoMarqueeTop.visible = false
	self.GCoMarqueeTop.onClick:Add(
			function()
				self:onClickMarquee()
			end
	)
	self.GCoMarqueeParentCenter = self.ComUi:GetChild("MarqueeParentCenter").asCom
	self.GCoMarqueeCenter = CS.FairyGUI.UIPackage.CreateObject(self.PackName, "ComMarquee").asCom
	self.GCoMarqueeParentCenter:AddChild(self.GCoMarqueeCenter)
	local marquee_center_pos = self.GCoMarqueeCenter.position
	marquee_center_pos.x = -self.GCoMarqueeCenter.width / 2
	self.GCoMarqueeCenter.position = marquee_center_pos
	self.GCoMarqueeCenter.visible = false
	self.GCoMarqueeCenter.onClick:Add(
			function()
				self:onClickMarquee()
			end
	)
	self.GCoShootingText = CS.FairyGUI.UIPackage.CreateObject(self.PackName, "ComShootingText").asCom
	self.GCoShootingTextParent:AddChild(self.GCoShootingText)
	self.GCoShootingText.width = self.ComUi.width
	self.GCoShootingText.height = self.ComUi.height * self.ShootingTextArea
	self.GCoShootingText.visible = false
	self.GCoCurrentMarqueeParent = self.GCoMarqueeTop
	if (show_top == false)
	then
		self.GCoCurrentMarqueeParent = self.GCoMarqueeCenter
	end
	local always_show = false
	if (always_show_marquee)
	then
		always_show = true
		self.GCoCurrentMarqueeParent.visible = true
	end
	local real_p = self.GCoCurrentMarqueeParent:GetChild("ComMarqueeRealParent")
	if (real_p ~= nil)
	then
		self.GComMarqueeRealParent = real_p.asCom
	end
	local btn_pen_temp = self.GCoCurrentMarqueeParent:GetChild("BtnPen")
	if (btn_pen_temp ~= nil)
	then
		local btn_pen = btn_pen_temp.asButton
		btn_pen.onClick:Add(
				function()
					self:onClickMarquee()
				end
		)
		self.GCoCurrentMarqueeParent.onClick:Clear()
	end
	local btn_horn_temp = self.GCoCurrentMarqueeParent:GetChild("BtnHorn")
	if (btn_horn_temp ~= nil)
	then
		local btn_horn = btn_horn_temp.asButton
		btn_horn.onClick:Add(
				function()
					self:onClickMarquee()
				end
		)
		self.GCoCurrentMarqueeParent.onClick:Clear()
	end
	local have_marquee = self.ControllerPlayerMarquee:haveNeedShowMarquee()
	self.Marquee = ViewMarquee:new(nil,self, always_show, have_marquee)
	local con_showbg = self.GCoCurrentMarqueeParent:GetController("ControllerShowBg")
	if show_bg then
		con_showbg.selectedIndex = 0
	else
		con_showbg.selectedIndex = 1
	end
end

function ViewShootingText:setShootingText(tilte, context, vip_level)
	self.GCoShootingText.visible = true
	local item_shootingtext = self.ViewPool:getShootingTextItem()
	self.GCoShootingText:AddChild(item_shootingtext.Com)
	local pos_from = CS.UnityEngine.Vector3()
	pos_from.x = self.ComUi.width
	pos_from.y = CS.UnityEngine.Random.Range(0, self.GCoShootingText.height - item_shootingtext.Com.height / 2)
	pos_from.z = 0
	local color = CS.Casinos.UiHelperCasinos.GetRandomShootingTextColor()
	item_shootingtext:setChat(tilte, context, vip_level, CS.System.DateTime.MinValue,
			color, color, true, 1000, CS.Casinos._eChatItemType.ShootingText, true, false, true, false, true, 30)
	item_shootingtext:moveItem(self.ShootingTextMoveSpeed, pos_from,
			function (item_text, chat_type)
				self:moveEnd(item_text, chat_type)
			end)
	self.MapItemShootingText[item_shootingtext] = item_shootingtext
end

function ViewShootingText:moveEnd(item_text, chat_type)
	if (self.MapItemShootingText == nil)
	then
		return
	end
	if (chat_type == CS.Casinos._eChatItemType.ShootingText)
	then
		self.MapItemShootingText[item_text] = nil
		self.GCoShootingText:RemoveChild(item_text)
		local  l = LuaHelper:GetTableCount(self.MapItemShootingText)
		if (l == 0)
		then
			self.GCoShootingText.visible = false
		end
		self.ViewPool:shootingTextEnque(item_text)
	end
end

function ViewShootingText:onClickMarquee()
	self.ViewMgr:createView("Notice")
end


ViewMarquee = {}

function ViewMarquee:new(o, shooting_text, always_show, have_marquee)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	self.AlwaysShow = always_show
	self.ViewShootingText = shooting_text
	self.MapItemMarquee = {}
	self.HaveMarquee = have_marquee
	self.ControllerPlayerMarquee = self.ViewShootingText.ViewMgr.ControllerMgr:GetController("Marquee")

	return o
end

function ViewMarquee:destroy()
	if (self.MapItemMarquee ~= nil)
	then
		for k,v in pairs(self.MapItemMarquee) do
			self.ViewShootingText.GComMarqueeRealParent:RemoveChild(k)
			self.ViewShootingText.ViewPool:shootingTextEnque(k)
		end
	end
	self.MapItemMarquee = nil
end

function ViewMarquee:update(tm)
	if (self.CurrentMarquee == nil and self.HaveMarquee)
	then
		self:playMarquee()
	end
end

function ViewMarquee:setHaveMarquee()
	self.HaveMarquee = true
end

function ViewMarquee:playMarquee()
	self.CurrentMarquee = self.ControllerPlayerMarquee:getNeedShowMarquee()
	if (self.CurrentMarquee ~= nil)
	then
		self.ViewShootingText.GCoCurrentMarqueeParent.visible = true
		local item_shootingtext = self.ViewShootingText.ViewPool:getShootingTextItem()
		self.ViewShootingText.GComMarqueeRealParent:AddChild(item_shootingtext.Com)
		local  pos_from = CS.UnityEngine.Vector3()
		pos_from.x = self.ViewShootingText.GCoCurrentMarqueeParent.width
		pos_from.y = 0
		pos_from.z = 0
		local color_title = "5DC1FF"
		local color_content = "FFFF00"
		if (self.CurrentMarquee.SenderType == IMMarqueeSenderType.System)
		then
			color_title = "FF0000"
		end
		item_shootingtext:setChat(self.CurrentMarquee.NickName, self.CurrentMarquee.Msg, self.CurrentMarquee.VIPLevel, CS.System.DateTime.MinValue,
				color_title, color_content, true, 1000, CS.Casinos._eChatItemType.Marquee)
		item_shootingtext:moveItem(self.ViewShootingText.ShootingTextMoveSpeed / 2, pos_from,
				function(item_text, item_type)
					self:moveEnd(item_text, item_type)
				end
		)
		self.MapItemMarquee[item_shootingtext] = item_shootingtext
	else
		if (self.AlwaysShow == false)
		then
			if (#self.MapItemMarquee == 0)
			then
				self.ViewShootingText.ViewMgr:destroyView(self.ViewShootingText)
			end
		end
		self.HaveMarquee = false
	end
end

function ViewMarquee:moveEnd(item_text, item_type)
	if (self.MapItemMarquee == nil)
	then
		return
	end
	if (item_type == CS.Casinos._eChatItemType.Marquee)
	then
		self.CurrentMarquee = nil
		self.MapItemMarquee[item_text] = nil
		self.ViewShootingText.GComMarqueeRealParent:RemoveChild(item_text.Com)
		self.ViewShootingText.ViewPool:shootingTextEnque(item_text)
	end
end



ViewShootingTextFactory = ViewFactory:new()

function ViewShootingTextFactory:new(o,ui_package_name,ui_component_name,
									 ui_layer,is_single,fit_screen)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	self.PackageName = ui_package_name
	self.ComponentName = ui_component_name
	self.UILayer = ui_layer
	self.IsSingle = is_single
	self.FitScreen = fit_screen
	return o
end

function ViewShootingTextFactory:createView()
	local view = ViewShootingText:new(nil)
	return view
end