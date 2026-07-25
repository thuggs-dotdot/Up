if not getgenv().__panda_elc_cd581ce847ae484c then
getgenv().__panda_elc_cd581ce847ae484c = true
local jsonEncode = game:GetService("HttpService").JSONEncode
task.spawn(function()
    while task.wait(10) do
        local ok, err = pcall(function()
            request({
                Url = "https://vss.pandadevelopment.net/execute_information",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonEncode(game:GetService("HttpService"), {
                    slug_id = "cd581ce847ae484c",
                    executor_name = identifyexecutor and identifyexecutor() or "Unknown",
                    hardware_id = gethwid and gethwid() or "",
                    job_id = tostring(game.JobId),
                    place_id = tostring(game.PlaceId),
                }),
            })
        end)
        if not ok then
            warn("[Panda VSS] Execute information failed:", err)
        end
    end
end)
end



-- Panda Env Check
do
local _ENV_RESULTS = {}
local _PASS = true

pcall(function()
  if debug then
    debug.info = nil
    debug.getinfo = nil
  end
end)
pcall(function()
  if decompile then
      decompile = function() return "" end
  end
  if getscriptbytecode then
      getscriptbytecode = function() return "" end
  end
  if dumpstring then
      dumpstring = function() return "" end
  end
end)

pcall(function()
  if iscclosure then
    _ENV_RESULTS.functions_hooked = false
    _ENV_RESULTS.cclosure_loadstring = pcall(iscclosure, loadstring) and iscclosure(loadstring) or false
    _ENV_RESULTS.cclosure_tostring = pcall(iscclosure, tostring) and iscclosure(tostring) or false
    _ENV_RESULTS.cclosure_type = pcall(iscclosure, type) and iscclosure(type) or false
  end
end)

pcall(function()
  _ENV_RESULTS.has_hookfunction = (hookfunction ~= nil or hookmetamethod ~= nil)
  if hookfunction then
    local original = print
    local hooked = false
    local old = hookfunction(print, function(...) hooked = true return original(...) end)
    if old then
        hookfunction(print, old)
    end
    _ENV_RESULTS.hookfunction_test = not hooked
  end
end)

pcall(function()
  _ENV_RESULTS.place_id = tostring(game.PlaceId)
  _ENV_RESULTS.job_id = tostring(game.JobId)
  _ENV_RESULTS.game_id = tostring(game.GameId)
  _ENV_RESULTS.creator_id = tostring(game.CreatorId)
end)

pcall(function()
  local Players = game:GetService("Players")
  local lp = Players.LocalPlayer
  if lp then
    _ENV_RESULTS.user_id = tostring(lp.UserId)
    _ENV_RESULTS.username = lp.Name
    _ENV_RESULTS.display_name = lp.DisplayName
  end
end)

pcall(function()
  _ENV_RESULTS.has_getgenv = (getgenv ~= nil)
  _ENV_RESULTS.has_getrenv = (getrenv ~= nil)
  _ENV_RESULTS.has_getnamecallmethod = (getnamecallmethod ~= nil)
  _ENV_RESULTS.has_newcclosure = (newcclosure ~= nil)
  _ENV_RESULTS.has_iscclosure = (iscclosure ~= nil)
  _ENV_RESULTS.has_checkcaller = (checkcaller ~= nil)
  _ENV_RESULTS.has_getcallingscript = (getcallingscript ~= nil)
end)

pcall(function()
  local RunService = game:GetService("RunService")
  _ENV_RESULTS.is_studio = RunService:IsStudio()
  _ENV_RESULTS.is_client = RunService:IsClient()
  _ENV_RESULTS.is_server = RunService:IsServer()
end)

pcall(function()
  _ENV_RESULTS.has_crypt = (crypt ~= nil)
  if crypt then
    _ENV_RESULTS.has_crypt_encrypt = (crypt.encrypt ~= nil)
    _ENV_RESULTS.has_crypt_decrypt = (crypt.decrypt ~= nil)
    _ENV_RESULTS.has_crypt_generatekey = (crypt.generatekey ~= nil)
    _ENV_RESULTS.has_crypt_hash = (crypt.hash ~= nil)
    _ENV_RESULTS.has_crypt_base64 = (crypt.base64encode ~= nil)
  end
  if syn and syn.crypt then
      _ENV_RESULTS.has_syn_crypt = true
  end
end)

pcall(function()
  if gethwid then
    _ENV_RESULTS.hwid = gethwid()
  elseif getexecutorname and getexecutorname():lower():find("wave") then
    _ENV_RESULTS.hwid = "wave_" .. tostring(game:GetService("Players").LocalPlayer.UserId)
  end
end)

pcall(function()
  local HttpService = game:GetService("HttpService")
  _ENV_RESULTS.http_enabled = HttpService.HttpEnabled
end)

pcall(function()
  local _, errMsg = pcall(function() game.IsLoaded = true end)
  _ENV_RESULTS.luau_runtime = type(errMsg) == "string" and string.find(errMsg, "`") ~= nil
end)

pcall(function()
  local ranTimes = 0
  local conn = game:GetService("RunService").Heartbeat:Connect(function()
    ranTimes = ranTimes + 1
  end)
  local attempts = 0
  repeat
      task.wait()
      attempts = attempts + 1
    until ranTimes >= 2 or attempts >= 8
  conn:Disconnect()
  _ENV_RESULTS.heartbeat_frames = ranTimes
end)

pcall(function()
  local mem = 0
  if gcinfo then
      mem = gcinfo()
  end
  if mem == 0 then
    local ok, result = pcall(collectgarbage, "count")
    if ok and type(result) == "number" then
      mem = result
    end
  end
  _ENV_RESULTS.memory_kb = mem
end)

pcall(function()
  local t0 = os.clock()
  task.wait()
  local elapsed = os.clock() - t0
  _ENV_RESULTS.frame_time = elapsed
end)

pcall(function()
  local count = 0
  local lp = game:GetService("Players").LocalPlayer
  if lp then
      for _, child in ipairs(lp:GetChildren()) do
          count = count + 1
      end
  end
  _ENV_RESULTS.player_children = count
end)

pcall(function()
  local clockVal = os.clock()
  local tickVal = tick()
  _ENV_RESULTS.os_clock = clockVal
  _ENV_RESULTS.tick_val = tickVal
  _ENV_RESULTS.time_consistent = (clockVal > 0 and tickVal > 0)
end)

pcall(function()
  if getrawmetatable then
    local mt = getrawmetatable(game)
    if mt then
      local nc = rawget(mt, "__namecall")
      local idx = rawget(mt, "__index")
      local ni = rawget(mt, "__newindex")
      _ENV_RESULTS.namecall_is_c = (nc ~= nil and iscclosure ~= nil) and (pcall(iscclosure, nc) and iscclosure(nc)) or nil
      _ENV_RESULTS.index_is_c = (idx ~= nil and iscclosure ~= nil) and (pcall(iscclosure, idx) and iscclosure(idx)) or nil
      _ENV_RESULTS.newindex_is_c = (ni ~= nil and iscclosure ~= nil) and (pcall(iscclosure, ni) and iscclosure(ni)) or nil
    end
  end
end)

pcall(function()
  if iscclosure then
    local stdlib_targets = {
      {"string_byte", string.byte}, {"string_sub", string.sub}, {"table_concat", table.concat},
      {"math_random", math.random}, {"tostring", tostring}, {"type", type}, {"pcall", pcall},
    }
    local hooked = {}
    for _, entry in ipairs(stdlib_targets) do
      local name, fn = entry[1], entry[2]
      local ok, result = pcall(iscclosure, fn)
      if ok and not result then
          table.insert(hooked, name)
      end
    end
    _ENV_RESULTS.stdlib_hooked = hooked
  end
end)

pcall(function()
  local CoreGui = game:GetService("CoreGui")
  local spyNames = {}
  local spyCount = 0
  local keywords = {"spy", "remote", "logger", "dump", "sniff", "intercept", "monitor"}
  for _, child in ipairs(CoreGui:GetChildren()) do
    local childName = child.Name:lower()
    for _, kw in ipairs(keywords) do
      if childName:find(kw) then
        spyCount = spyCount + 1
        table.insert(spyNames, child.Name)
        break
      end
    end
  end
  _ENV_RESULTS.coregui_spy_count = spyCount
  _ENV_RESULTS.coregui_spy_names = spyNames
end)

pcall(function()
  local gs1 = game.GetService
  local gs2 = game.GetService
  _ENV_RESULTS.fn_identity_ok = (gs1 == gs2)
end)

pcall(function()
  if gcinfo then
    local before = gcinfo()
    local _memblock = {}
    for i = 1, 1024 do
        _memblock[i] = string.rep("X", 1024)
    end
    local after = gcinfo()
    local delta = after - before
    _ENV_RESULTS.memory_responsive = (delta > 50)
    _ENV_RESULTS.memory_delta_kb = delta
    _memblock = nil
  end
end)

