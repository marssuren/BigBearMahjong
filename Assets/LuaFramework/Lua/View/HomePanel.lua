
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
	this.CreateRoomBtn=transform:FindChild("RoomBtns/CreateRoomBtn").gameObject		--获取"创建房间"按钮
	this.EnterRoomBtn=transform:FindChild("RoomBtns/EnterRoomBtn").gameObject		--获取"进入房间"按钮
	this.SettingBtn=transform:FindChild("TopBtns/SettingBtn").gameObject			--获取"设置"按钮
	this.RuleBtn=transform:FindChild("TopBtns/RuleBtn").gameObject					--获取"规则"按钮

	this.UserNickname=transform:FindChild("UserInfoArea/UserNickname").gameObject	--获取用户昵称
	this.UserIcon=transform:FindChild("UserInfoArea/UserIcon").gameObject			--获取用户图标
	this.RoomCardCount=transform:FindChild("UserInfoArea/RoomCardCount").gameObject	--获取用户房卡数量


end

function HomePanel.Start()

end

function HomePanel.OnDestroy()
	
end








