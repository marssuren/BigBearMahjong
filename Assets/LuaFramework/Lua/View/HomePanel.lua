
local gameObject
local transform

HomePanel={}
local this=HomePanel
function HomePanel.Awake(_gameObject)
	gameObject=_gameObject
	transform=gameObject.transform
	this.InitPanel()
end


function HomePanel.InitPanel()
	this.CreateRoomBtn=transform:FindChild("RoomBtns/CreateRoomBtn").gameObject
	this.EnterRoomBtn=transform:FindChild("RoomBtns/EnterRoomBtn").gameObject
	this.SettingBtn=transform:FindChild("TopBtns/SettingBtn").gameObject
	this.RuleBtn=transform:FindChild("TopBtns/RuleBtn").gameObject
end

function HomePanel.Start()

end

function HomePanel.OnDestroy()
	
end