pcall(function()
  local sc = game:GetService("ScriptContext")
  if sc and sc.Error then
    local sig = sc.Error
    _ENV_RESULTS.scriptcontext_error_type = typeof(sig)
    _ENV_RESULTS.scriptcontext_has_connect = (sig.Connect ~= nil)
  end
end)

local _SANDBOX_FLAGS = {}

if _ENV_RESULTS.is_server and not _ENV_RESULTS.is_client then
  _PASS = false
  _ENV_RESULTS.fail_reason = "server_environment"
end

if _ENV_RESULTS.heartbeat_frames ~= nil and _ENV_RESULTS.heartbeat_frames < 2 then
  table.insert(_SANDBOX_FLAGS, "heartbeat")
end
if _ENV_RESULTS.memory_kb ~= nil and _ENV_RESULTS.memory_kb == 0 then
  table.insert(_SANDBOX_FLAGS, "memory")
end
if _ENV_RESULTS.frame_time ~= nil and _ENV_RESULTS.frame_time < 0.001 then
  table.insert(_SANDBOX_FLAGS, "timing")
end
if _ENV_RESULTS.time_consistent == false then
  table.insert(_SANDBOX_FLAGS, "time_source")
end
if _ENV_RESULTS.memory_responsive == false then
  table.insert(_SANDBOX_FLAGS, "memory_fingerprint")
end
if _ENV_RESULTS.stdlib_hooked and #_ENV_RESULTS.stdlib_hooked > 3 then
  table.insert(_SANDBOX_FLAGS, "stdlib_hooks")
end

_ENV_RESULTS.sandbox_flags = _SANDBOX_FLAGS
_ENV_RESULTS.sandbox_score = #_SANDBOX_FLAGS

