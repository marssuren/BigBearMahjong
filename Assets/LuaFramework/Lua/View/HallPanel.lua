
local gameObject
local transform

HallPanel={}
local this=HallPanel
function HallPanel.Awake(_gameObject)
	gameObject=_gameObject
	transform=gameObject.transform
	this.InitPanel()
end

function HallPanel.InitPanel()
	this.CreateRoomBtn=transform:FindChild("CreateRoomBtn").gameObject		--获取"创建房间"按钮
	this.EnterRoomBtn=transform:FindChild("EnterRoomBtn").gameObject		--获取"进入房间"按钮
	this.SettingBtn=transform:FindChild("ConfigBtn").gameObject				--获取"设置"按钮
	this.RuleBtn=transform:FindChild("GuidBtns/Grid/RuleBtn").gameObject				--获取"规则"按钮
	this.TeahouseBtn=transform:FindChild("GuidBtns/Grid/TeahouseBtn").gameObject		--获取"茶馆"按钮
	this.RecordBtn=transform:FindChild("GuidBtns/Grid/RecordBtn").gameObject		--获取"战绩"按钮
	this.ShareBtn=transform:FindChild("GuidBtns/Grid/ShareBtn").gameObject			--获取"分享"按钮
	this.AnnouncementBtn=transform:FindChild("GuidBtns/Grid/AnnouncementBtn").gameObject		--获取"公告"按钮


	this.UserNickname=transform:FindChild("UserInfoArea/UserNickNameBG/UserNickNameLable").gameObject	--获取用户昵称
	this.UserIcon=transform:FindChild("UserInfoArea/UserIconBG/UserIcon").gameObject			--获取用户图标
	this.RoomCardCount=transform:FindChild("UserInfoArea/RoomCardBG/RoomCardCount").gameObject	--获取用户房卡数量
	this.AddRoomCardBtn=transform:FindChild("UserInfoArea/RoomCardBG/AddRoomCardBtn").gameObject	--获取增加房卡按钮


end

function HallPanel.Start()

end

function HallPanel.OnDestroy()
	
end








