-- Copyright(c) Cragon. All rights reserved.
-- 手机国际区号的默认区号，从Native中获取
-- 点击登录按钮，再次走一遍更新流程

---------------------------------------
PhoneCountryCode = {
    AR = { Code = "54", Name = "阿根廷" },
    AE = { Code = "971", Name = "阿拉伯联合酋长国" },
    EG = { Code = "20", Name = "埃及" },
    IE = { Code = "353", Name = "爱尔兰" },
    EE = { Code = "372", Name = "爱沙尼亚" },
    AT = { Code = "43", Name = "奥地利" },
    AU = { Code = "61", Name = "澳大利亚" },
    MO = { Code = "853", Name = "澳门" },
    PY = { Code = "595", Name = "巴拉圭" },
    BH = { Code = "973", Name = "巴林" },
    BR = { Code = "55", Name = "巴西" },
    BY = { Code = "375", Name = "白俄罗斯" },
    BG = { Code = "359", Name = "保加利亚" },
    BE = { Code = "32", Name = "比利时" },
    IS = { Code = "354", Name = "冰岛" },
    PL = { Code = "48", Name = "波兰" },
    BO = { Code = "591", Name = "玻利维亚" },
    DK = { Code = "45", Name = "丹麦" },
    DE = { Code = "49", Name = "德国" },
    RU = { Code = "7", Name = "俄罗斯" },
    EC = { Code = "593", Name = "厄瓜多尔" },
    FR = { Code = "33", Name = "法国" },
    PH = { Code = "63", Name = "菲律宾" },
    FI = { Code = "358", Name = "芬兰" },
    CO = { Code = "57", Name = "哥伦比亚" },
    KZ = { Code = "7", Name = "哈萨克斯坦" },
    KR = { Code = "82", Name = "韩国" },
    NL = { Code = "31", Name = "荷兰" },
    HN = { Code = "504", Name = "洪都拉斯" },
    CA = { Code = "1", Name = "加拿大" },
    KH = { Code = "855", Name = "柬埔寨" },
    CZ = { Code = "420", Name = "捷克" },
    QA = { Code = "974", Name = "卡塔尔" },
    KW = { Code = "965", Name = "科威特" },
    LT = { Code = "370", Name = "立陶宛" },
    LU = { Code = "352", Name = "卢森堡" },
    RO = { Code = "40", Name = "罗马尼亚" },
    MT = { Code = "356", Name = "马耳他" },
    MY = { Code = "60", Name = "马来西亚" },
    US = { Code = "1", Name = "美国" },
    BD = { Code = "880", Name = "孟加拉国" },
    PE = { Code = "51", Name = "秘鲁" },
    MX = { Code = "52", Name = "墨西哥" },
    ZA = { Code = "27", Name = "南非" },
    NI = { Code = "505", Name = "尼加拉瓜" },
    NO = { Code = "47", Name = "挪威" },
    PT = { Code = "351", Name = "葡萄牙" },
    JP = { Code = "81", Name = "日本" },
    SE = { Code = "46", Name = "瑞典" },
    CH = { Code = "41", Name = "瑞士" },
    SV = { Code = "503", Name = "萨尔瓦多" },
    RS = { Code = "381", Name = "塞尔维亚" },
    CY = { Code = "357", Name = "塞浦路斯" },
    SA = { Code = "966", Name = "沙特阿拉伯" },
    SM = { Code = "378", Name = "圣马力诺" },
    SK = { Code = "421", Name = "斯洛伐克" },
    SI = { Code = "386", Name = "斯洛文尼亚" },
    TW = { Code = "886", Name = "台湾省" },
    TH = { Code = "66", Name = "泰国" },
    TR = { Code = "90", Name = "土耳其" },
    GT = { Code = "502", Name = "危地马拉" },
    VE = { Code = "58", Name = "委内瑞拉" },
    BN = { Code = "673", Name = "文莱" },
    UA = { Code = "380", Name = "乌克兰" },
    UZ = { Code = "998", Name = "乌兹别克斯坦" },
    GR = { Code = "30", Name = "希腊" },
    ES = { Code = "34", Name = "西班牙" },
    HK = { Code = "852", Name = "香港" },
    SG = { Code = "65", Name = "新加坡" },
    NZ = { Code = "64", Name = "新西兰" },
    HU = { Code = "36", Name = "匈牙利" },
    AM = { Code = "374", Name = "亚美尼亚" },
    IL = { Code = "972", Name = "以色列" },
    IT = { Code = "39", Name = "意大利" },
    IN = { Code = "91", Name = "印度" },
    ID = { Code = "62", Name = "印度尼西亚" },
    GB = { Code = "44", Name = "英国" },
    JO = { Code = "962", Name = "约旦" },
    VN = { Code = "84", Name = "越南" },
    CL = { Code = "56", Name = "智利" },
    CN = { Code = "86", Name = "中国" },
    NG = { Code = "234", Name = "尼日利亚" },
}