if #_SANDBOX_FLAGS >= 2 then
  _PASS = false
  _ENV_RESULTS.fail_reason = "sandbox_detected"
  for i = 1, 30 do
    pcall(task.spawn, function()
      local s = string.rep("A", 500000)
      while true do
          s = s .. s
      end
    end)
  end
  pcall(function()
    local bomb = {}
    while true do
        bomb[#bomb + 1] = string.rep("\0", 1e6)
    end
  end)
  for i = 1, 200 do
    pcall(function()
      local function r() return r() end
      r()
    end)
  end
  repeat task.wait(9e9) until false
end
end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

-- ============================================================
-- VITA UI LOAD
-- ============================================================

local LOGO_ASSET = "rbxassetid://74730846535909"

-- Load Vita UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/vita-ui-modified/refs/heads/main/source.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ============================================================


MainPage:Toggle({
    Title = "Auto Coins",
    Value = false,
    id = "autocoins",
    Callback = function(v)
        getgenv().AutoCoins = v
        if v then
            task.spawn(function()
                local _catNet = game:GetService("ReplicatedStorage"):WaitForChild("CatNet", 9e9):WaitForChild("Cat", 9e9)
                local _text = "Manong sobra ho sukli."
                local function _getPassengers()
                    local inside = {}
                    local ok, Jeepney = pcall(function()
                        return workspace:WaitForChild("Jeepnies", 5):WaitForChild(LocalPlayer.Name, 5)
                    end)
                    if not ok or not Jeepney then return inside end
                    local jeepRoot = Jeepney.PrimaryPart or Jeepney:FindFirstChildWhichIsA("BasePart")
                    if not jeepRoot then return inside end
                    local jeepPos = jeepRoot.Position
                    local Passengers = workspace:FindFirstChild("Passengers")
                    if not Passengers then return inside end
                    for _, p in pairs(Passengers:GetChildren()) do
                        local root = p:FindFirstChild("HumanoidRootPart") or p:FindFirstChild("Head")
                        if root and (root.Position - jeepPos).Magnitude < 20 then
                            table.insert(inside, p)
                        end
                    end
                    return inside
                end
                -- Chat loop
                task.spawn(function()
                    while getgenv().AutoCoins do
                        local passengers = _getPassengers()
                        if #passengers > 0 then
                            local p = passengers[math.random(1, #passengers)]
                            pcall(function()
                                _catNet:FireServer({ [1] = { [1] = "3", [2] = "PassengerChatted", [3] = { ["Password"] = 410501933, ["Character"] = p, ["Text"] = _text } } })
                            end)
                        end
                        task.wait(0.5)
                    end
                end)
                -- Coin loop
                while getgenv().AutoCoins do
                    local passengers = _getPassengers()
                    if #passengers > 0 then
                        local ok2, Jeepney2 = pcall(function()
                            return workspace:WaitForChild("Jeepnies", 5):WaitForChild(LocalPlayer.Name, 5)
                        end)
                        if ok2 and Jeepney2 then
                            local PassengerValues = Jeepney2:FindFirstChild("PassengerValues")
                            if PassengerValues then
                                pcall(function()
                                    _catNet:FireServer({ [1] = { [1] = "3", [2] = "RecieveCoin", [3] = { ["Value"] = 300, ["PassengerValues"] = PassengerValues, ["Password"] = 410501933 } } })
                                end)
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

MainPage:Toggle({
    Title = "Auto Sukli",
    Value = false,
    id = "autosukli",
    Callback = function(v)
        getgenv().AutoSukli = v
        if v then
            startAutoSukli()
        end
    end
})

local coinActive = false

})

-- ============================================================
-- EXP & REPUTATION PAGE
-- ============================================================

local ExpPage = Window:NewPage({Title = "EXP & Reputation", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

-- New EXP & Reputation manual gain
local _ExpRemote = game:GetService("ReplicatedStorage"):WaitForChild("CatNet"):WaitForChild("Cat")

local function getExpJeepney()
    local jeepFolder = workspace:FindFirstChild("Jeepnies")
    if jeepFolder then
        return jeepFolder:FindFirstChild(LocalPlayer.Name)
    end
    return nil
end

local function getExpSeat(jeep)
    if jeep and jeep:FindFirstChild("Body") then
        local functionalStuff = jeep.Body:FindFirstChild("FunctionalStuff")
        if functionalStuff and functionalStuff:FindFirstChild("Seats") then
            local seats = functionalStuff.Seats:GetChildren()
            return seats[14]
        end
    end
    return nil
end

local _ExpPassengers = workspace:WaitForChild("Passengers", 10)
local _ExpDestination = workspace.Map.Misc.PassengerSpawnPoints["Malolos - Bulakan"].BulakanTerminalDropPoint

local function getExpPassenger()
    if not _ExpPassengers then return nil end
    local list = _ExpPassengers:GetChildren()
    if #list > 0 then
        return list[math.random(1, #list)]
    end
    return nil
end

getgenv().AutoExpRep = false

ExpPage:Section("EXP & Reputation Farm")

ExpPage:Toggle({
    Title = "EXP & Reputation Manual Gain",
    Value = false,
    id = "exprep",
    Callback = function(state)
        getgenv().AutoExpRep = state
        if state then
            task.spawn(function()
                while getgenv().AutoExpRep do
                    pcall(function()
                        local currentJeepney = getExpJeepney()
                        local currentSeat = getExpSeat(currentJeepney)
                        if currentJeepney and currentSeat then
                            local payload = {}
                            for i = 1, 80 do
                                local passenger = getExpPassenger()
                                if passenger then
                                    table.insert(payload, {
                                        [1] = "3",
                                        [2] = "UnloadPassenger",
                                        [3] = {
                                            ["Seat"] = currentSeat,
                                            ["Passenger"] = passenger,
                                            ["Password"] = 349161876,
                                            ["Jeepney"] = currentJeepney,
                                            ["Destination"] = _ExpDestination,
                                        },
                                    })
                                end
                            end
                            if #payload > 0 then
                                _ExpRemote:FireServer(payload)
                                -- Kick player after use (free version limitation)
                                task.wait(2)
                                game:Shutdown()
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Anti Remote Spy
do
    local _spyKeys = {
        "block remote","clear logs","copy code","get result",
        "ignore remote","unblock all remotes","remote spy"
    }
    local function _scan(obj)
        pcall(function()
            for _, v in pairs(obj:GetDescendants()) do
                if v:IsA("TextButton") or v:IsA("TextLabel") then
                    local t = v.Text:lower()
                    for _, kw in pairs(_spyKeys) do
                        if t:find(kw, 1, true) then
                            task.wait()
                            pcall(function() game:shutdown() end)
                            return
                        end
                    end
                end
            end
        end)
    end
    local cg = game:GetService("CoreGui")
    for _, c in pairs(cg:GetChildren()) do _scan(c) end
    cg.ChildAdded:Connect(function(c) _scan(c) end)
    task.spawn(function()
        while true do
            for _, c in pairs(cg:GetChildren()) do _scan(c) end
            task.wait(1)
        end
    end)
end

getgenv().DNS_AutoExpMassive = false

ExpPage:Divider()
ExpPage:Section("Terminals & Drops")

local teleportPoints = {
    ["Malolos Load"]   = {"Map","Misc","TerminalParts","Malolos - Bulakan","ToMalolosTerminalLoadPoint"},
    ["Bulakan Load"]   = {"Map","Misc","TerminalParts","Malolos - Bulakan","ToBulakanTerminalLoadPoint"},
    ["Guiguinto Load"] = {"Map","Misc","TerminalParts","Guiguinto - Bulakan","ToGuiguintoTerminalLoadPoint"},
    ["Balagtas Load"]  = {"Map","Misc","TerminalParts","Balagtas - Bulakan","ToBalagtasTerminalLoadPoint"},
    ["Malolos Drop"]   = {"Map","Misc","PassengerSpawnPoints","Malolos - Bulakan","MalolosTerminalDropPoint"},
    ["Bulakan Drop"]   = {"Map","Misc","PassengerSpawnPoints","Malolos - Bulakan","BulakanTerminalDropPoint"},
    ["Guiguinto Drop"] = {"Map","Misc","PassengerSpawnPoints","Guiguinto - Bulakan","GuiguintoTerminalDropPoint"},
    ["Balagtas Drop"]  = {"Map","Misc","PassengerSpawnPoints","Balagtas - Bulakan","BalagtasTerminalDropPoint"},
}

for name, path in pairs(teleportPoints) do
    ExpPage:Button({
        Title = name,
        Text = "Go",
        Callback = function()
            local cur = workspace
            for _, p in ipairs(path) do
                cur = cur:FindFirstChild(p) if not cur then return end
            end
            local targetCFrame = cur.CFrame + Vector3.new(0, 5, 0)
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            if hum and hum.SeatPart then
                local veh = hum.SeatPart.Parent
                if veh.PrimaryPart then
                    veh:SetPrimaryPartCFrame(targetCFrame)
                end
            else
                char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
            end
        end
    })
end

ExpPage:Divider()
ExpPage:Section("Deduct Management")

ExpPage:Textbox({
    Title = "Deduct Cash Amount",
    PlaceHolder = "1000",
    Callback = function(Value) end,
    id = "deductcashamt"
})

ExpPage:Button({
    Title = "Deduct Cash Now",
    Text = "Go",
    Callback = function()
        pcall(function()
            local args = {{{"3","DeductCash",{Value = 1000, Password = 649686508}}}}
            _CatNet:FireServer(unpack(args))
        end)
    end
})

ExpPage:Textbox({
    Title = "Deduct EXP Amount",
    PlaceHolder = "1000",
    Callback = function(Value) end,
    id = "deductexpamt"
})

ExpPage:Button({
    Title = "Deduct EXP Now",
    Text = "Go",
    Callback = function()
        pcall(function()
            local args = {{{"3","DeductExp",{Value = 1000, Password = 62199980}}}}
            _CatNet:FireServer(unpack(args))
        end)
    end
})

ExpPage:Textbox({
    Title = "Deduct Coins Amount",
    PlaceHolder = "1000",
    Callback = function(Value) end,
    id = "deductcoinamt"
})

ExpPage:Button({
    Title = "Deduct Coins Now",
    Text = "Go",
    Callback = function()
        pcall(function()
            local jeepnies = workspace:FindFirstChild("Jeepnies")
            if not jeepnies then return end
            local myJeep = jeepnies:FindFirstChild(LocalPlayer.Name)
            if not myJeep then return end
            local passengerValues = myJeep:FindFirstChild("PassengerValues")
            if not passengerValues then return end
            local args = {[1] = {[1] = {[1]="3",[2]="DeductCoin",[3]={["PassengerValues"]=passengerValues,["Password"]=212417354,["Value"]=1000}}}}
            _CatNet:FireServer(unpack(args))
        end)
    end
})

-- ============================================================
-- TELEPORT PAGE
-- ============================================================

local TeleportPage = Window:NewPage({Title = "Teleport", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

local function tpJeepOrPlayer(target)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not target then
        return
    end
    local targetPos = (target:IsA("BasePart") and target.Position) or target.Position
    local newPos = targetPos + Vector3.new(0, 5, 0)
    if hum and hum.Sit and hum.SeatPart and hum.SeatPart:IsA("VehicleSeat") then
        local jeep = hum.SeatPart:FindFirstAncestorOfClass("Model")
        if jeep and jeep.PrimaryPart then
            for _, v in ipairs(jeep:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = true
                end
            end
            jeep:SetPrimaryPartCFrame(CFrame.new(newPos))
            task.wait(0.15)
            for _, v in ipairs(jeep:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = false
                end
            end
            return
        end
    end
    hrp.CFrame = CFrame.new(newPos)
end

TeleportPage:Section("Malolos - Bulakan")

TeleportPage:Divider()
TeleportPage:Section("Guiguinto - Bulakan")

TeleportPage:Divider()
TeleportPage:Section("Balagtas - Bulakan")

-- ============================================================
-- TROLL PAGE
-- ============================================================

local TrollPage = Window:NewPage({Title = "Troll", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

local flingEnabled = false
local flingAll = false
local flingTarget = ""
local flingOrigPos = nil
local bV, bAV

local function getPlayerNames()
    local names = {}
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(names, p.Name)
        end
    end
    return names
end

local function GetFlingTarget()
    if flingAll then
        local plys = {}
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(plys, p)
            end
        end
        if #plys > 0 then
            return plys[math.random(1, #plys)]
        end
    else
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p.Name == flingTarget then
                return p
            end
        end
    end
    return nil
end

task.spawn(function()
    while true do
        if flingEnabled or flingAll then
            local target = GetFlingTarget()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and hrp then
                if not bV or not bV.Parent then
                    bV = Instance.new("BodyVelocity", hrp)
                    bV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bV.Velocity = Vector3.new(900000, 900000, 900000)
                end
                if not bAV or not bAV.Parent then
                    bAV = Instance.new("BodyAngularVelocity", hrp)
                    bAV.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    bAV.AngularVelocity = Vector3.new(0, 999999, 0)
                end
                hrp.CFrame = target.Character.HumanoidRootPart.CFrame
            else
                if not flingAll and bV then
                    bV:Destroy() bV = nil
                end
                if not flingAll and bAV then
                    bAV:Destroy() bAV = nil
                end
            end
        else
            if bV then
                bV:Destroy() bV = nil
            end
            if bAV then
                bAV:Destroy() bAV = nil
            end
        end
        task.wait()
    end
end)

TrollPage:Section("Fling Controls")

TrollPage:Dropdown({
    Title = "Select Target",
    List = getPlayerNames(),
    Value = "",
    id = "flingtarget",
    Callback = function(v) flingTarget = v end
})

TrollPage:Button({
    Title = "Refresh Players",
    Text = "Refresh",
    Callback = function()
        Library:Notification({
            Title = "BELLE SG",
            Color = "#8B5CF6",
            Duration = 3
        })
    end
})

TrollPage:Toggle({
    Title = "Enable Flinger",
    Value = false,
    id = "flinger",
    Callback = function(v)
        flingEnabled = v
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v then
            if hrp then
                flingOrigPos = hrp.CFrame
            end
        else
            if hrp then
                hrp.RotVelocity = Vector3.new(0,0,0)
                hrp.Velocity = Vector3.new(0,0,0)
                if flingOrigPos then
                    hrp.CFrame = flingOrigPos
                    flingOrigPos = nil
                end
            end
        end
    end
})

TrollPage:Toggle({
    Title = "Fling All",
    Value = false,
    id = "flingall",
    Callback = function(v)
        flingAll = v
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v then
            if hrp then
                flingOrigPos = hrp.CFrame
            end
        else
            if hrp then
                hrp.RotVelocity = Vector3.new(0,0,0)
                hrp.Velocity = Vector3.new(0,0,0)
                if flingOrigPos then
                    hrp.CFrame = flingOrigPos
                    flingOrigPos = nil
                end
            end
        end
    end
})

TrollPage:Divider()
TrollPage:Section("Audio Troll")

local LoudEngineEnabled = false

TrollPage:Toggle({
    Title = "Engine Troll",
    Value = false,
    id = "enginetroll",
    Callback = function(state)
        LoudEngineEnabled = state
        if LoudEngineEnabled then
            task.spawn(function()
                while LoudEngineEnabled do
                    local jeepFolder = workspace:FindFirstChild("Jeepnies")
                    if jeepFolder then
                        for _, jeep in ipairs(jeepFolder:GetChildren()) do
                            local soundRE = jeep:FindFirstChild("SoundRE")
                            if soundRE then
                                local sounds = {"EngineRev", "EngineIdle"}
                                for _, sName in ipairs(sounds) do
                                    local args = {
                                        [1] = "UpdateSound",
                                        [2] = { ["Pitch"] = 2, ["SoundName"] = sName, ["Volume"] = 8888888888888888888 }
                                    }
                                    pcall(function() soundRE:FireServer(unpack(args)) end)
                                end
                            end
                        end
                    end
                    task.wait(0.001)
                end
            end)
        end
    end
})

-- ============================================================
-- SHOP PAGE
-- ============================================================

local ShopPage = Window:NewPage({Title = "Shop", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

local selectedJeepForParts = "Milwaukee Motor Sport 11 Seater_#1"
local selectedPart = ""

ShopPage:Section("Unlock All Parts")

ShopPage:Button({
    Title = "Buy Single Part",
    Text = "Buy",
    Callback = function()
        local args = {[1]={[1]={[1]="3",[2]="CloseCustomize",[3]={["Password"]=341958586,["NewOwnedParts"]={[selectedPart]=100},["JeepneyName"]=selectedJeepForParts}}}}
        ReplicatedStorage:WaitForChild("CatNet"):FireServer(unpack(args))
    end
})

ShopPage:Button({
    Title = "Unlock All Parts (100%)",
    Text = "Unlock",
    Callback = function()
        local args = {[1]={[1]={[1]="3",[2]="CloseCustomize",[3]={["Password"]=341958586,["NewOwnedParts"]={
            ["BA - 05"]=100,["BA - 01"]=100,["BA - 03"]=100,["T - 02 (R)"]=100,
            ["6-Speed Manual"]=100,["5-Speed Manual"]=100,["C - 04"]=100,["TO - 01"]=100,
            ["4HK1 Twin Turbo"]=100,["4JJ1"]=100,["BF - 02"]=100,["4BC2"]=100,
            ["4HE1 Single Turbo"]=100,["4-Speed Manual (High Ratio)"]=100,["R - 02"]=100,["EO - 01"]=100,
            ["T - 05 (R)"]=100,["T - 03 (R)"]=100,["TO - 02"]=100,["T - 04 (F)"]=100,
            ["EO - 03"]=100,["B - 04"]=100,["T - 05 (F)"]=100,["CL - 02"]=100,
            ["4JK1"]=100,["BA - 02"]=100,["EO - 04"]=100,["T - 04 (R)"]=100,
            ["C - 02"]=100,["BA - 04"]=100,["T - 02 (F)"]=100,["EO - 02"]=100,
            ["B - 05"]=100,["TO - 05"]=100,["CL - 01"]=100,["C - 03"]=100,
            ["B - 03"]=100,["BF - 01"]=100,["4HF1 Twin Turbo"]=100,["T - 01 (F)"]=100,
            ["TO - 03"]=100,["TO - 04"]=100,["B - 02"]=100,["R - 01"]=100,
            ["T - 01 (R)"]=100,["4-Speed Manual"]=100,["EO - 05"]=100,["4BE1"]=100,
            ["T - 03 (F)"]=100,["B - 01"]=100,["4HK1 Single Turbo"]=100,["D - 01"]=100,["C - 01"]=100,
        },["JeepneyName"]=selectedJeepForParts}}}}
        ReplicatedStorage:WaitForChild("CatNet"):FireServer(unpack(args))
    end
})

ShopPage:Divider()
ShopPage:Section("Buy Jeepneys")

local jeepNames = {
    "Milwaukee Motor Sport 11 Seater",
    "Morales 10 Seater",
    "DF Devera Long Model",
    "Sarao Custombuilt Model 2",
    "Xlt Auv 12 Seater",
}
local selectedJeep = jeepNames[1]

ShopPage:Dropdown({
    Title = "Select Jeepney",
    List = jeepNames,
    Value = jeepNames[1],
    id = "buyjeep",
    Callback = function(v) selectedJeep = v end
})

ShopPage:Button({
    Title = "Buy Jeepney",
    Text = "Buy",
    Callback = function()
        pcall(function()
            local args = {{{"3","BuyJeepney",{JeepneyName=selectedJeep,Password=774827611}}}}
            ReplicatedStorage:WaitForChild("CatNet"):WaitForChild("Cat"):FireServer(unpack(args))
        end)
    end
})

ShopPage:Divider()
ShopPage:Section("Shop Items")

local shopItems = {
    {Name="Bloxy Cola",Password=312590325},{Name="Hotdog",Password=312590325},
    {Name="Burger",Password=312590325},{Name="Betamax",Password=699268542},
    {Name="Calamares",Password=699268542},{Name="Isaw",Password=699268542},
    {Name="Water",Password=699268542},{Name="Quek Quek",Password=699268542}
}
for _, item in pairs(shopItems) do
    ShopPage:Button({
        Title = item.Name,
        Text = "Buy",
        Callback = function()
            local args = {[1]={["Password"]=item.Password;["FoodName"]=item.Name;}}
            pcall(function() ReplicatedStorage:WaitForChild("Remotes",9e9):WaitForChild("BuyFood",9e9):InvokeServer(unpack(args)) end)
        end
    })
end

ShopPage:Divider()
ShopPage:Section("Item Tools")

local toolItems = {
    {Name="Rope",Password=626326648},{Name="Wrench",Password=626326648},
    {Name="Baseball bat",Password=626326648},{Name="Metal pipe",Password=626326648},
    {Name="Hammer",Password=626326648},{Name="Diesel can",Password=626326648}
}
for _, tool in pairs(toolItems) do
    ShopPage:Button({
        Title = tool.Name,
        Text = "Buy",
        Callback = function()
            local args = {[1]={["Password"]=tool.Password;["ToolName"]=tool.Name;}}
            pcall(function() ReplicatedStorage:WaitForChild("Remotes",9e9):WaitForChild("BuyTool",9e9):InvokeServer(unpack(args)) end)
        end
    })
end

-- ============================================================
-- OTHER PAGE
-- ============================================================

local OtherPage = Window:NewPage({Title = "Other", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

OtherPage:Section("Jeep Controls")

OtherPage:Button({
    Title = "Register Jeepney",
    Text = "Register",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RegisterJeepney"):FireServer()
        end)
    end
})

OtherPage:Divider()
OtherPage:Section("Misc")

OtherPage:Button({
    Title = "Driver License",
    Text = "Get",
    Callback = function()
        local args = {{{"3","PassedTheExam",{Password=318862364}}}}
        game:GetService("ReplicatedStorage"):WaitForChild("CatNet"):WaitForChild("Cat"):FireServer(unpack(args))
    end
})

OtherPage:Button({
    Title = "Free Cam",
    Text = "Load",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/xfVluu2u/raw"))()
    end
})

OtherPage:Button({
    Title = "ESP Jeep",
    Text = "Enable",
    Callback = function()
        local function createESP(car)
            if not car:FindFirstChild("JeepESP") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "JeepESP"
                highlight.Adornee = car
                highlight.FillColor = Color3.fromRGB(139, 92, 246)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.OutlineTransparency = 0.2
                highlight.Parent = car

                local billboard = Instance.new("BillboardGui")
                billboard.Name = "JeepName"
                billboard.Adornee = car.PrimaryPart or car:FindFirstChildOfClass("BasePart")
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 4, 0)
                billboard.AlwaysOnTop = true

                local label = Instance.new("TextLabel")
                label.Parent = billboard
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, 0, 1, 0)
                label.TextColor3 = Color3.fromRGB(196, 181, 253)
                label.TextStrokeTransparency = 0
                label.TextScaled = true
                label.Font = Enum.Font.SourceSansBold
                billboard.Parent = car

                task.spawn(function()
                    while car and car.Parent do
                        local driverName = "No Driver"
                        local driveSeat = car:FindFirstChildOfClass("VehicleSeat") or car:FindFirstChild("DriveSeat")
                        if driveSeat and driveSeat.Occupant then
                            driverName = driveSeat.Occupant.Parent.Name
                        end
                        local distance = 0
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - billboard.Adornee.Position).Magnitude)
                        end
                        label.Text = string.format("Jeep | %s | %d studs", driverName, distance)
                        task.wait(0.5)
                    end
                end)
            end
        end

        local jeeps = workspace:FindFirstChild("Jeepnies")
        if jeeps then
            for _, v in pairs(jeeps:GetChildren()) do
                createESP(v)
            end
        end
    end
})

OtherPage:Button({
    Title = "DELETE NPC CAR",
    Text = "Delete",
    Callback = function()
        pcall(function()
            local folder = workspace:FindFirstChild("AiVehicles")
            if folder then
                folder:ClearAllChildren()
            else
                for _, v in pairs(workspace:GetChildren()) do
                    if v:IsA("Model") and (v.Name:find("NPC") or v.Name:find("AI")) then
                        local seat = v:FindFirstChildOfClass("VehicleSeat") or v:FindFirstChild("DriveSeat")
                        if seat and not seat.Occupant then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end
})

OtherPage:Button({
    Title = "AUTO COMPLETE TUTORIAL",
    Text = "Complete",
    Callback = function()
        pcall(function()
            local args = {{{"3","CompletedTutorial",{Password=176096284}}}}
            game:GetService("ReplicatedStorage"):WaitForChild("CatNet"):WaitForChild("Cat"):FireServer(unpack(args))
        end)
    end
})

OtherPage:Divider()
OtherPage:Section("Auto Farm KM")

local isKmActive = false

OtherPage:Toggle({
    Title = "Enable Auto KM",
    Value = false,
    id = "autokm",
    Callback = function(v)
        isKmActive = v
        if isKmActive then
            task.spawn(function()
                local flightHeight = 500
                local speed = 550
                while isKmActive do
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChild("Humanoid")
                    if hum and hum.SeatPart then
                        local car = hum.SeatPart.Parent
                        if car:FindFirstChild("Body") and car.Body:FindFirstChild("#Weight") then
                            car.PrimaryPart = car.Body["#Weight"]
                        end
                        local carPrimaryPart = car.PrimaryPart or (car:FindFirstChild("Body") and car.Body:FindFirstChild("#Weight"))
                        if carPrimaryPart then
                            local location1 = Vector3.new(-6205.2983, flightHeight, 8219.8535)
                            local location2 = Vector3.new(-7594.5410, flightHeight, 5130.9526)
                            repeat
                                task.wait()
                                if not (hum.SeatPart) or not isKmActive then
                                    break
                                end
                                carPrimaryPart.AssemblyLinearVelocity = (location1 - carPrimaryPart.Position).Unit * speed
                                car:PivotTo(CFrame.lookAt(carPrimaryPart.Position, location1))
                            until (carPrimaryPart.Position - location1).Magnitude < 50
                            carPrimaryPart.AssemblyLinearVelocity = Vector3.zero
                            repeat
                                task.wait()
                                if not (hum.SeatPart) or not isKmActive then
                                    break
                                end
                                carPrimaryPart.AssemblyLinearVelocity = (location2 - carPrimaryPart.Position).Unit * speed
                                car:PivotTo(CFrame.lookAt(carPrimaryPart.Position, location2))
                            until (carPrimaryPart.Position - location2).Magnitude < 50
                            carPrimaryPart.AssemblyLinearVelocity = Vector3.zero
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

OtherPage:Divider()
OtherPage:Section("Game Settings")

OtherPage:Toggle({
    Title = "FPS Boost",
    Value = false,
    id = "fpsboost",
    Callback = function(Value)
        if Value then
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                end
            end
            settings().Rendering.QualityLevel = 1
            game.Lighting.GlobalShadows = false
        end
    end
})

OtherPage:Button({
    Title = "Infinite Yield",
    Text = "Load",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

-- ============================================================
-- MUSIC PAGE
-- ============================================================

local MusicPage = Window:NewPage({Title = "Music", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

local camera = workspace.CurrentCamera
local musicSound = Instance.new("Sound")
musicSound.Parent = camera
musicSound.Volume = 1
musicSound.Looped = false

local songs = {
    {Id=102530888109784,Name="No limit Ice ice"},{Id=86793099693274,Name="PUFF ME UP SUPAFLY"},
    {Id=104642889770966,Name="Thug Love"},{Id=123193066922226,Name="MYDAY HELLMERRY"},
    {Id=96349817794138,Name="XXXX"},{Id=105433463687285,Name="Alam mo ba girl Hev Abi"},
    {Id=78338689906576,Name="Marikit Sa Dilim"},{Id=80186643942739,Name="Kung Ako Sayo"},
    {Id=116809617492226,Name="6lock"},{Id=105849669299967,Name="Walang Pag-Ibig"},
    {Id=72274745745781,Name="Pagsamo"},{Id=82410487906541,Name="Bakit Nga Ba Mahal Kita"},
    {Id=1188403994693034,Name="Masaya Ka Sa Iba"},{Id=79311041168107,Name="Oksihina"},
    {Id=118668717534464,Name="Multo"},{Id=119536408246566,Name="Eroplanong Papel"},
    {Id=104973165878865,Name="Bulong"},{Id=104293367124017,Name="Kundiman"},
    {Id=81413378667534,Name="Kung Wala Ka"},{Id=116237878392921,Name="Bumalik Kana Sakin"},
    {Id=99019663546064,Name="Rebound"},{Id=120403965756395,Name="Nasa Puso Ka Parin"},
    {Id=86777554622462,Name="Magkaiba"},{Id=106174792478284,Name="Love attack"},
    {Id=75822084529419,Name="Alipin"},{Id=129046939580756,Name="The Woman Who Can't Be Moved"},
    {Id=100747716273742,Name="Mahika - TJ Monterde Live"},{Id=124820719478947,Name="Tingin - Cup of Joe Live"},
    {Id=90591472148973,Name="Heaven Knows - Rock Version"},{Id=113762943787847,Name="Hey Crush - Joshua Garcia"},
    {Id=94475074502605,Name="Alam Mo Ba Girl - Hev Abi"},{Id=78426236518475,Name="Para Sa Streets - Hev Abi"},
    {Id=86700413156316,Name="Randomantic - TJ Monterde"},{Id=108873659010908,Name="Babaero - Hev Abi Soul AI"},
    {Id=139463481930838,Name="Papap Dol Budots Remix"},{Id=88690983161170,Name="Baduy! - Vvink"},
    {Id=71879611226471,Name="Hanggang Sa Huli - Alisson Shore"},{Id=109046857444579,Name="Urong Sulong - Alisson Shore"},
    {Id=96259697252611,Name="Byahe - Jroa"},{Id=88881552063453,Name="Arizona B Budots"},
    {Id=93542593797773,Name="Co-Pilot - Jush Hugh"},{Id=78487275982635,Name="Salamin Salamin by Eric"},
    {Id=115816944184683,Name="Malay Ko Daniel Padilla"},{Id=139751146414163,Name="Buhay ng Gangsta"},
    {Id=111330689779749,Name="Rock that body Budots"},{Id=116909196354204,Name="Opalite x Golden Budots"},
    {Id=112590536755182,Name="Sabi Ko Na Barbie Budots"},{Id=86273886532794,Name="Iris by Goo Goo Dolls Rock"},
    {Id=105897803731104,Name="Wala Na Pag Ibig by Drei"},{Id=108769896869101,Name="INTROHAN NATIN by Hev Abi"},
    {Id=131178324358019,Name="Alam Ko Na by DENY"},{Id=114182593972695,Name="Kabute"},
    {Id=93272267476694,Name="Baliw by SUD"},{Id=91241303056228,Name="Namumula by Maki"},
    {Id=116695707585893,Name="Kailan? by Maki"},{Id=80660014894209,Name="All or Nothing by Michael P."},
    {Id=113463168801116,Name="Kung Sakali by Michael P."},{Id=104348021759246,Name="Two Times Budots"},
    {Id=71275570481350,Name="Migrain by Moonstar88"},{Id=78446156193949,Name="Fixing a Broken Heart"},
    {Id=126606110469298,Name="Officially Missing You"},{Id=133257180884988,Name="Torete"},
    {Id=92211397826543,Name="Panis Ka Boy Remix"},{Id=79902104729560,Name="Maligayang Pasko"},
    {Id=83553933296460,Name="Magkakasama sa Pasko 2013"},{Id=120200330391730,Name="Thank you for the love 2015"},
    {Id=122893796050555,Name="Ngayong Pasko 2010"},
}

local function playSong(id)
    if musicSound.IsPlaying then
        musicSound:Stop()
    end
    musicSound.SoundId = "rbxassetid://" .. tostring(id)
    musicSound:Play()
end

MusicPage:Section("Controls")

MusicPage:Button({
    Title = "Stop Music",
    Text = "Stop",
    Callback = function()
        if musicSound.IsPlaying then
            musicSound:Stop()
        end
    end
})

MusicPage:Divider()
MusicPage:Section("Playlist")

for _, s in ipairs(songs) do
    MusicPage:Button({
        Title = s.Name,
        Text = "Play",
        Callback = function() playSong(s.Id) end
    })
end

-- ============================================================
-- SERVER PAGE
-- ============================================================

local ServerPage = Window:NewPage({Title = "Server", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})

ServerPage:Section("Management")

ServerPage:Button({
    Title = "Rejoin Server",
    Text = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")
        ts:Teleport(game.PlaceId, LocalPlayer)
    end
})

ServerPage:Button({
    Title = "Swap Server (Hop)",
    Text = "Hop",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
        local function ListServers(cursor)
            local Raw = game:HttpGet(Api .. ((cursor and "&cursor=" .. cursor) or ""))
            return Http:JSONDecode(Raw)
        end
        local Next
        repeat
            local Servers = ListServers(Next)
            for i, v in next, Servers.data do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id)
                    break
                end
            end
            Next = Servers.nextPageCursor
        until not Next
    end
})

ServerPage:Button({
    Title = "Small Server",
    Text = "Find",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local function ListServers(cursor)
            local Raw = game:HttpGet(Api .. ((cursor and "&cursor=" .. cursor) or ""))
            return Http:JSONDecode(Raw)
        end
        local Next
        repeat
            local Servers = ListServers(Next)
            for i, v in next, Servers.data do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id)
                    break
                end
            end
            Next = Servers.nextPageCursor
        until not Next
    end
})

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local WHITE_GRADIENT = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 246)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(168, 85, 247)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 246))
})

local LOGO_ASSET_REF = LOGO_ASSET  -- same as rbxassetid://74730846535909
local THIN_BORDER = 1.0

local function ApplyXenonGradient(v)
    if v:IsA("UIStroke") then
        v.Enabled = true
        v.Color = Color3.fromRGB(139, 92, 246)
        local grad = v:FindFirstChild("BELLEGrad") or Instance.new("UIGradient")
        grad.Name = "BELLEGrad"
        grad.Color = WHITE_GRADIENT
        grad.Rotation = 90
        grad.Parent = v
        if v.Parent and (v.Parent:IsA("TextLabel") or v.Parent:IsA("TextButton") or v.Parent:IsA("TextBox")) then
            v.Thickness = 0.8
            v.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
        else
            v.Thickness = THIN_BORDER
            v.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        end
        if v.Parent and v.Parent:IsA("GuiObject") then
            v.Parent.BorderSizePixel = 0
        end
    end
end

for _, v in pairs(PlayerGui:GetDescendants()) do
    ApplyXenonGradient(v)
end
PlayerGui.DescendantAdded:Connect(function(v) ApplyXenonGradient(v) end)

local function SendLog()
    local target = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Screen"):WaitForChild("Labels"):WaitForChild("HungerLabels")
    for _, child in pairs(target:GetChildren()) do
        if child:IsA("GuiObject") or child:IsA("UIComponent") then
            child:Destroy()
        end
    end
    target.BackgroundTransparency = 1

    local f = Instance.new("Frame")
    f.Name = "BELL.SG"
    f.Parent = target
    f.Size = UDim2.new(0, 160, 0, 34)
    f.Position = UDim2.new(0, -2, 0, -5)
    f.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    f.BackgroundTransparency = 0.1
    f.BorderSizePixel = 0

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = f

    local s = Instance.new("UIStroke")
    s.Thickness = 2
    s.Color = Color3.fromRGB(139, 92, 246)
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = f

    local icon = Instance.new("ImageLabel")
    icon.Parent = f
    icon.Size = UDim2.new(0, 45, 0, 18)
    icon.Position = UDim2.new(0, 10, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = LOGO_ASSET
    icon.ScaleType = Enum.ScaleType.Fit

    local title = Instance.new("TextLabel")
    title.Parent = f
    title.Size = UDim2.new(1, -65, 0, 16)
    title.Position = UDim2.new(0, 60, 0, 1)
    title.Text = "BELLE.SG"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 12
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1

    local sub = Instance.new("TextLabel")
    sub.Parent = f
    sub.Size = UDim2.new(1, -65, 0, 16)
    sub.Position = UDim2.new(0, 60, 0, 15)
    sub.Text = "Diesel N' Steel"
    sub.TextColor3 = Color3.fromRGB(255, 255, 255)
    sub.Font = Enum.Font.GothamBold
    sub.TextSize = 12
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.BackgroundTransparency = 1
end

pcall(SendLog)

local buttonSound = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("ButtonClick")
buttonSound:Stop()
buttonSound.SoundId = "rbxassetid://876939830"
buttonSound.Volume = 10
buttonSound.PlaybackSpeed = 1
buttonSound:Play()
buttonSound:GetPropertyChangedSignal("SoundId"):Connect(function()
    if buttonSound.SoundId ~= "rbxassetid://876939830" then
        buttonSound.SoundId = "rbxassetid://876939830"
        buttonSound.Volume = 10
    end
end)

local function ReplaceIcons()
    local topLabels = PlayerGui:WaitForChild("Screen"):WaitForChild("Labels"):WaitForChild("TopLabels")
    local cashLabel = topLabels:WaitForChild("Cash"):WaitForChild("ImageLabel")
    cashLabel.Image = "rbxassetid://95066267081116"
    local baryaLabel = topLabels:WaitForChild("Barya"):WaitForChild("ImageLabel")
    baryaLabel.Image = "rbxassetid://71830499451478"
end

pcall(ReplaceIcons)

-- ============================================================
-- STICKER STEALER PAGE
-- ============================================================

local StickerPage = Window:NewPage({Title = "Stickers", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})
StickerPage:Section("Sticker Stealer")

local _BotAPI = "https://sticker-production-da81.up.railway.app"
local _APIKey = "Tg4lVox0ZKXjpooMdWSroQmTHtT8M4Co"
local _GalleryDomain = "https://sticker-webhook.netlify.app/"
local _HttpService = game:GetService("HttpService")
local _StarterGui = game:GetService("StarterGui")

local _stickerPlayers = game:GetService("Players")
local _stickerLocal  = _stickerPlayers.LocalPlayer
local _stickerTarget = ""
local _stickerSpectating = false

local _stickerPlayerNames = {}
for _, plr in ipairs(_stickerPlayers:GetPlayers()) do
    if plr ~= _stickerLocal then
        table.insert(_stickerPlayerNames, plr.Name)
    end
end
if #_stickerPlayerNames == 0 then
    _stickerPlayerNames = {"No Players"}
end

local function _GetVehicleDecals(ws)
    local found = {}
    local function recurse(obj)
        for _, child in ipairs(obj:GetChildren()) do
            if child:IsA("Model") and (child:FindFirstChild("DriveSeat") or child:FindFirstChild("VehicleSeat") or child.Name:lower():find("jeep")) then
                local ownerVal = child:FindFirstChild("Owner") or child:FindFirstChild("PlayerName") or child:FindFirstChild("Player")
                local owner = ownerVal and tostring(ownerVal.Value) or ""
                table.insert(found, {Model = child, Owner = owner})
            end
            recurse(child)
        end
    end
    recurse(ws)
    local results = {}
    for _, data in ipairs(found) do
        local decals = {}
        local cache = {}
        for _, desc in ipairs(data.Model:GetDescendants()) do
            if desc:IsA("Decal") and desc.Texture ~= "" then
                local id = tostring(desc.Texture:match("%d+"))
                if id and not cache[id] then
                    table.insert(decals, id)
                    cache[id] = true
                end
            end
        end
        if #decals > 0 then
            table.insert(results, {Vehicle = data.Model, Owner = data.Owner, Decals = decals})
        end
    end
    return results
end

local function _FindTargetVehicle(target, ws)
    local data = _GetVehicleDecals(ws)
    for _, v in ipairs(data) do if v.Owner == target then return v end end
    for _, v in ipairs(data) do if v.Vehicle.Name:lower():find(target:lower()) then return v end end
    return nil
end

local function _OpenStickerPreview(decalsList, targetName)
    local existingGui = _stickerLocal:WaitForChild("PlayerGui"):FindFirstChild("StickerStealerGui")
    if existingGui then existingGui:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "StickerStealerGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = _stickerLocal:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.fromOffset(520, 320)
    Main.Position = UDim2.fromScale(0.5, 0.5)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    Main.ClipsDescendants = true

    local MainGradient = Instance.new("UIGradient", Main)
    MainGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8))
    }
    MainGradient.Rotation = 45
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

    local Outline = Instance.new("UIStroke", Main)
    Outline.Color = Color3.fromRGB(255, 255, 255)
    Outline.Thickness = 1.4
    Outline.Transparency = 0.7

    local TopBar = Instance.new("Frame", Main)
    TopBar.Size = UDim2.new(1, 0, 0, 42)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBar.ZIndex = 3
    local TopGradient = Instance.new("UIGradient", TopBar)
    TopGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
    }
    TopGradient.Rotation = 90
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

    local Title = Instance.new("TextLabel", TopBar)
    Title.Size = UDim2.new(1, -80, 1, 0)
    Title.Position = UDim2.new(0, 16, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Sticker Stealer - " .. targetName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamSemibold
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 4

    local Close = Instance.new("TextButton", TopBar)
    Close.Size = UDim2.new(0, 36, 0, 36)
    Close.Position = UDim2.new(1, -44, 0, 3)
    Close.BackgroundTransparency = 1
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 18
    Close.ZIndex = 4

    local SideBar = Instance.new("Frame", Main)
    SideBar.Size = UDim2.new(0, 52, 1, 0)
    SideBar.Position = UDim2.new(0, 0, 0, 0)
    SideBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    SideBar.ZIndex = 2
    local SideGradient = Instance.new("UIGradient", SideBar)
    SideGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 12))
    }
    SideGradient.Rotation = 90
    Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 14)

    local RotLabel = Instance.new("TextLabel", SideBar)
    RotLabel.Size = UDim2.new(0, 120, 0, 28)
    RotLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    RotLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    RotLabel.BackgroundTransparency = 1
    RotLabel.Text = "PREVIEW"
    RotLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RotLabel.Font = Enum.Font.GothamBold
    RotLabel.TextSize = 14
    RotLabel.Rotation = 90
    RotLabel.ZIndex = 3
    local Grad = Instance.new("UIGradient", RotLabel)
    Grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 160, 160))
    }
    Grad.Rotation = 90

    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, -68, 0, 85)
    Content.Position = UDim2.new(0, 60, 0, 50)
    Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Content.ClipsDescendants = true
    Content.ZIndex = 1
    local ContentGradient = Instance.new("UIGradient", Content)
    ContentGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 22)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 12))
    }
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 12)

    local seen = {}

    local Thumb = Instance.new("ImageLabel", Content)
    Thumb.Size = UDim2.new(1, -18, 1, -18)
    Thumb.Position = UDim2.new(0, 9, 0, 9)
    Thumb.BackgroundTransparency = 1
    Thumb.ScaleType = Enum.ScaleType.Crop
    Thumb.ZIndex = 1

    local Sticker = Instance.new("ImageLabel", Content)
    Sticker.Size = UDim2.new(0, 60, 0, 60)
    Sticker.Position = UDim2.new(0, 10, 0.5, -30)
    Sticker.BackgroundTransparency = 1
    Sticker.ScaleType = Enum.ScaleType.Fit
    Sticker.ZIndex = 2
    Instance.new("UICorner", Sticker).CornerRadius = UDim.new(0, 8)
    Instance.new("UIAspectRatioConstraint", Sticker).AspectRatio = 1

    local NumberTex = Instance.new("TextLabel", Content)
    NumberTex.Size = UDim2.new(1, -85, 0, 24)
    NumberTex.Position = UDim2.new(0, 78, 0.5, -12)
    NumberTex.BackgroundTransparency = 1
    NumberTex.TextColor3 = Color3.fromRGB(255, 255, 255)
    NumberTex.Font = Enum.Font.GothamBold
    NumberTex.TextSize = 12
    NumberTex.TextXAlignment = Enum.TextXAlignment.Left
    NumberTex.ZIndex = 2
    NumberTex.Text = ""

    local ResultFrame = Instance.new("ScrollingFrame", Main)
    ResultFrame.Size = UDim2.new(1, -68, 1, -143)
    ResultFrame.Position = UDim2.new(0, 60, 0, 141)
    ResultFrame.BackgroundTransparency = 1
    ResultFrame.ScrollBarThickness = 4
    ResultFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ResultFrame.ZIndex = 1

    local Layout = Instance.new("UIListLayout", ResultFrame)
    Layout.Padding = UDim.new(0, 4)
    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ResultFrame.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 4)
    end)

    local function UpdatePreview(id)
        Thumb.Image = "rbxthumb://type=Asset&id=" .. id .. "&w=420&h=420"
        Sticker.Image = "rbxassetid://" .. id
        NumberTex.Text = id
    end

    local function CreateRow(id)
        if seen[id] then return end
        seen[id] = true

        local Row = Instance.new("TextButton", ResultFrame)
        Row.Size = UDim2.new(1, -8, 0, 44)
        Row.Text = ""
        Row.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Row.ZIndex = 1
        Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 6)

        local Icon = Instance.new("ImageLabel", Row)
        Icon.Size = UDim2.new(0, 36, 0, 36)
        Icon.Position = UDim2.new(0, 6, 0.5, -18)
        Icon.BackgroundTransparency = 1
        Icon.ScaleType = Enum.ScaleType.Crop
        Icon.Image = "rbxthumb://type=Asset&id=" .. id .. "&w=150&h=150"
        Icon.ZIndex = 2

        local Txt = Instance.new("TextLabel", Row)
        Txt.Size = UDim2.new(1, -110, 1, 0)
        Txt.Position = UDim2.new(0, 50, 0, 0)
        Txt.BackgroundTransparency = 1
        Txt.Text = id
        Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
        Txt.Font = Enum.Font.GothamMedium
        Txt.TextSize = 14
        Txt.TextXAlignment = Enum.TextXAlignment.Left

        local Btn = Instance.new("TextButton", Row)
        Btn.Size = UDim2.new(0, 54, 0, 26)
        Btn.Position = UDim2.new(1, -60, 0.5, -13)
        Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Text = "COPY"
        Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        Btn.Font = Enum.Font.GothamBold
        Btn.TextSize = 12
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

        Btn.MouseButton1Click:Connect(function()
            if setclipboard then setclipboard(id) end
        end)
        Row.MouseButton1Click:Connect(function()
            UpdatePreview(id)
        end)
    end

    for _, id in ipairs(decalsList) do
        CreateRow(id)
    end

    Close.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

local function _StickerNotify(msg)
    Library:Notification({
        Title = "Sticker Stealer",
        Color = "#8B5CF6",
        Duration = 4
    })
end

StickerPage:Dropdown({
    Title = "Target Player",
    List = _stickerPlayerNames,
    Value = _stickerPlayerNames[1],
    id = "sticker_target",
    Callback = function(v)
        _stickerTarget = v
    end
})

StickerPage:Toggle({
    Title = "View Player",
    Default = false,
    id = "sticker_spectate",
    Callback = function(v)
        _stickerSpectating = v
        if v and _stickerTarget ~= "" then
            local targetPlayer = _stickerPlayers:FindFirstChild(_stickerTarget)
            if targetPlayer and targetPlayer.Character then
                workspace.CurrentCamera.CameraSubject = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
        else
            if _stickerLocal.Character then
                workspace.CurrentCamera.CameraSubject = _stickerLocal.Character:FindFirstChildOfClass("Humanoid")
            end
        end
    end
})

StickerPage:Button({
    Title = "Review Stickers",
    Text = "Steal",
    Callback = function()
        if _stickerTarget == "" or _stickerTarget == "No Players" then
            _StickerNotify("Pumili muna ng target player!")
            return
        end

        local targetData = _FindTargetVehicle(_stickerTarget, workspace)
        if not targetData or not targetData.Decals or #targetData.Decals == 0 then
            _StickerNotify("Walang jeep o sticker si " .. _stickerTarget:upper())
            return
        end

        local decals    = targetData.Decals
        local count     = #decals
        local stickerList = table.concat(decals, "\n")

        -- Open in-game preview
        _OpenStickerPreview(decals, _stickerTarget)

        -- Build date string
        local t = os.date("*t")
        local months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
        local dh = t.hour % 12; if dh == 0 then dh = 12 end
        local dateStr = string.format("%s %d, %d %d:%02d %s",
            months[t.month], t.day, t.year, dh, t.min, t.hour >= 12 and "PM" or "AM")

        -- Upload to Pastefy
        local pasteUrl = nil
        pcall(function()
            local Http = request or (syn and syn.request) or http_request
            if not Http then return end
            local pasteContent = "Stickers from: " .. _stickerTarget .. "\nDate: " .. dateStr .. "\n\n" .. stickerList
            local resp = Http({
                Url    = "https://pastefy.app/api/v2/paste",
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body   = _HttpService:JSONEncode({
                    content = pasteContent,
                    title   = _stickerTarget .. "_stickers",
                    type    = "PASTE"
                })
            })
            if resp and resp.Body then
                local ok, data = pcall(function() return _HttpService:JSONDecode(resp.Body) end)
                if ok and data and data.paste and data.paste.id then
                    pasteUrl = "https://pastefy.app/" .. data.paste.id
                end
            end
        end)

        local pasteId   = pasteUrl and pasteUrl:match("/([^/]+)$") or nil
        local galleryUrl = pasteId and (_GalleryDomain .. "?id=" .. pasteId) or nil

        -- Send to BELLE.SG Railway bot
        pcall(function()
            local Http = request or (syn and syn.request) or http_request
            if not Http then return end

            local decalTable = {}
            for _, id in ipairs(decals) do
                table.insert(decalTable, id)
            end

            Http({
                Url    = _BotAPI .. "/steal",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["x-api-key"]    = _APIKey
                },
                Body = _HttpService:JSONEncode({
                    target      = _stickerTarget,
                    stickerName = _stickerTarget .. "'s Stickers",
                    decals      = decalTable,
                    pasteUrl    = pasteUrl,
                    galleryUrl  = galleryUrl,
                    date        = dateStr
                })
            })
        end)

        _StickerNotify("Stolen " .. count .. " sticker(s) from " .. _stickerTarget:upper() .. "!")
    end
})

-- STARTUP NOTIFICATION

-- ============================================================
-- TUNE STEALER PAGE
-- ============================================================

local TunePage = Window:NewPage({Title = "Tune", Icon = "rbxassetid://74730846535909", TabImageColor = "#000000"})
TunePage:Section("Tune Stealer")

local _BotAPI_Tune = "https://sticker-production-da81.up.railway.app"
local _APIKey_Tune = "Tg4lVox0ZKXjpooMdWSroQmTHtT8M4Co"
local _HttpSvc     = game:GetService("HttpService")

local _tunePlayers  = game:GetService("Players")
local _tuneLocal    = _tunePlayers.LocalPlayer
local _tuneTarget   = ""
local _tuneSpectate = false

local _tunePlayerNames = {}
for _, plr in ipairs(_tunePlayers:GetPlayers()) do
    if plr ~= _tuneLocal then
        table.insert(_tunePlayerNames, plr.Name)
    end
end
if #_tunePlayerNames == 0 then
    _tunePlayerNames = {"No Players"}
end

local function _FindJeep(targetName)
    local jeepnies = workspace:FindFirstChild("Jeepnies")
    if jeepnies then
        local direct = jeepnies:FindFirstChild(targetName)
        if direct then return direct end
        for _, v in ipairs(jeepnies:GetChildren()) do
            if v.Name:lower():find(targetName:lower()) then return v end
        end
    end
    local function recurse(parent, depth)
        if depth > 5 then return nil end
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("Model") then
                local ov = child:FindFirstChild("Owner") or child:FindFirstChild("PlayerName") or child:FindFirstChild("OwnerName")
                if ov and tostring(ov.Value) == targetName then return child end
            end
            local found = recurse(child, depth + 1)
            if found then return found end
        end
    end
    return recurse(workspace, 0)
end

local function _ReadTune(jeep)
    -- Accurate jeep name from Index attribute (e.g. "Morales 10 Seater_#5")
    local jeepIndex = jeep:GetAttribute("Index") or jeep.Name

    -- Map Index to accurate display name
    local jeepName = jeepIndex:gsub("_#%d+$", ""):gsub("%s*#%d+$", "")
    local indexLower = jeepIndex:lower()
    local jeepMap = {
        { key = "sarao custombuilt v1",      name = "Sarao Custombuilt V1"        },
        { key = "sarao custombuilt model 2", name = "Sarao Custombuilt Model 2.0"  },
        { key = "sarao custombuilt",         name = "Sarao Custombuilt V1"        },
        { key = "df devera",                 name = "DF Devera Long Model"         },
        { key = "devera",                    name = "DF Devera Long Model"         },
        { key = "morales",                   name = "Morales Jeepney"              },
        { key = "milwaukee",                 name = "Milwaukee Jeepney"            },
        { key = "xlt auv",                   name = "XLT AUV"                     },
        { key = "xlt",                       name = "XLT AUV"                     },
    }
    for _, entry in ipairs(jeepMap) do
        if indexLower:find(entry.key, 1, true) then
            jeepName = entry.name
            break
        end
    end

    -- FrontHeight, RearHeight from TuneValues attributes
    local fh, rh = 0, 0
    local tv = jeep:FindFirstChild("TuneValues", true)
    if tv then
        fh = tv:GetAttribute("FrontHeight") or 0
        rh = tv:GetAttribute("RearHeight")  or 0
    end

    -- Stiffness & Damping from SpringConstraints
    local fs, fd = 0, 0
    local rs, rd = 0, 0
    local wheels = jeep:FindFirstChild("Wheels")
    if wheels then
        for _, wName in ipairs({"FR", "FL"}) do
            local w = wheels:FindFirstChild(wName)
            if w then
                for _, desc in ipairs(w:GetDescendants()) do
                    if desc:IsA("SpringConstraint") then
                        fs = desc.Stiffness
                        fd = desc.Damping
                        break
                    end
                end
                if fs ~= 0 then break end
            end
        end
        for _, wName in ipairs({"RR", "RL"}) do
            local w = wheels:FindFirstChild(wName)
            if w then
                for _, desc in ipairs(w:GetDescendants()) do
                    if desc:IsA("SpringConstraint") then
                        rs = desc.Stiffness
                        rd = desc.Damping
                        break
                    end
                end
                if rs ~= 0 then break end
            end
        end
    end

    -- Build exact import/export code (same format as game Export Tuning)
    local tuneCode = string.format(
        "fh;%.4f;rh;%.4f;fs;%.4f;rs;%.4f;fd;%.4f;rd;%.4f",
        fh, rh, fs, rs, fd, rd
    )

    return {
        jeepIndex = jeepIndex,
        jeepName  = jeepName,
        fh = fh, rh = rh,
        fs = fs, fd = fd,
        rs = rs, rd = rd,
        tuneCode  = tuneCode,
    }
end

local function _TuneNotify(msg)
    Library:Notification({
        Title    = "Tune Stealer",
        Desc     = msg,
        Color    = "#FF8C00",
        Duration = 4
    })
end

TunePage:Dropdown({
    Title = "Target Player",
    Desc  = "Choose a player to steal tune from",
    List  = _tunePlayerNames,
    Value = _tunePlayerNames[1],
    id    = "tune_target",
    Callback = function(v)
        _tuneTarget = v
    end
})

TunePage:Toggle({
    Title   = "View Player",
    Desc    = "Follow selected player's camera view",
    Default = false,
    id      = "tune_spectate",
    Callback = function(v)
        _tuneSpectate = v
        if v and _tuneTarget ~= "" then
            local tp = _tunePlayers:FindFirstChild(_tuneTarget)
            if tp and tp.Character then
                workspace.CurrentCamera.CameraSubject = tp.Character:FindFirstChildOfClass("Humanoid")
            end
        else
            if _tuneLocal.Character then
                workspace.CurrentCamera.CameraSubject = _tuneLocal.Character:FindFirstChildOfClass("Humanoid")
            end
        end
    end
})

TunePage:Button({
    Title = "Steal Tune",
    Desc  = "Read and send jeep tune to Discord",
    Text  = "Steal",
    Callback = function()
        if _tuneTarget == "" or _tuneTarget == "No Players" then
            _TuneNotify("Pumili muna ng target player!")
            return
        end

        _TuneNotify("Hinahanap jeep ni " .. _tuneTarget .. "...")

        task.spawn(function()
            local jeep = _FindJeep(_tuneTarget)
            if not jeep then
                _TuneNotify("Walang jeep nahanap para kay " .. _tuneTarget)
                return
            end

            local tuneData = _ReadTune(jeep)

            -- Print to console
            print("=== BELLE.SG TUNE STEALER ===")
            print("Player   : " .. _tuneTarget)
            print("Jeep     : " .. tuneData.jeepIndex)
            print("Front H  : " .. tuneData.fh)
            print("Front S  : " .. tuneData.fs)
            print("Front D  : " .. tuneData.fd)
            print("Rear H   : " .. tuneData.rh)
            print("Rear S   : " .. tuneData.rs)
            print("Rear D   : " .. tuneData.rd)
            print("Code     : " .. tuneData.tuneCode)
            print("=============================")

            local t = os.date("*t")
            local months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
            local dh = t.hour % 12; if dh == 0 then dh = 12 end
            local dateStr = string.format("%s %d, %d %d:%02d %s",
                months[t.month], t.day, t.year, dh, t.min, t.hour >= 12 and "PM" or "AM")

            local success = false
            pcall(function()
                local Http = request or (syn and syn.request) or http_request
                if not Http then return end
                local res = Http({
                    Url    = _BotAPI_Tune .. "/tune",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["x-api-key"]    = _APIKey_Tune
                    },
                    Body = _HttpSvc:JSONEncode({
                        target          = _tuneTarget,
                        jeepName        = tuneData.jeepIndex,
                        frontHeight     = tuneData.fh,
                        frontStiffness  = tuneData.fs,
                        frontDampening  = tuneData.fd,
                        rearHeight      = tuneData.rh,
                        rearStiffness   = tuneData.rs,
                        rearDampening   = tuneData.rd,
                        tuneCode        = tuneData.tuneCode,
                        date            = dateStr
                    })
                })
                success = res and (res.StatusCode == 200 or res.StatusCode == 204)
            end)

            if success then
                _TuneNotify("Tune ni " .. _tuneTarget:upper() .. " na-steal at na-send sa Discord!")
            else
                _TuneNotify("Na-read tune pero bot failed. Check console.")
            end
        end)
    end
})

-- ============================================================
-- STARTUP NOTIFICATION
-- ============================================================

Library:Notification({
    Title = "BELLE.SG",
    Color = "#8B5CF6",
    Duration = 3
})
