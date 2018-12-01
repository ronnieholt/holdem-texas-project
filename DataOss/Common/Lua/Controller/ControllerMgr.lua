-- Copyright(c) Cragon. All rights reserved.
-- 登录界面，由Context调用ControllerMgr创建Login
-- Controller全部是单实例的
-- Controller始终存在，无需使用者调用Create
require('ControllerBase')

---------------------------------------
ControllerMgr = {
    ViewMgr = nil,
    EventSys = nil,
    Context = Context,
    Json = Context.Json,
    Rpc = Context.Rpc,
    LanMgr = Context.LanMgr,
    TableControllerFactory = {},
    TableController = {},
    TableControllerUpdate = {},
}

---------------------------------------
function ControllerMgr:Create()
    self.EventSys = EventSys:new(nil)
    self.ViewMgr = ViewMgr
end

---------------------------------------
function ControllerMgr:Destroy()
end

---------------------------------------
function ControllerMgr:CreatePlayerControllers(player_data, guid)
    local c_actor = self:CreateController("Actor", player_data, guid)
    local c_player = self:CreateController("Player", nil, guid)
    local c_activity = self:CreateController("Activity", nil, guid)
    local c_bag = self:CreateController("Bag", nil, guid)
    local c_desktoptexas = self:CreateController("DesktopTexas", nil, guid)
    local c_desktoph = self:CreateController("DesktopH", nil, guid)
    local c_grow = self:CreateController("Grow", nil, guid)
    local c_im = self:CreateController("IM", nil, guid)
    local c_lobby = self:CreateController("Lobby", nil, guid)
    local c_lotteryticket = self:CreateController("LotteryTicket", nil, guid)
    local c_marquee = self:CreateController("Marquee", nil, guid)
    local c_ranking = self:CreateController("Ranking", nil, guid)
    local c_trade = self:CreateController("Trade", nil, guid)
    local c_mtt = self:CreateController("MTT", nil, guid)
    local c_reward = self:CreateController("Reward", nil, guid)
    c_actor:OnCreate()
    c_activity:OnCreate()
    c_player:OnCreate()
    c_bag:OnCreate()
    c_desktoptexas:OnCreate()
    c_desktoph:OnCreate()
    c_grow:OnCreate()
    c_im:OnCreate()
    c_lobby:OnCreate()
    c_lotteryticket:OnCreate()
    c_marquee:OnCreate()
    c_ranking:OnCreate()
    c_trade:OnCreate()
    c_mtt:OnCreate()
    c_reward:OnCreate()
end

---------------------------------------
function ControllerMgr:DestroyPlayerControllers()
    local t = {}
    for i, v in pairs(self.TableController) do
        if (i ~= "Login" and i ~= "UCenter") then
            t[i] = v
        end
    end

    for i, v in pairs(t) do
        v:OnDestroy()
        local l = self.TableController[i]
        if (l ~= nil) then
            l = nil
            self.TableController[i] = nil
        end
    end
end

---------------------------------------
function ControllerMgr:CreateController(controller_name, controller_data, guid)
    local controller_factory = self.TableControllerFactory[controller_name]
    if (controller_factory == nil) then
        return nil
    end
    local controller = controller_factory:CreateController(self, controller_data, guid)
    self.TableController[controller_name] = controller
    return controller
end

---------------------------------------
function ControllerMgr:DestroyController(is_kickout)
    for k, v in pairs(self.TableController) do
        if (v ~= nil) then
            local controller_name = v.ControllerName
            v:OnDestroy()
            self.TableController[controller_name] = nil
        end
    end
    --ControllerMgr.TableController = {}
end

---------------------------------------
function ControllerMgr:RegController(controller_name, controller_factory)
    if (controller_factory ~= nil) then
        self.TableControllerFactory[controller_name] = controller_factory
    end
end

---------------------------------------
function ControllerMgr:GetController(controller_name)
    local controller = self.TableController[controller_name]
    return controller
end

---------------------------------------
function ControllerMgr:BindEvListener(ev_name, ev_listener)
    if (ControllerMgr.EventSys ~= nil) then
        ControllerMgr.EventSys:BindEvListener(ev_name, ev_listener)
    end
end

---------------------------------------
function ControllerMgr:UnbindEvListener(ev_listener)
    if (ControllerMgr.EventSys ~= nil) then
        ControllerMgr.EventSys:UnbindEvListener(ev_listener)
    end
end

---------------------------------------
function ControllerMgr:GetEv(ev_name)
    local ev = nil
    if (ControllerMgr.EventSys ~= nil) then
        ev = ControllerMgr.EventSys:GetEv(ev_name)
    end
    return ev
end

---------------------------------------
function ControllerMgr:SendEv(ev)
    if (ControllerMgr.EventSys ~= nil) then
        ControllerMgr.EventSys:SendEv(ev)
    end
end

---------------------------------------
function ControllerMgr:PackData(data)
    local p_datas = self.RPC:PackData(data)
    return p_datas
end

---------------------------------------
function ControllerMgr:UnpackData(data)
    local p_datas = self.RPC:UnpackData(data)
    return p_datas
end