---------------------------------------
ControllerLogin = ControllerBase:new(nil)

---------------------------------------
function ControllerLogin:new(o, controller_mgr, controller_data, guid)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    if (self.Instance == nil) then
        self.ControllerName = "Login"
        self.ControllerData = controller_data
        self.ControllerMgr = controller_mgr
        self.Guid = guid
        self.Password = nil
        self.RemeberPwd = false
        self.RequestThirdPartyLogin = false
        self.BindingWeChat = false
        self.AutoLogin = false
        self.AutoLoginTm = 0
        self.ViewMgr = ViewMgr:new(nil)
        self.AccId = nil
        self.Acc = nil
        self.Pwd = nil
        self.Token = nil
        self.GatewayIp = nil
        self.GatewayPort = 5882
        self.ClientEnterWorldNotify = nil
        self.ShowKickOutInfo = false
        self.LoginAccountInfoKey = "LoginAccountInfo2"
        self.TimerUpdate = nil
        self.CasinosContext = CS.Casinos.CasinosContext.Instance
        self.Instance = o
    end
    return self.Instance
end

---------------------------------------
function ControllerLogin:onCreate()
    self.ControllerUCenter = self.ControllerMgr:GetController("UCenter")
    local c = CS.Casinos.CasinosContext.Instance
    self.ViewMgr:bindEvListener("EvUiLogin", self)
    self.ViewMgr:bindEvListener("EvUiLoginSuccessEx", self)
    self.ViewMgr:bindEvListener("EvUiLoginClickBtnRegister", self)
    self.ViewMgr:bindEvListener("EvEntityPlayerInitDone", self)
    self.ViewMgr:bindEvListener("EvUiRequestResetPwd", self)
    self.ViewMgr:bindEvListener("EvUiChooseUCenter", self)
    self.ViewMgr:bindEvListener("EvUiChooseGateWay", self)
    self.ViewMgr:bindEvListener("EvUiRequestGetPhoneCode", self)
    self.ViewMgr:bindEvListener("EvCheckIdCard", self)
    self.ViewMgr:bindEvListener("EvBindWeChat", self)
    self.ViewMgr:bindEvListener("EvUnbindWeChat", self)

    self:_init(true)
    c.NetBridge:blindTable(self)

    self.TimerUpdate = self.CasinosContext.TimerShaft:RegisterTimer(200, self, self._timerUpdate)

    local rpc = self.ControllerMgr.RPC
    local m_c = CommonMethodType
    rpc:RegRpcMethod0(m_c.AccountGatewayConnected, function()
        self:OnAccountGatewayConnected()
    end)
    rpc:RegRpcMethod1(m_c.AccountLoginAppResponse, function(login_response)
        self:OnAccountLoginAppResponse(login_response)
    end)
    rpc:RegRpcMethod1(m_c.AccountEnterWorldResponse, function(enterworld_notify)
        self:OnAccountEnterWorldResponse(enterworld_notify)
    end)
    rpc:RegRpcMethod1(m_c.AccountLogoutNotify, function(protocal_result)
        self:OnAccountLogoutNotify(protocal_result)
    end)
    rpc:RegRpcMethod1(m_c.AccountUpdateDataFromUCenterNotify, function(result)
        self:OnAccountUpdateDataFromUCenterNotify(result)
    end)
end

---------------------------------------
function ControllerLogin:onDestroy()
    if (self.TimerUpdate ~= nil) then
        self.TimerUpdate:Close()
        self.TimerUpdate = nil
    end
    self.ViewMgr:unbindEvListener(self)
end

