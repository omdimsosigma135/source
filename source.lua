--[[
Octohook ui lib informant version
Developed by liam#4567
Edited by xz#1111
]]

-- // Load

local startupArgs = ({...})[1] or {}

if getgenv().library ~= nil then
    getgenv().library:Unload();
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function gs(a)
    return game:GetService(a)
end

-- // Variables
local players, http, runservice, inputservice, tweenService, stats, actionservice = gs('Players'), gs('HttpService'), gs('RunService'), gs('UserInputService'), gs('TweenService'), gs('Stats'), gs('ContextActionService')
local localplayer = players.LocalPlayer

local setByConfig = false
local floor, ceil, huge, pi, clamp = math.floor, math.ceil, math.huge, math.pi, math.clamp
local c3new, fromrgb, fromhsv = Color3.new, Color3.fromRGB, Color3.fromHSV
local next, newInstance, newUDim2, newVector2 = next, Instance.new, UDim2.new, Vector2.new
local isexecutorclosure = isexecutorclosure or is_synapse_function or is_sirhurt_closure or iskrnlclosure;
local executor = (
    syn and 'syn' or
    getexecutorname and getexecutorname() or
    'unknown'
)

local library = {
    windows = {};
    indicators = {};
    flags = {};
    options = {};
    connections = {};
    drawings = {};
    instances = {};
    utility = {};
    notifications = {};
    tweens = {};
    theme = {};
    zindexOrder = {
        ['indicator'] = 950;
        ['window'] = 1000;
        ['dropdown'] = 1200;
        ['colorpicker'] = 1100;
        ['watermark'] = 1300;
        ['notification'] = 1400;
    },
    stats = {
        ['fps'] = 0;
        ['ping'] = 0;
    };
    images = {
        ['gradientp90'] = 'https://raw.githubusercontent.com/portallol/luna/main/modules/gradient90.png';
        ['gradientp45'] = 'https://raw.githubusercontent.com/portallol/luna/main/modules/gradient45.png';
        ['colorhue'] = 'https://raw.githubusercontent.com/portallol/luna/main/modules/lgbtqshit.png';
        ['colortrans'] = 'https://raw.githubusercontent.com/portallol/luna/main/modules/trans.png';
    };
    numberStrings = {['Zero'] = 0, ['One'] = 1, ['Two'] = 2, ['Three'] = 3, ['Four'] = 4, ['Five'] = 5, ['Six'] = 6, ['Seven'] = 7, ['Eight'] = 8, ['Nine'] = 9};
    signal = loadstring(game:HttpGet('https://raw.githubusercontent.com/drillygzzly/Other/main/1414'))();
    open = false;
    opening = false;
    hasInit = false;
    cheatname = startupArgs.cheatname or 'octohook';
    gamename = startupArgs.gamename or 'universal';
    fileext = startupArgs.fileext or '.txt';
}