---------------------------------------
function ControllerLogin:onHandleEv(ev)
    if (ev ~= nil) then
        if (ev.EventName == "EvUiLogin") then
            local login_type = ev.login_type
            CS.Casinos.CasinosContext.Instance.LoginType = login_type
            self.LoginType = login_type
            self.Acc = ev.acc
            self.Pwd = ev.pwd
            local remeber_pwd = ev.remeber_pwd
            self.RemeberPwd = remeber_pwd
            self.Phone = ev.phone
            -- todo，还原点击登录时，检测更新的功能
            --MainC:LoadConfig(true, function(bo)
            --    self:_clickCheckDataCallBack(bo)
            --end)
            self:_clickCheckDataCallBack(false)
        elseif (ev.EventName == "EvUiLoginClickBtnRegister") then
            local acc = ev.AccountName
            local pwd = ev.Password
            local super_pwd = ev.SuperPassword
            local remeber_pwd = ev.remeber_pwd
            self.Password = pwd
            self.RemeberPwd = remeber_pwd
            local email = ev.Email
            local identity = ev.Identity
            local phone = ev.Phone
            self.Phone = phone
            local name = ev.Name
            local device_info = self.getDeviceInfo()
            local register_acc_data = AccountRegisterInfo:new(nil)--CS.GameCloud.UCenter.Common.Portable.Models.AppClient.AccountRegisterInfo()
            register_acc_data.AccountName = acc
            register_acc_data.Password = pwd
            register_acc_data.SuperPassword = super_pwd
            register_acc_data.Email = email
            register_acc_data.Identity = identity
            register_acc_data.Phone = ev.FormatPhone
            register_acc_data.Name = name
            register_acc_data.PhoneVerificationCode = ev.PhoneVerificationCode
            register_acc_data.Device = device_info
            register_acc_data.AppId = UCenterAppId
            self:RequestRegister(register_acc_data)
        elseif (ev.EventName == "EvUiRequestGetPhoneCode") then
            -- 获取验证码
            local phone = ev.Phone
            local request = GetPhoneVerificationCodeRequest:new(nil)
            request.Phone = phone
            self.ControllerUCenter:RequestGetPhoneVerificationCode(request,
                    function(http_statuscode, status, response, error)
                        self:OnUCenterPhoneVerificationCode(http_statuscode, status, response, error)
                    end)
        elseif (ev.EventName == "EvUiRequestResetPwd") then
            local phone_code = ev.phone_code
            local new_pwd = ev.new_pwd
            self.Password = new_pwd
            self.Phone = ev.phone
            self:RequestResetPasswordWithPhone(ev.formatphone, phone_code, new_pwd)
        elseif (ev.EventName == "EvUiChooseUCenter") then
            UCenterDomain = ev.ucenter
            self.ControllerUCenter.UCenterDomain = ev.ucenter
        elseif (ev.EventName == "EvUiChooseGateWay") then
            GatewayIp = ev.gateway
        elseif (ev.EventName == "EvUiLoginSuccessEx") then
            if self.BindingWeChat == false then
                self:RequestWechatLogin(ev.token, WeChatAppId)
            else
                print("AccountWeChatBindRequest")
                local request = AccountWeChatBindRequest:new(nil)
                request.ucenterAppId = UCenterAppId
                print(request.ucenterAppId)
                request.code = ev.token
                print(request.code)
                request.accountId = self.AccId
                print(request.accountId)
                request.token = self.Token
                print(request.token)
                self.ControllerUCenter:RequestWechatBind(request,
                        function(http_statuscode, status, response, error)
                            self:OnUCenterWechatBind(http_statuscode, status, response, error)
                        end)
            end
            self.BindingWeChat = false
        elseif (ev.EventName == "EvCheckIdCard") then
            self:RequestCheckCardAndName(ev.id_card, ev.name)
        elseif (ev.EventName == "EvBindWeChat") then
            ViewHelper:UiShowMsgBox(self.ControllerMgr.LanMgr:getLanValue("BindWeChatTips"), function()
                ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("BindingWeChat"), 10)
                self.RequestThirdPartyLogin = true
                self.BindingWeChat = true
            end)
        elseif (ev.EventName == "EvUnbindWeChat") then
            ViewHelper:UiShowMsgBox(self.ControllerMgr.LanMgr:getLanValue("UnbindWeChatTips"), function()
                print("EvUnbindWeChat")
                local open_id = nil
                if self.ControllerActor ~= nil then
                    open_id = self.ControllerActor.WeChatOpenId:get()
                end
                local request = AccountWeChatUnbindRequest:new(nil)
                request.ucenterAppId = UCenterAppId
                request.openId = open_id
                request.accountId = self.AccId
                request.token = self.Token
                self.ControllerUCenter:RequestWechatUnbind(request,
                        function(http_statuscode, status, response, error)
                            self:OnUCenterWechatUnbind(http_statuscode, status, response, error)
                        end)
            end)
        end
    end
end

---------------------------------------
function ControllerLogin:_timerUpdate(tm)
    if (self.RequestThirdPartyLogin) then
        self.RequestThirdPartyLogin = false
        if (self.CasinosContext.LoginType == CS.Casinos._eLoginType.WeiXin or self.BindingWeChat) then
            self.CasinosContext:SetNativeOperate(1)
            CS.ThirdPartyLogin.Instantce():login(CS._eThirdPartyLoginType.WeChat, WeChatState, "Login")
        end
    end

    --if self.AutoLogin then
    --    self.AutoLoginTm = self.AutoLoginTm + tm
    --    if self.AutoLoginTm >= 5 then
    --        self.AutoLoginTm = 0
    --        self.AutoLogin = false
    --        local view_login = self.ViewMgr:getView("Login")
    --        if view_login ~= nil then
    --            view_login:Switch2Logining()
    --        end
    --    end
    --end
end

---------------------------------------
function ControllerLogin:RequestLogin(acc, pwd, phone, email, phone_verification_code)
    CS.Casinos.CasinosContext.Instance.LoginType = 0
    self.Password = pwd
    ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("Logining"))

    local request = AccountLoginInfo:new(nil)
    request.AccountName = acc
    request.Phone = phone
    request.Email = email
    request.Password = pwd
    request.PhoneVerificationCode = phone_verification_code
    request.Device = self:getDeviceInfo()
    self.ControllerUCenter:RequestLogin(request,
            function(http_statuscode, status, response, error)
                self:OnUCenterLogin(http_statuscode, status, response, error)
            end
    )
end

---------------------------------------
function ControllerLogin:RequestGuestAccess()
    CS.Casinos.CasinosContext.Instance.LoginType = 1
    ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("Logining"))
    local guest_accessinfo = GuestAccessInfo:new(nil)--CS.GameCloud.UCenter.Common.Portable.Models.AppClient.GuestAccessInfo()
    guest_accessinfo.AppId = UCenterAppId
    guest_accessinfo.Device = self:getDeviceInfo()
    self.ControllerUCenter:RequestGuestAccess(guest_accessinfo,
            function(http_statuscode, status, response, error)
                self:onUCenterGuestAccess(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:RequestRegister(register_acc_data)
    ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("Registering"))
    self.ControllerUCenter:RequestRegister(register_acc_data,
            function(http_statuscode, status, response, error)
                self:OnUCenterRegister(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:RequestWechatLogin(token, app_id)
    CS.Casinos.CasinosContext.Instance.LoginType = 2
    local c_login = ControllerLogin:new(nil)
    ViewHelper:UiBeginWaiting(c_login.ControllerMgr.LanMgr:getLanValue("Logining"))
    local wechat_info = AccountWeChatOAuthInfo:new(nil)--CS.GameCloud.UCenter.Common.Portable.Models.AppClient.AccountWeChatOAuthInfo()
    wechat_info.Code = token
    wechat_info.AppId = app_id
    wechat_info.Device = self:getDeviceInfo()
    c_login.ControllerUCenter:RequestWechatLogin(wechat_info,
            function(http_statuscode, status, response, error)
                c_login:OnUCenterLogin(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:RequestWechatAutoLogin()
    CS.Casinos.CasinosContext.Instance.LoginType = 2
    local r = AccountWeChatAutoLoginRequest:new(nil)
    r.AppId = WeChatAppId
    r.OpenId = a_info_last_login.AccName
    r.Device = self:getDeviceInfo()
    self.ControllerUCenter:RequestWechatAutoLogin(r,
            function(http_statuscode, status, response, error)
                self:OnUCenterLogin(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:RequestResetPasswordWithPhone(phone, phone_code, new_pwd)
    ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("ResetPwding"))
    local resetPwd_info = AccountResetPasswordByPhoneRequest:new(nil)--CS.GameCloud.UCenter.Common.Portable.Models.AppClient.AccountResetPasswordInfo()
    resetPwd_info.AccountName = ""
    resetPwd_info.Phone = phone
    resetPwd_info.Email = ""
    resetPwd_info.NewPassword = new_pwd
    resetPwd_info.PhoneVerificationCode = phone_code
    self.ControllerUCenter:RequestResetPasswordWithPhone(resetPwd_info,
            function(http_statuscode, status, response, error)
                self:onUCenterResetPasswordWithPhone(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:RequestCheckCardAndName(id_card, name)
    local r = CheckCardAndNameRequest:new(nil)
    r.AccountId = self.AccId
    r.CardNo = id_card
    r.Token = self.Token
    r.RealName = name
    self.ControllerUCenter:RequestCheckCardAndName(r,
            function(http_statuscode, status, response, error)
                self:onUCenterCheckIdCard(http_statuscode, status, response, error)
            end)
end

---------------------------------------
function ControllerLogin:OnUCenterPhoneVerificationCode(http_statuscode, status, response, error)
    if (http_statuscode ~= 200) then
    end

    if (status == UCenterResponseStatus.Success) then
        ViewHelper:UiShowInfoSuccess(self.ViewMgr.LanMgr:getLanValue("GetPhoneCodeSuccess"))
    else
        if (error ~= nil) then
            ViewHelper:UiEndWaiting()
            local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(error.code)
            ViewHelper:UiShowInfoFailed(error_msg)
        end
    end
end

---------------------------------------
function ControllerLogin:OnUCenterRegister(http_statuscode, status, response, error)
    if (status == UCenterResponseStatus.Success) then
        local info = self.ControllerMgr.LanMgr:getLanValue("RegisterSuccessful")
        ViewHelper:UiShowInfoSuccess(info)

        self.AccId = response.accountId
        self.Acc = response.accountName

        -- 切换显示为手机登录界面
        local view_login = self.ViewMgr:getView("Login")
        if (view_login ~= nil) then
            view_login:Switch2LoginPhone(self.Phone, self.Password)
        end

        -- 自动请求登录
        self:RequestLogin(response.accountName, self.Password, response.phone, "", "")
    else
        if (error ~= nil) then
            ViewHelper:UiEndWaiting()
            local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(error.code)
            ViewHelper:UiShowInfoFailed(error_msg)
        end
    end
end

---------------------------------------
function ControllerLogin:OnUCenterLogin(http_statuscode, status, response, error)
    if (http_statuscode ~= 200) then
        ViewHelper:UiEndWaiting()
        local error_msg = self.ControllerUCenter:ParseUCenterHttpStatusCode(http_statuscode)
        ViewHelper:UiShowInfoFailed(error_msg)
        --local view_login = self.ViewMgr:getView("Login")
        --view_login:Switch2LoginMain()
        return
    end

    if (status == UCenterResponseStatus.Success) then
        ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("LoginSuccessful"))
        self.AccId = response.accountId
        self.Acc = response.accountName
        self.Token = response.token
        self.Identity = response.identity
        print("OnUCenterLogin")
        -- 保存登录信息
        local infos = LoginAccountInfos:new(nil)
        if (CS.UnityEngine.PlayerPrefs.HasKey(self.LoginAccountInfoKey)) then
            local s = CS.UnityEngine.PlayerPrefs.GetString(self.LoginAccountInfoKey)
            local d = self.ControllerMgr.Json.decode(s)
            infos:setData(d)
        end

        local login_type = 0
        local acc_name = ""
        local phone = ""
        local pwd = ""
        if (c.LoginType == CS.Casinos._eLoginType.Acc) then
            pwd = self.Password
            if (self.RemeberPwd == false) then
                pwd = ""
            end
            login_type = 0
            acc_name = self.Phone
            phone = response.phone
        elseif (c.LoginType == CS.Casinos._eLoginType.Guest) then
            login_type = 1
        elseif (c.LoginType == CS.Casinos._eLoginType.WeiXin) then
            login_type = 2
            acc_name = response.accountName
        end

        infos.LastLoginType = login_type
        local s_login_type = tostring(login_type)
        local a_info = infos.TLoginAccountInfo[s_login_type]
        if a_info == nil then
            a_info = LoginAccountInfo:new(nil)
        end
        a_info.LoginType = login_type
        a_info.AccName = acc_name
        a_info.Phone = phone
        a_info.Pwd = pwd
        infos.TLoginAccountInfo[s_login_type] = a_info

        local t_encode = self.ControllerMgr.Json.encode(infos)
        CS.UnityEngine.PlayerPrefs.SetString(self.LoginAccountInfoKey, t_encode)

        -- DataEye登陆
        CS.DataEye.login(self.Acc .. "_" .. self.AccId)
        c.NetBridge:connectBase(GatewayIp, GatewayPort)
    else
        if (error ~= nil) then
            ViewHelper:UiEndWaiting()
            local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(error.code)
            ViewHelper:UiShowInfoFailed(error_msg)
            local view_login = self.ViewMgr:getView("Login")
            view_login:_switch2LoginMain()
        end
    end
end

---------------------------------------
function ControllerLogin:onUCenterGuestAccess(http_statuscode, status, response, error)
    ViewHelper:UiEndWaiting()
    --local c_login = ControllerLogin:new(nil)
    local c = CS.Casinos.CasinosContext.Instance
    if (status == UCenterResponseStatus.Success) then
        print("onUCenterGuestAccess")
        ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("LoginSuccessful"))
        self.AccId = response.accountId
        self.Acc = response.accountName
        self.Token = response.token

        local infos = LoginAccountInfos:new(nil)
        if (CS.UnityEngine.PlayerPrefs.HasKey(self.LoginAccountInfoKey)) then
            local s = CS.UnityEngine.PlayerPrefs.GetString(self.LoginAccountInfoKey)
            local d = self.ControllerMgr.Json.decode(s)
            infos:setData(d)
        end

        infos.LastLoginType = 1
        local a_info = infos.TLoginAccountInfo["1"]
        if a_info == nil then
            a_info = LoginAccountInfo:new(nil)
        end
        a_info.LoginType = 1
        a_info.AccName = ""
        a_info.Phone = ""
        a_info.Pwd = ""
        infos.TLoginAccountInfo["1"] = a_info

        local t_encode = self.ControllerMgr.Json.encode(infos)
        CS.UnityEngine.PlayerPrefs.SetString(self.LoginAccountInfoKey, t_encode)

        -- DataEye登陆
        --CasinosContext.Instance.CoDataEye.login(c.CoNetMonitor.Acc, c.CoNetMonitor.AccId);
        CS.DataEye.login(self.Acc .. "_" .. self.AccId)
        c.NetBridge:connectBase(GatewayIp, GatewayPort)
    else
        if (error ~= nil) then
            local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(error.code)
            ViewHelper:UiShowInfoFailed(error_msg)
        end
    end
end

---------------------------------------
function ControllerLogin:onUCenterResetPasswordWithPhone(http_statuscode, status, response, error)
    ViewHelper:UiEndWaiting()
    --local c_login = ControllerLogin:new(nil)
    if (status == UCenterResponseStatus.Success) then
        local info = self.ControllerMgr.LanMgr:getLanValue("ResetPwdSuccessful")
        ViewHelper:UiShowInfoSuccess(info)

        self.AccId = response.accountId
        self.Acc = response.accountName

        local view_login = self.ViewMgr:getView("Login")
        view_login:Switch2LoginPhone(self.Phone, self.Password)

        self:RequestLogin(response.accountName, self.Password, response.phone, "", "")
    else
        if (error ~= nil) then
            local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(error.code)
            ViewHelper:UiShowInfoFailed(error_msg)
        end
    end
end

---------------------------------------
function ControllerLogin:onUCenterCheckIdCard(http_statuscode, status, response, error)
    if (response.error_code == 0) then
        self.Identity = response.result.cardNo
        ViewHelper:UiShowInfoSuccess(self.ViewMgr.LanMgr:getLanValue("CheckIdSuccess"))
    else
        if (response ~= nil) then
            ViewHelper:UiEndWaiting()
            --local error_msg = self.ControllerUCenter:ParseUCenterErrorCode(response.code)
            ViewHelper:UiShowInfoFailed(response.reason)
        end
    end
end

---------------------------------------
function ControllerLogin:OnUCenterWechatBind(http_statuscode, status, response, error)
    if (status == UCenterResponseStatus.Success) then
        if (response == UCenterErrorCode.NoError) then
            ViewHelper:UiShowInfoSuccess(self.ViewMgr.LanMgr:getLanValue("BindWeChatSuccess"))
            self.ControllerMgr.RPC:RPC0(CommonMethodType.AccountUpdateDataFromUCenterRequest)
        end
    else
        ViewHelper:UiEndWaiting()
        ViewHelper:UiShowInfoFailed(self.ControllerUCenter:ParseUCenterErrorCode(error.code))
    end
end

---------------------------------------
function ControllerLogin:OnUCenterWechatUnbind(http_statuscode, status, response, error)
    if (status == UCenterResponseStatus.Success) then
        print("OnUCenterWechatUnbind")
        if (response == UCenterErrorCode.NoError) then
            ViewHelper:UiShowInfoSuccess(self.ViewMgr.LanMgr:getLanValue("UnbindWeChatSuccess"))
            local ev = self.ViewMgr:getEv("EvUnBindWeChatSuccess")
            if (ev == nil) then
                ev = EvUnBindWeChatSuccess:new(nil)
            end
            ev.IsSuccess = true
            self.ViewMgr:sendEv(ev)
        end
    else
        ViewHelper:UiEndWaiting()
        ViewHelper:UiShowInfoFailed(self.ControllerUCenter:ParseUCenterErrorCode(error.code))
    end
end

---------------------------------------
function ControllerLogin:OnUCenterGuestConvert(http_statuscode, status, response, error)
    --UiHelperCasinos.UiEndWaiting();
    --if (status == UCenterResponseStatus.Success)
    --{
    --    string info = "游客帐号转正成功";
    --    UiHelperCasinos.UiShowInfoSuccess(info);
    --    c.CoNetMonitor.AccId = response.AccountId;
    --    c.CoNetMonitor.Acc = response.AccountName;
    --    c.PlayerPrefs.ClearLoginGuestInfo();
    --    _requestLogin(response.AccountName, Password);
    --}
    --else if (error != null)
    --{
    --    string error_msg = CasinosContext.Instance.ParseUCenterErrorCode(error.code);
    --    UiHelperCasinos.UiShowInfoFailed(error_msg);
    --}
end

---------------------------------------
function ControllerLogin:OnAccountGatewayConnected()
    print("OnAccountGatewayConnected")

    local login_request = ClientLoginAppRequest:new(nil)
    login_request.acc_id = self.AccId
    login_request.acc_name = self.Acc
    login_request.token = self.Token
    local nick_name = CS.Casinos.LuaHelper.getDeviceName()
    local e = string.find(nick_name, "unknown")
    if (e ~= nil) then
        nick_name = "ac" .. CS.UnityEngine.Random.Range(100000, 999999)
    end

    nick_name = ViewHelper:subStrToTargetLength(nick_name, 9)
    login_request.nick_name = nick_name
    login_request.channel_id = CS.Casinos.CasinosContext.Instance.Config.Channel
    login_request.platform = CS.Casinos.CasinosContext.Instance.Config.Platform
    self.ControllerMgr.RPC:RPC1(CommonMethodType.AccountLoginAppRequest, login_request:getData4Pack())
end

---------------------------------------
function ControllerLogin:OnAccountLoginAppResponse(login_response)
    -- 请求进入游戏世界
    print("OnAccountLoginAppResponse")
    local enterworld_request = ClientEnterWorldRequest:new(nil)
    enterworld_request.acc_id = self.AccId
    enterworld_request.acc_name = self.Acc
    enterworld_request.token = self.Token
    local invite_payerid = "InvitePlayerId"
    if (CS.UnityEngine.PlayerPrefs.HasKey(invite_payerid)) then
        local s = CS.UnityEngine.PlayerPrefs.GetString(invite_payerid)
        print("s   " .. s)
        local t_decode = self.ControllerMgr.Json.decode(s)
        local new = t_decode["IsNew"]
        print("new   " .. tostring(new))
        if new then
            enterworld_request.invite_id = t_decode["PlayerId"]
        end
    end
    self.ControllerMgr.RPC:RPC1(CommonMethodType.AccountEnterWorldRequest, enterworld_request:getData4Pack())
end

---------------------------------------
function ControllerLogin:OnAccountEnterWorldResponse(enterworld_notify1)
    ViewHelper:UiEndWaiting()
    print("OnAccountEnterWorldResponse")
    local enterworld_notify = ClientEnterWorldNotify:new(nil)
    enterworld_notify:setData(enterworld_notify1)

    if (enterworld_notify.result ~= ProtocolResult.Success or enterworld_notify.player_data == nil) then
        -- 进入游戏世界失败，则断开连接
        local s = self.ControllerMgr.LanMgr:getLanValue("EnterGameFailed")
        if (enterworld_notify ~= nil) then
            s = table.concat({ s, "，ErrorCode=", enterworld_notify.result })
        end
        ViewHelper:UiShowInfoFailed(s)

        self:_disconnect()
    else
        local invite_payerid = "InvitePlayerId"
        if (CS.UnityEngine.PlayerPrefs.HasKey(invite_payerid)) then
            local s = CS.UnityEngine.PlayerPrefs.GetString(invite_payerid)
            local t_decode = self.ControllerMgr.Json.decode(s)
            t_decode["IsNew"] = false
            local t_encode = self.ControllerMgr.Json.encode(t_decode)
            CS.UnityEngine.PlayerPrefs.SetString(invite_payerid, t_encode)
        end
        self.ClientEnterWorldNotify = enterworld_notify
        self.ControllerMgr:CreatePlayerControllers(self.ClientEnterWorldNotify.player_data, self.ClientEnterWorldNotify.player_guid)
    end
end

---------------------------------------
function ControllerLogin:OnAccountLogoutNotify(protocal_result)
    if (protocal_result == ProtocolResult.LogoutNewLogin) then
        self.ShowKickOutInfo = true
    end

    self:_disconnect()
end

---------------------------------------
function ControllerLogin:OnAccountUpdateDataFromUCenterNotify(result)
    if result ~= nil then
        local we_chat1 = AttachWechatMp:new(nil)
        we_chat1:setData(result)

        local ev = self.ViewMgr:getEv("EvBindWeChatSuccess")
        if (ev == nil) then
            ev = EvBindWeChatSuccess:new(nil)
        end
        ev.IsSuccess = true
        ev.WeChatOpenId = we_chat1.open_id
        ev.WeChatName = we_chat1.nick_name
        self.ViewMgr:sendEv(ev)
    end
end

---------------------------------------
function ControllerLogin:getClientEnterWorldNotify()
    return self.ClientEnterWorldNotify
end

---------------------------------------
function ControllerLogin:entityPlayerInitDone()
    self.ClientEnterWorldNotify = nil
end

---------------------------------------
function ControllerLogin:OnSocketClose()
    ControllerLogin.ControllerMgr:DestroyPlayerControllers()
    ControllerLogin:_init(false)
    if (ControllerLogin.ShowKickOutInfo) then
        ControllerLogin.ShowKickOutInfo = false
        local info = ControllerLogin.ControllerMgr.LanMgr:getLanValue("AlreadyLogin")
        ViewHelper:UiShowInfoFailed(info)
    end
end

---------------------------------------
function ControllerLogin:canDestroyViewLogin()
    self.AutoLoginTm = 0
    self.AutoLogin = false
    local view_login = self.ViewMgr:getView("Login")
    self.ViewMgr:destroyView(view_login)
end

---------------------------------------
function ControllerLogin:getDeviceInfo()
    local device_info = DeviceInfo:new(nil)--CS.GameCloud.UCenter.Common.Portable.Models.AppClient.DeviceInfo()
    device_info.Id = CS.Casinos.LuaHelper.getDeviceUniqueIdentifier()
    device_info.Model = CS.Casinos.LuaHelper.getDeviceModel()
    device_info.Name = CS.Casinos.LuaHelper.getDeviceName()
    device_info.OperationSystem = CS.Casinos.LuaHelper.getDeviceOperatingSystem()
    device_info.Type = CS.Casinos.LuaHelper.getDevicedeviceType()
    return device_info;
end

---------------------------------------
function ControllerLogin:_disconnect()
    self.AccId = nil
    self.Token = nil
    self.CasinosContext.NetBridge:disconnect()
end

---------------------------------------
function ControllerLogin:_init(is_init)
    -- 显示登录界面
    ViewHelper:UiEndWaiting()

    local acc = ""
    local pwd = ""
    local view_login = self.ViewMgr:createView("Login")
    self.RequestThirdPartyLogin = false
    if (CS.UnityEngine.PlayerPrefs.HasKey(self.LoginAccountInfoKey)) then
        local s = CS.UnityEngine.PlayerPrefs.GetString(self.LoginAccountInfoKey)
        local t_decode = self.ControllerMgr.Json.decode(s)
        local infos = LoginAccountInfos:new(nil)
        infos:setData(t_decode)
        local a_info_last_login = infos.TLoginAccountInfo[tostring(infos.LastLoginType)]

        if is_init then
            self.AutoLogin = true
            --view_login:Switch2Logining()
            if (a_info_last_login.LoginType == 0) then
                acc = a_info_last_login.AccName
                pwd = a_info_last_login.Pwd
                self.RemeberPwd = true
                self.Phone = a_info_last_login.AccName
                self.Password = pwd
                self:RequestLogin("", pwd, a_info_last_login.Phone, "", "")
            elseif (a_info_last_login.LoginType == 1) then
                self:RequestGuestAccess()
            elseif (a_info_last_login.LoginType == 2) then
                self:RequestWechatAutoLogin()
            end
        else
            local a_info_acc_login = infos.TLoginAccountInfo["0"]
            if (a_info_acc_login ~= nil) then
                acc = a_info_acc_login.AccName
                pwd = a_info_acc_login.Pwd
            end
        end
    end

    view_login:SetAccPwd(acc, pwd)

    self.CasinosContext:Play("background", CS.Casinos._eSoundLayer.Background)

    self.ViewMgr:createView("Pool")
end

---------------------------------------
function ControllerLogin:needCheckIdCard()
    if CS.Casinos.CasinosContext.Instance.LoginType == CS.Casinos._eLoginType.Guest then
        return false
    end
    if self.Identity == nil or #self.Identity == 0 then
        return true
    end
    return false
end

---------------------------------------
function ControllerLogin:_clickCheckDataCallBack(bo)
    if bo == false then
        if (self.ControllerUCenter.WWWLogin ~= nil) then
            local info = self.ControllerMgr.LanMgr:getLanValue("Logining")
            ViewHelper:UiShowInfoFailed(info)
        else
            if (self.LoginType == 1) then
                self:RequestGuestAccess()
            end

            if (self.LoginType == 0) then
                self:RequestLogin("", self.Pwd, self.Acc, "", "")
            end

            if (self.LoginType == 2) then
                ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("WeChatLogining"), 10)
                self.RequestThirdPartyLogin = true
            end
        end
    else
        local view_login = self.ViewMgr:getView("Login")
        self.ViewMgr:destroyView(view_login)
        local view_pool = self.ViewMgr:getView("Pool")
        self.ViewMgr:destroyView(view_pool)
    end
end

---------------------------------------
function ControllerLogin:_autoCheckDataCallBack(bo)
    if bo == false then
        if (self.ControllerUCenter.WWWLogin ~= nil) then
            local info = self.ControllerMgr.LanMgr:getLanValue("Logining")
            ViewHelper:UiShowInfoFailed(info)
        else
            if (self.LoginType == 1) then
                self:RequestGuestAccess()
            end

            if (self.LoginType == 0) then
                self:RequestLogin("", self.Pwd, self.Acc, "", "")
            end

            if (self.LoginType == 2) then
                ViewHelper:UiBeginWaiting(self.ControllerMgr.LanMgr:getLanValue("WeChatLogining"), 10)
                self.RequestThirdPartyLogin = true
            end
        end
    end
end

---------------------------------------
ControllerLoginFactory = ControllerFactory:new()

---------------------------------------
function ControllerLoginFactory:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.ControllerName = "Login"
    return o
end

---------------------------------------
function ControllerLoginFactory:createController(controller_mgr, controller_data, guid)
    local controller = ControllerLogin:new(nil, controller_mgr, controller_data, guid)
    controller:onCreate()
    return controller
end