library.themes = {
    {
        name = 'Default',
        theme = {
            ["Accent"]                    = fromrgb(204, 45, 45);
            ["Background"]                = fromrgb(18,18,18);
            ["Border"]                    = fromrgb(0,0,0);
            ["Border 1"]                  = fromrgb(60,60,60);
            ["Border 2"]                  = fromrgb(18,18,18);
            ["Border 3"]                  = fromrgb(10,10,10);
            ["Primary Text"]              = fromrgb(255,255,255);
            ["Group Background"]          = fromrgb(18,18,18);
            ["Selected Tab Background"]   = fromrgb(18,18,18);
            ["Unselected Tab Background"] = fromrgb(18,18,18);
            ["Selected Tab Text"]         = fromrgb(245,245,245);
            ["Unselected Tab Text"]       = fromrgb(145,145,145);
            ["Section Background"]        = fromrgb(18,18,18);
            ["Option Text 1"]             = fromrgb(255,255,255);
            ["Option Text 2"]             = fromrgb(255,255,255);
            ["Option Text 3"]             = fromrgb(255,255,255);
            ["Option Border 1"]           = fromrgb(50,50,50);
            ["Option Border 2"]           = fromrgb(0,0,0);
            ["Option Background"]         = fromrgb(23,23,23);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Informant_V1',
        theme = {
            ['Accent']                    = fromrgb(103,89,179);
            ['Background']                = fromrgb(22,22,31);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(50,50,50);
            ['Border 2']                  = fromrgb(24,25,37);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(24,25,37);
            ['Selected Tab Background']   = fromrgb(24,25,37);
            ['Unselected Tab Background'] = fromrgb(22,22,31);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(22,22,31);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(50,50,50);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(24,25,37);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Fatality',
        theme = {
            ['Accent']                    = fromrgb(197,7,83);
            ['Background']                = fromrgb(25,19,53);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(60,53,93);
            ['Border 2']                  = fromrgb(29,23,66);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(29,23,66);
            ['Selected Tab Background']   = fromrgb(29,23,66);
            ['Unselected Tab Background'] = fromrgb(25,19,53);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(25,19,53);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(60,53,93);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(29,23,66);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Gamesense',
        theme = {
            ['Accent']                    = fromrgb(147,184,26);
            ['Background']                = fromrgb(17,17,17);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(47,47,47);
            ['Border 2']                  = fromrgb(17,17,17);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(17,17,17);
            ['Selected Tab Background']   = fromrgb(17,17,17);
            ['Unselected Tab Background'] = fromrgb(17,17,17);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(17,17,17);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(47,47,47);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(35,35,35);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Twitch',
        theme = {
            ['Accent']                    = fromrgb(169,112,255);
            ['Background']                = fromrgb(14,14,14);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(45,45,45);
            ['Border 2']                  = fromrgb(31,31,35);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(31,31,35);
            ['Selected Tab Background']   = fromrgb(31,31,35);
            ['Unselected Tab Background'] = fromrgb(17,17,17);
            ['Selected Tab Text']         = fromrgb(225,225,225);
            ['Unselected Tab Text']       = fromrgb(160,170,175);
            ['Section Background']        = fromrgb(17,17,17);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(45,45,45);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(24,24,27);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    }
}

local blacklistedKeys = {
    Enum.KeyCode.Unknown,
    Enum.KeyCode.W,
    Enum.KeyCode.A,
    Enum.KeyCode.S,
    Enum.KeyCode.D,
    Enum.KeyCode.Slash,
    Enum.KeyCode.Tab,
    Enum.KeyCode.Escape
}

local whitelistedBoxKeys = {
    Enum.KeyCode.Zero,
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine
}

local keyNames = {
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

library.button1down = library.signal.new()
library.button1up   = library.signal.new()
library.mousemove   = library.signal.new()
library.unloaded    = library.signal.new();

local button1down, button1up, mousemove = library.button1down, library.button1up, library.mousemove
local mb1down = false;

local utility = library.utility
do

    function utility:Connection(signal, func)
        local c = signal:Connect(func)
        table.insert(library.connections, c)
        return c
    end

    function utility:Instance(class, properties)
        local inst = newInstance(class)
        for prop, val in next, properties or {} do
            local s,e = pcall(function()
                inst[prop] = val
            end)
            if not s then
                printconsole(e, 255,0,0)
            end
        end
        return inst
    end

    function utility:HasProperty(obj, prop)
        return ({(pcall(function() local a = obj[prop] end))})[1]
    end

    function utility:ToRGB(c3)
        return c3.R*255,c3.G*255,c3.B*255
    end

    function utility:AddRGB(a,b)
        local r1,g1,b1 = self:ToRGB(a);
        local r2,g2,b2 = self:ToRGB(b);
        return fromrgb(clamp(r1+r2,0,255),clamp(g1+g2,0,255),clamp(b1+b2,0,255))
    end

    function utility:ConvertNumberRange(val,oldmin,oldmax,newmin,newmax)
        return (((val - oldmin) * (newmax - newmin)) / (oldmax - oldmin)) + newmin
    end

    function utility:UDim2ToVector2(udim2, vector2)
        local x,y
        x = udim2.X.Offset + self:ConvertNumberRange(udim2.X.Scale,0,1,0,vector2.X)
        y = udim2.Y.Offset + self:ConvertNumberRange(udim2.Y.Scale,0,1,0,vector2.Y)
        return newVector2(x,y)
    end

    function utility:Lerp(a,b,c)
        return a + (b-a) * c
    end

    function utility:Tween(obj, prop, val, time, direction, style)
        if self:HasProperty(obj, prop) then
            if library.tweens[obj] then
                if library.tweens[obj][prop] then
                    library.tweens[obj][prop]:Cancel()
                end
            end

            local startVal = obj[prop];
            local a = 0;
            local tween = {
                Completed = library.signal.new();
            };

            library.tweens[obj] = library.tweens[obj] or {};
            library.tweens[obj][prop] = tween;

            tween.Connection = self:Connection(runservice.RenderStepped, function(dt)
                a = a + (dt / time);
                if a >= 1 or obj == nil then
                    tween:Cancel();
                end
                pcall(function()
                    local progress = tweenService:GetValue(a, style or Enum.EasingStyle.Linear, direction or Enum.EasingDirection.In)
                    local newVal
                    if typeof(startVal) == 'number' then
                        newVal = utility:Lerp(startVal, val, progress);
                    else
                        newVal = startVal:Lerp(val, progress);
                    end
                    obj[prop] = newVal;
                end)
            end)

            function tween:Cancel()
                tween.Connection:Disconnect();
                tween.Completed:Fire();
                table.clear(tween);
                library.tweens[obj][prop] = nil;
            end
            
            return tween;
        else
            printconsole('unable to tween: invalid property '..tostring(prop)..' for object '..tostring(obj), 255,0,0)
        end
    end

    function utility:DetectTableChange(indexcallback,newindexcallback)
        if indexcallback == nil then
            warn('DetectTableChange: Argument #1 (indexcallback) is nil, function may not work as expected.')
        elseif newindexcallback == nil then
            warn('DetectTableChange: Argument #2 (newindexcallback) is nil, function may not work as expected.')
        end
        local proxy = newproxy(true);
        local mt = getmetatable(proxy);
        mt.__index = indexcallback
        mt.__newindex = newindexcallback
        return proxy
    end

    function utility:MouseOver(obj)
        local mousePos = inputservice:GetMouseLocation();
        local x1 = obj.Position.X
        local y1 = obj.Position.Y
        local x2 = x1 + obj.Size.X
        local y2 = y1 + obj.Size.Y
        return (mousePos.X >= x1 and mousePos.Y >= y1 and mousePos.X <= x2 and mousePos.Y <= y2)
    end

    function utility:GetHoverObject()
        local objects = {}
        for i,v in next, library.drawings do
            if v.Object.Visible and v.Class == 'Square' and self:MouseOver(v.Object) then
                table.insert(objects,v.Object)
            end
        end
        table.sort(objects,function(a,b)
            return a.ZIndex > b.ZIndex
        end)
        return objects[1]
    end

    function utility:Draw(class, properties)
        local blacklistedProperties = {'Object','Children','Class'}
        local drawing = {
            Object = Drawing.new(class);
            Children = {};
            ThemeColor = '';
            OutlineThemeColor = '';
            ThemeColorOffset = 0;
            OutlineThemeColorOffset = 0;
            Parent = nil;
            Size = newUDim2(0,0,0,0);
            Position = newUDim2(0,0,0,0);
            AbsoluteSize = newVector2(0,0);
            AbsolutePosition = newVector2(0,0);
            Hover = false;
            Visible = true;
            MouseButton1Down = library.signal.new();
            MouseButton2Down = library.signal.new();
            MouseButton1Up = library.signal.new();
            MouseButton2Up = library.signal.new();
            MouseEnter = library.signal.new();
            MouseLeave = library.signal.new();
            Class = class;
        }

        function drawing:Update()
            -- if drawing.Parent then
                local parent = drawing.Parent ~= nil and library.drawings[drawing.Parent.Object] or nil
                local parentSize,parentPos,parentVis = workspace.CurrentCamera.ViewportSize, Vector2.new(0,0), true;
                if parent ~= nil then
                    parentSize = (parent.Class == 'Square' or parent.Class == 'Image') and parent.Object.Size or parent.Class == 'Text' and parent.TextBounds or workspace.CurrentCamera.ViewportSize
                    parentPos = parent.Object.Position
                    parentVis = parent.Object.Visible
                end

                if drawing.Class == 'Square' or drawing.Class == 'Image' then
                    drawing.Object.Size = typeof(drawing.Size) == 'Vector2' and drawing.Size or typeof(drawing.Size) == 'UDim2' and utility:UDim2ToVector2(drawing.Size,parentSize)
                end

                if drawing.Class == 'Square' or drawing.Class == 'Image' or drawing.Class == 'Circle' or drawing.Class == 'Text' then
                    drawing.Object.Position = parentPos + (typeof(drawing.Position) == 'Vector2' and drawing.Position or utility:UDim2ToVector2(drawing.Position,parentSize))
                end

                drawing.Object.Visible = (parentVis and drawing.Visible) and true or false

            -- end
            drawing:UpdateChildren()
        end

        function drawing:UpdateChildren()
            for i,v in next, drawing.Children do
                v:Update()
            end
        end

        function drawing:GetDescendants()
            local descendants = {};
            local function a(t)
                for _,v in next, t.Children do
                    table.insert(descendants, v);
                    a(v)
                end
            end
            a(self)
            return descendants;
        end

        library.drawings[drawing.Object] = drawing

        -- this is really stupid lol
        local proxy = utility:DetectTableChange(
        function(obj,i)
            return drawing[i] == nil and drawing.Object[i] or drawing[i]
        end,
        function(obj,i,v)
            if not table.find(blacklistedProperties,i) then

                local lastval = drawing[i]

                if i == 'Size' and (class == 'Square' or class == 'Image') then
                    drawing.Object.Size = utility:UDim2ToVector2(v,drawing.Parent == nil and workspace.CurrentCamera.ViewportSize or drawing.Parent.Object.Size);
                    drawing.AbsoluteSize = drawing.Object.Size;
                elseif i == 'Position' and (class == 'Square' or class == 'Image' or class == 'Text') then
                    drawing.Object.Position =  utility:UDim2ToVector2(v,drawing.Parent == nil and newVector2(0,0) or drawing.Parent.Object.Position);
                    drawing.AbsolutePosition = drawing.Object.Position;
                elseif i == 'Parent' then
                    if drawing.Parent ~= nil then
                        drawing.Parent.Children[drawing] = nil
                    end
                    if v ~= nil then
                        table.insert(v.Children,drawing)
                    end
                elseif i == 'Visible' then
                    drawing.Visible = v
                elseif i == 'Font' and v == 2 and executor == 'ScriptWare' then
                    v = 1
                end

                pcall(function()
                    drawing.Object[i] = v
                end)
                if drawing[i] ~= nil or i == 'Parent' then
                    drawing[i] = v
                end

                if table.find({'Size','Position','Position','Visible','Parent'},i) then
                    drawing:Update()
                end
                if table.find({'ThemeColor','OutlineThemeColor','ThemeColorOffset','OutlineThemeColorOffset'},i) and lastval ~= v then
                    library.UpdateThemeColors()
                end

            end
        end)

        function drawing:Remove()
            for i,v in next, self.Children do
                v:Remove();
            end

            if drawing.Parent then
                drawing.Parent.Children[drawing.Object] = nil;
            end

            library.drawings[drawing.Object] = nil;
            drawing.Object:Remove();
            table.clear(drawing);

        end

        properties = typeof(properties) == 'table' and properties or {}

        if class == 'Square' and properties.Filled == nil then
            properties.Filled = true;
        end

        if properties.Visible == nil then
            properties.Visible = true;
        end

        for i,v in next, properties do
            proxy[i] = v
        end

        drawing:Update()
        return proxy
    end
end

library.utility = utility

function library:Unload()
    library.unloaded:Fire();
    for _,c in next, self.connections do
        c:Disconnect()
    end
    for obj in next, self.drawings do
        obj:Remove()
    end
    table.clear(self.drawings)
    getgenv().library = nil
end

function library:init()
    if self.hasInit then
        return
    end

    local tooltipObjects = {};

    makefolder(self.cheatname)
    makefolder(self.cheatname..'/assets')
    makefolder(self.cheatname..'/'..self.gamename)
    makefolder(self.cheatname..'/'..self.gamename..'/configs');

    function self:SetTheme(theme)
        for i,v in next, theme do
            self.theme[i] = v;
        end
        self.UpdateThemeColors();
    end

    function self:GetConfig(name)
        if isfile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext) then
            return readfile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext);
        end
    end

    function self:LoadConfig(name)
        local cfg = self:GetConfig(name)
        if not cfg then

            return
        end

        local s,e = pcall(function()
            setByConfig = true
            for flag,value in next, http:JSONDecode(cfg) do
                local option = library.options[flag]
                if option ~= nil then
                    if option.class == 'toggle' then
                        option:SetState(value == nil and false or (value == 1 and true or false));
                    elseif option.class == 'slider' then
                        option:SetValue(value == nil and 0 or value)
                    elseif option.class == 'bind' then
                        option:SetBind(value == nil and 'none' or (utility:HasProperty(Enum.KeyCode, value) and Enum.KeyCode[value] or Enum.UserInputType[value]));
                    elseif option.class == 'color' then
                        option:SetColor(value == nil and c3new(1,1,1) or c3new(value[1], value[2], value[3]));
                        option:SetTrans(value == nil and 1 or value[4]);
                    elseif option.class == 'list' then
                        option:Select(value == nil and '' or value);
                    elseif option.class == 'box' then
                        option:SetInput(value == nil and '' or value)
                    end
                end
            end
            setByConfig = false
        end)

    end

    function self:SaveConfig(name)
        if not self:GetConfig(name) then
            return
        end

        local s,e = pcall(function()
            local cfg = {};
            for flag,option in next, self.options do
                if option.class == 'toggle' then
                    cfg[flag] = option.state and 1 or 0;
                elseif option.class == 'slider' then
                    cfg[flag] = option.value;
                elseif option.class == 'bind' then
                    cfg[flag] = option.bind.Name;
                elseif option.class == 'color' then
                    cfg[flag] = {
                        option.color.r,
                        option.color.g,
                        option.color.b,
                        option.trans,
                    }
                elseif option.class == 'list' then
                    cfg[flag] = option.selected;
                elseif option.class == 'box' then
                    cfg[flag] = option.input
                end
            end
            writefile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext, http:JSONEncode(cfg));
        end)
    end

    for i,v in next, self.images do
        if not isfile(self.cheatname..'/assets/'..i..'.oh') then
            writefile(self.cheatname..'/assets/'..i..'.oh', game:HttpGet(v))
        end
        self.images[i] = readfile(self.cheatname..'/assets/'..i..'.oh');
    end


    local screenGui = Instance.new('ScreenGui');
    if syn then syn.protect_gui(screenGui); end
    screenGui.Parent = game:GetService('CoreGui');
    screenGui.Enabled = true;
    utility:Instance('ImageButton', {
        Parent = screenGui,
        Visible = true,
        Modal = true,
        Size = UDim2.new(1,0,1,0),
        ZIndex = 9999999999,
        Transparency = 1;
    })

    utility:Connection(library.unloaded, function()
        screenGui:Destroy()
    end)

    utility:Connection(inputservice.InputBegan, function(input, gpe)
        if self.hasInit then
            if input.KeyCode == self.toggleKey and not library.opening and not gpe then
                self:SetOpen(not self.open)
                task.spawn(function()
                    library.opening = true;
                    task.wait(.15);
                    library.opening = false;
                end)
            end
            if library.open then
                local hoverObj = utility:GetHoverObject();
                local hoverObjData = library.drawings[hoverObj];
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    mb1down = true;
                    button1down:Fire()
                    if hoverObj and hoverObjData then
                        hoverObjData.MouseButton1Down:Fire(inputservice:GetMouseLocation())
                    end

                    -- // Update Sliders Click
                    if library.draggingSlider ~= nil then
                        local rel = inputservice:GetMouseLocation() - library.draggingSlider.objects.background.Object.Position;
                        local val = utility:ConvertNumberRange(rel.X, 0 , library.draggingSlider.objects.background.Object.Size.X, library.draggingSlider.min, library.draggingSlider.max);
                        library.draggingSlider:SetValue(val)
                    end

                elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                    if hoverObj and hoverObjData then
                        hoverObjData.MouseButton2Down:Fire(inputservice:GetMouseLocation())
                    end
                end
            end
        end
    end)

    utility:Connection(inputservice.InputEnded, function(input, gpe)
        if self.hasInit and library.open then
            local hoverObj = utility:GetHoverObject();
            local hoverObjData = library.drawings[hoverObj];

            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                mb1down = false;
                button1up:Fire();
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton1Up:Fire(inputservice:GetMouseLocation())
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton2Up:Fire(inputservice:GetMouseLocation())
                end
            end
        end
    end)

    utility:Connection(inputservice.InputChanged, function(input, gpe)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if library.open then
                mousemove:Fire(inputservice:GetMouseLocation());

                if library.CurrentTooltip ~= nil then
                    local mousePos = inputservice:GetMouseLocation()
                    tooltipObjects.background.Position = UDim2.new(0,mousePos.X + 15,0,mousePos.Y + 15)
                    tooltipObjects.background.Size = UDim2.new(0,tooltipObjects.text.TextBounds.X + 6 + (library.CurrentTooltip.risky and 60 or 0),0,tooltipObjects.text.TextBounds.Y + 2)
                end

                local hoverObj = utility:GetHoverObject();
                for _,v in next, library.drawings do
                    local hover = hoverObj == v.Object;
                    if hover and not v.Hover then
                        v.Hover = true;
                        v.MouseEnter:Fire(inputservice:GetMouseLocation());
                    elseif not hover and v.Hover then
                        v.Hover = false;
                        v.MouseLeave:Fire(inputservice:GetMouseLocation());
                    end
                end

                if mb1down then

                    -- // Update Sliders Drag
                    if library.draggingSlider ~= nil then
                        local rel = inputservice:GetMouseLocation() - library.draggingSlider.objects.background.Object.Position;
                        local val = utility:ConvertNumberRange(rel.X, 0 , library.draggingSlider.objects.background.Object.Size.X, library.draggingSlider.min, library.draggingSlider.max);
                        library.draggingSlider:SetValue(val)
                    end

                end
            end
        end
    end)
    
    function self:SetOpen(bool)
        self.open = bool;
        screenGui.Enabled = bool;

        if bool and library.flags.disablemenumovement then
            actionservice:BindAction(
                'FreezeMovement',
                function()
                    return Enum.ContextActionResult.Sink
                end,
                false,
                unpack(Enum.PlayerActions:GetEnumItems())
            )
        else
            actionservice:UnbindAction('FreezeMovement');
        end

        for _,window in next, self.windows do
            window:SetOpen(bool);
        end

        library.CurrentTooltip = nil;
        tooltipObjects.background.Visible = false
    end

    function self.UpdateThemeColors()
        for _,v in next, library.drawings do
            if v.ThemeColor and library.theme[v.ThemeColor] then
                v.Object.Color = utility:AddRGB(library.theme[v.ThemeColor],fromrgb(v.ThemeColorOffset,v.ThemeColorOffset,v.ThemeColorOffset))
            end
            if v.ThemeColorOutline and library.theme[v.ThemeColorOutline] then
                v.Object.OutlineColor = utility:AddRGB(library.theme[v.ThemeColorOutline],fromrgb(v.OutlineThemeColorOffset,v.OutlineThemeColorOffset,v.OutlineThemeColorOffset))
            end
        end
    end

    function self:SendNotification(message, time, color)
        time = time or 5
        if typeof(message) ~= 'string' then
            return error(string.format('invalid message type, got %s, expected string', typeof(message)))
        elseif typeof(time) ~= 'number' then
            return error(string.format('invalid time type, got %s, expected number', typeof(time)))
        elseif color ~= nil and typeof(color) ~= 'Color3' then
            return error(string.format('invalid color type, got %s, expected color3', typeof(time)))
        end

        local notification = {};

        self.notifications[notification] = true

        do
            local objs = notification;
            local z = self.zindexOrder.notification;

            notification.holder = utility:Draw('Square', {
                Position = newUDim2(0, 0, 0, 75);
                Transparency = 0;
            })
            
            notification.background = utility:Draw('Square', {
                Size = newUDim2(1,0,1,0);
                Position = newUDim2(0, -500, 0, 0);
                Parent = notification.holder;
                ThemeColor = 'Background';
                ZIndex = z;
            })

            notification.border1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 2';
                Parent = notification.background;
                ZIndex = z-1;
            })

            objs.border2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                Parent = objs.border1;
                ZIndex = z-2;
            })

            notification.gradient = utility:Draw('Image', {
                Size = newUDim2(1,0,1,0);
                Data = self.images.gradientp90;
                Parent = notification.background;
                Transparency = .5;
                ZIndex = z+1;
            })

            notification.accentBar = utility:Draw('Square',{
                Size = newUDim2(0,5,1,4);
                Position = newUDim2(0,0,0,-2);
                Parent = notification.background;
                ThemeColor = color == nil and 'Accent' or '';
                ZIndex = z+5;
            })

            notification.text = utility:Draw('Text', {
                Position = newUDim2(0,13,0,2);
                ThemeColor = 'Primary Text';
                Text = message;
                Outline = true;
                Font = 2;
                Size = 13;
                ZIndex = z+4;
                Parent = notification.background;
            })

            if color then
                notification.accentBar.Color = color;
            end

        end

        function notification:Remove()
            library.notifications[notification] = nil;
            self.holder:Remove();
            library:UpdateNotifications()
        end

        task.spawn(function()
            self:UpdateNotifications();
            notification.background.Size = newUDim2(0, notification.text.TextBounds.X + 20, 0, 19)
            task.wait();
            utility:Tween(notification.background, 'Position', newUDim2(0,0,0, 0), .1);
            task.wait(time);
            for i,v in next, notification do
                if typeof(v) ~= 'function' then
                    utility:Tween(v, 'Transparency', 0, .15);
                end
            end
            utility:Connection(utility:Tween(notification.background, 'Position', newUDim2(0,-500,0, 0), .25).Completed, (function()
                notification:Remove();
            end))
        end)

    end

    function self:UpdateNotifications()
        local i = 0
        for v in next, self.notifications do
            utility:Tween(v.holder, 'Position', newUDim2(0,0,0, 75 + (i * 30)), .15)
            i += 1
        end
    end

    function self.NewIndicator(data)
        local indicator = {
            title = data.title or 'indicator',
            enabled = data.enabled or false,
            position = data.position or newUDim2(0,15,0,300),
            values = {},
            objects = {valueObjects = {}},
            spacing = '   ',
        };

        table.insert(self.indicators, indicator)

        -- Create Objects --
        do
            local z = self.zindexOrder.indicator;
            local objs = indicator.objects;

            objs.background = utility:Draw('Square', {
                Size = newUDim2(0, 200, 0, 16);
                Position = indicator.position;
                ThemeColor = 'Background';
                ZIndex = z;
            })

            objs.border1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 2';
                Parent = objs.background;
                ZIndex = z-1;
            })

            objs.border2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                Parent = objs.border1;
                ZIndex = z-2;
            })

            objs.topborder = utility:Draw('Square', {
                Size = newUDim2(1,0,0,1);
                ThemeColor = 'Accent';
                Parent = objs.background;
                ZIndex = z+1;
            })

            objs.textlabel = utility:Draw('Text', {
                Position = newUDim2(.5,0,0,1);
                ThemeColor = 'Primary Text';
                Text = indicator.title;
                Size = 13;
                Font = 2;
                ZIndex = z+2;
                Center = true;
                Outline = true;
                Parent = objs.background;
            });

        end
        --------------------

        function indicator:Update()
            local xSize  = 125
            local yPos  = 0
            table.sort(self.values, function(a,b)
                return a.order < b.order;
            end)

            for _,v in next, self.values do
                v.objects.keyLabel.Text = tostring(v.key);
                v.objects.valueLabel.Text = tostring(v.value);
            
                v.objects.valueLabel.Position = newUDim2(1,-(v.objects.valueLabel.TextBounds.X + 3),0,0)
                v.objects.background.Position = newUDim2(0,0,1,3 + yPos)
                v.objects.background.Visible = v.enabled

                if v.enabled then
                    yPos = yPos + 16 + 3
                    local x = (v.objects.keyLabel.TextBounds.X + 10 + v.objects.valueLabel.TextBounds.X)
                    if x > xSize then
                        xSize = x
                    end
                end
            end

            self.objects.background.Size = newUDim2(0,xSize + 8,0,16)
            self.objects.background.Position = self.position
        end

        function indicator:AddValue(data)
            local value = {
                key = data.key or '',
                value = data.value or '',
                order = data.order or #self.values+1,
                enabled = data.enabled == nil and true or data.enabled,
                objects = {},
            }

            table.insert(self.values, value);

            -- Create Objects --
            do
                local z = library.zindexOrder.indicator;
                local objs = value.objects;

                objs.background = utility:Draw('Square', {
                    Size = newUDim2(1, 0, 0, 16);
                    ThemeColor = 'Background';
                    ZIndex = z;
                    Parent = indicator.objects.background;
                })
    
                objs.border1 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 2';
                    Parent = objs.background;
                    ZIndex = z-1;
                })
    
                objs.border2 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 3';
                    Parent = objs.border1;
                    ZIndex = z-2;
                })
    
                objs.keyLabel = utility:Draw('Text', {
                    Position = newUDim2(0,3,0,1);
                    ThemeColor = 'Option Text 2';
                    Size = 13;
                    Font = 2;
                    ZIndex = z+2;
                    Outline = true;
                    Parent = objs.background;
                });

                objs.valueLabel = utility:Draw('Text', {
                    Position = newUDim2(0,0,0,1);
                    ThemeColor = 'Option Text 2';
                    Size = 13;
                    Font = 2;
                    ZIndex = z+2;
                    Outline = true;
                    Parent = objs.background;
                });

            end
            --------------------

            function value:Remove()
                table.remove(indicator.values, table.find(indicator.values, value))
                self.objects.background:Remove()
                table.clear(self)
                indicator:Update();
            end

            function value:SetEnabled(bool)
                if typeof(bool) == 'boolean' then
                    self.enabled = bool
                    indicator:Update()
                end
            end

            function value:SetValue(str)
                if typeof(str) == 'string' then
                    self.value = str
                    indicator:Update()
                end
            end

            function value:SetKey(str)
                if typeof(str) == 'string' then
                    self.key = str
                    indicator:Update()
                end
            end

            self:Update()
            return value
        end

        function indicator:GetValue(idx)
            if typeof(idx) == 'number' then
                return self.values[idx]
            else
                for i,v in next, self.values do
                    if v.key == idx then
                        return v
                    end
                end
            end
        end

        function indicator:SetEnabled(bool)
            if typeof(bool) == 'boolean' then
                self.enabled = bool;
                self.objects.background.Visible = bool;
                self:Update();
            end
        end

        function indicator:SetPosition(udim2)
            if typeof(udim2) == 'UDim2' then
                self.position = udim2
                self.objects.background.Position = udim2;
            end
        end

        for i,v in next, data.values or {} do
            indicator:AddValue({key = tostring(i), value = tostring(v)})
        end

        indicator:SetEnabled(indicator.enabled);
        return indicator
    end

    function library:CreateSettingsTab(menu)
        local settingsTab = menu:AddTab('Settings', 999);
        local configSection = settingsTab:AddSection('Config', 2);
        local mainSection = settingsTab:AddSection('Main', 1);
        local creditsSection = settingsTab:AddSection('Credits', 2);
        creditsSection:AddSeparator({text = 'Owners/Developers'});
        creditsSection:AddText({text = "xss_vulns"})
        creditsSection:AddText({text = "fluxware"})
            creditsSection:AddText({text = "clumzo"})




        configSection:AddBox({text = 'Config Name', flag = 'configinput'})
        configSection:AddList({text = 'Config', flag = 'selectedconfig'})

        local function refreshConfigs()
            library.options.selectedconfig:ClearValues();
            for _,v in next, listfiles(self.cheatname..'/'..self.gamename..'/configs') do
                local ext = '.'..v:split('.')[#v:split('.')];
                if ext == self.fileext then
                    library.options.selectedconfig:AddValue(v:split('\\')[#v:split('\\')]:sub(1,-#ext-1))
                end
            end
        end

        configSection:AddButton({text = 'Load', confirm = false, callback = function()
            library:LoadConfig(library.flags.selectedconfig);
        end}):AddButton({text = 'Save', confirm = true, callback = function()
            library:SaveConfig(library.flags.selectedconfig);
        end})

        configSection:AddButton({text = 'Create', confirm = false, callback = function()
            if library.flags.configinput == "" then 
                return
            end
            if library:GetConfig(library.flags.configinput) then
                return
            end
            writefile(self.cheatname..'/'..self.gamename..'/configs/'..library.flags.configinput.. self.fileext, http:JSONEncode({}));
            refreshConfigs()
        end}):AddButton({text = 'Delete', confirm = true, callback = function()
            if library:GetConfig(library.flags.selectedconfig) then
                delfile(self.cheatname..'/'..self.gamename..'/configs/'..library.flags.selectedconfig.. self.fileext);
                refreshConfigs()
            end
        end})

        refreshConfigs()

        mainSection:AddBind({text = 'Open / Close', flag = 'togglebind', nomouse = true, noindicator = true, bind = Enum.KeyCode.RightShift, callback = function()
            library:SetOpen(not library.open)
        end});

        mainSection:AddToggle({text = 'Disable Movement If Open', flag = 'disablemenumovement', callback = function(bool)
            if bool and library.open then
                actionservice:BindAction(
                    'FreezeMovement',
                    function()
                        return Enum.ContextActionResult.Sink
                    end,
                    false,
                    unpack(Enum.PlayerActions:GetEnumItems())
                )
            else
                actionservice:UnbindAction('FreezeMovement');
            end
        end})

        mainSection:AddButton({text = 'Join Discord', flag = 'joindiscord', confirm = true, callback = function()
            local res = syn.request({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = game:GetService('HttpService'):JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game:GetService('HttpService'):GenerateGUID(false),
                    args = {code = getgenv().Config.Invite}
                })
            })
        end})
        
        mainSection:AddButton({text = 'Copy Discord', flag = 'copydiscord', callback = function()
            setclipboard('https://discord.gg/'..getgenv().Config.Invite)
        end})

        mainSection:AddButton({text = 'Rejoin Server', confirm = true, callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId);
        end})

        mainSection:AddButton({text = 'Copy Join Script', callback = function()
            setclipboard(([[game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s")]]):format(game.PlaceId, game.JobId))
        end})

        mainSection:AddButton({text = 'Unload', confirm = true, callback = function()
            library:Unload();
        end})

        mainSection:AddSeparator({text = 'Keybinds'});
        mainSection:AddToggle({text = 'Keybind Indicator', flag = 'keybind_indicator', callback = function(bool)
            library.keyIndicator:SetEnabled(bool);
        end})
        mainSection:AddSlider({text = 'Position X', flag = 'keybind_indicator_x', min = 0, max = 100, increment = .1, value = .5, callback = function()
            library.keyIndicator:SetPosition(newUDim2(library.flags.keybind_indicator_x / 100, 0, library.flags.keybind_indicator_y / 100, 0));    
        end});
        mainSection:AddSlider({text = 'Position Y', flag = 'keybind_indicator_y', min = 0, max = 100, increment = .1, value = 35, callback = function()
            library.keyIndicator:SetPosition(newUDim2(library.flags.keybind_indicator_x / 100, 0, library.flags.keybind_indicator_y / 100, 0));    
        end});

        local themeStrings = {};
        for _,v in next, library.themes do
            table.insert(themeStrings, v.name)
        end
        local themeSection = settingsTab:AddSection('Theme', 1);
        local setByPreset = false

        themeSection:AddList({text = 'Presets', flag = 'preset_theme', values = themeStrings, callback = function(newTheme)
            setByPreset = true
            for _,v in next, library.themes do
                if v.name == newTheme then
                    for x, d in pairs(library.options) do
                        if v.theme[tostring(x)] ~= nil then
                            d:SetColor(v.theme[tostring(x)])
                        end
                    end
                    library:SetTheme(v.theme)
                    break
                end
            end
            setByPreset = false
        end}):Select('Default');

        return settingsTab;
    end

    -- ESP SYSTEM
library.esp = {
    enabled = false,
    box = false,
    box_filled = false,
    health = false,
    name = false,
    distance = false,
    weapon = false,
    color_box = Color3.new(1, 0, 0),
    color_box_filled = Color3.new(1, 0, 0),
    color_health = Color3.new(0, 1, 0),
    color_name = Color3.new(1, 1, 1),
    color_distance = Color3.new(1, 1, 0),
    color_weapon = Color3.new(0, 1, 1),
    objects = {},
}

local function esp_clear()
    for _,obj in pairs(library.esp.objects) do
        if obj and obj.Remove then pcall(function() obj:Remove() end) end
    end
    library.esp.objects = {}
end

local function esp_draw()
    esp_clear()
    if not library.esp.enabled then return end
    for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            local pos, onscreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
            if onscreen then
                local size = Vector2.new(40, 60)
                local topLeft = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
                local boxObj, boxFilledObj, healthObj, nameObj, distObj, weaponObj

                if library.esp.box then
                    boxObj = library.utility:Draw('Square', {
                        Size = size,
                        Position = topLeft,
                        Color = library.esp.color_box,
                        Thickness = 2,
                        Filled = false,
                        ZIndex = 10000,
                    })
                end
                if library.esp.box_filled then
                    boxFilledObj = library.utility:Draw('Square', {
                        Size = size,
                        Position = topLeft,
                        Color = library.esp.color_box_filled,
                        Transparency = 0.5,
                        Filled = true,
                        ZIndex = 9999,
                    })
                end
                if library.esp.health and plr.Character:FindFirstChild("Humanoid") then
                    local hp = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth
                    healthObj = library.utility:Draw('Square', {
                        Size = Vector2.new(4, size.Y * hp),
                        Position = Vector2.new(topLeft.X - 6, topLeft.Y + size.Y * (1-hp)),
                        Color = library.esp.color_health,
                        Filled = true,
                        ZIndex = 10001,
                    })
                end
                if library.esp.name then
                    nameObj = library.utility:Draw('Text', {
                        Position = Vector2.new(pos.X, topLeft.Y - 14),
                        Text = plr.DisplayName or plr.Name,
                        Color = library.esp.color_name,
                        Center = true,
                        Size = 13,
                        Outline = true,
                        ZIndex = 10002,
                    })
                end
                if library.esp.distance then
                    local dist = (hrp.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
                    distObj = library.utility:Draw('Text', {
                        Position = Vector2.new(pos.X, topLeft.Y + size.Y + 2),
                        Text = string.format("%.1fm", dist),
                        Color = library.esp.color_distance,
                        Center = true,
                        Size = 13,
                        Outline = true,
                        ZIndex = 10002,
                    })
                end
                if library.esp.weapon then
                    local tool = plr.Character:FindFirstChildOfClass("Tool")
                    weaponObj = library.utility:Draw('Text', {
                        Position = Vector2.new(pos.X, topLeft.Y + size.Y + 16),
                        Text = tool and tool.Name or "",
                        Color = library.esp.color_weapon,
                        Center = true,
                        Size = 13,
                        Outline = true,
                        ZIndex = 10002,
                    })
                end

                table.insert(library.esp.objects, boxObj)
                table.insert(library.esp.objects, boxFilledObj)
                table.insert(library.esp.objects, healthObj)
                table.insert(library.esp.objects, nameObj)
                table.insert(library.esp.objects, distObj)
                table.insert(library.esp.objects, weaponObj)
            end
        end
    end
end

-- ESP update loop
library.utility:Connection(runservice.RenderStepped, function()
    esp_draw()
end)

function library:CreateESPSection(tab)
    local section = tab:AddSection('ESP', 1)
    section:AddToggle({
        text = "ESP Enabled",
        flag = "esp_enabled",
        callback = function(v)
            library.esp.enabled = v
        end
    })
    section:AddToggle({
        text = "ESP Box",
        flag = "esp_box",
        callback = function(v)
            library.esp.box = v
        end
    })
    section:AddColor({
        text = "Box Color",
        flag = "esp_box_color",
        color = library.esp.color_box,
        callback = function(c)
            library.esp.color_box = c
        end
    })
    section:AddToggle({
        text = "ESP Box Filled",
        flag = "esp_box_filled",
        callback = function(v)
            library.esp.box_filled = v
        end
    })
    section:AddColor({
        text = "Box Filled Color",
        flag = "esp_box_filled_color",
        color = library.esp.color_box_filled,
        callback = function(c)
            library.esp.color_box_filled = c
        end
    })
    section:AddToggle({
        text = "ESP Health",
        flag = "esp_health",
        callback = function(v)
            library.esp.health = v
        end
    })
    section:AddColor({
        text = "Health Color",
        flag = "esp_health_color",
        color = library.esp.color_health,
        callback = function(c)
            library.esp.color_health = c
        end
    })
    section:AddToggle({
        text = "ESP Name",
        flag = "esp_name",
        callback = function(v)
            library.esp.name = v
        end
    })
    section:AddColor({
        text = "Name Color",
        flag = "esp_name_color",
        color = library.esp.color_name,
        callback = function(c)
            library.esp.color_name = c
        end
    })
    section:AddToggle({
        text = "ESP Distance",
        flag = "esp_distance",
        callback = function(v)
            library.esp.distance = v
        end
    })
    section:AddColor({
        text = "Distance Color",
        flag = "esp_distance_color",
        color = library.esp.color_distance,
        callback = function(c)
            library.esp.color_distance = c
        end
    })
    section:AddToggle({
        text = "ESP Weapon",
        flag = "esp_weapon",
        callback = function(v)
            library.esp.weapon = v
        end
    })
    section:AddColor({
        text = "Weapon Color",
        flag = "esp_weapon_color",
        color = library.esp.color_weapon,
        callback = function(c)
            library.esp.color_weapon = c
        end
    })
    return section
end

-- ...existing code...
