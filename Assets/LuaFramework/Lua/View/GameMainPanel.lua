GameMainPanel={}
local this=GameMainPanel


local gameObject;
local transform

function GameMainPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function GameMainPanel.InitPanel()
    this.MicphoneBtn=transform:Find("MicphoneBtn").gameObject       --获取麦克风按钮
    this.MessageBtn=transform:Find("MessageBtn").gameObject         --获取消息按钮
    this.ReadyBtn=transform:Find("ReadyBtn").gameObject             --获取"准备游戏"按钮
    this.InviteFriendsBtn=transform:Find("InviteFriendsBtn").gameObject --获取"邀请好友"按钮
    this.ExitRoomBtn=transform:Find("ExitRoomBtn").gameObject       --获取"退出房间"按钮
    this.DismissRoomBtn=transform:Find("DismissRoomBtn").gameObject --获取"解散牌局"按钮

    this.PlayerLeft=transform:Find("PlayerInfo/PlayerLeft").gameObject  --获取左边玩家
    this.PlayerRight=transform:Find("PlayerInfo/PlayerRight").gameObject  --获取右边玩家
    this.PlayerOpposite=transform:Find("PlayerInfo/PlayerOpposite").gameObject  --获取对面玩家
    this.Self=transform:Find("PlayerInfo/Self").gameObject  --获取自身

    this.PlayerLeftNicknameLabel=this.PlayerLeft.transform:Find("PlayerNicknameLabel").gameObject   --获取左边玩家昵称
    this.PlayerRightNicknameLabel=this.PlayerRight.transform:Find("PlayerNicknameLabel").gameObject --获取右边玩家昵称
    this.PlayerOppositeNicknameLabel=this.PlayerOpposite.transform:Find("PlayerNicknameLabel").gameObject   --获取对面玩家昵称
    this.SelfNicknameLabel= this.Self.transform:Find("PlayerNicknameLabel").gameObject  --获取自身昵称

    this.PlayerLeftIcon=this.PlayerLeft.transform:Find("PlayerIcon/PlayerIconSpr").gameObject --获取左边玩家的头像
    this.PlayerRightIcon=this.PlayerRight.transform:Find("PlayerIcon/PlayerIconSpr").gameObject   --获取右边玩家的头像
    this.PlayerOppsiteIcon=this.PlayerOpposite.transform:Find("PlayerIcon/PlayerIconSpr").gameObject  --获取对面玩家的头像
    this.SelfIcon=this.Self.transform:Find("PlayerIcon/PlayerIconSpr").gameObject --获取自身头像



    this.ReadyIcon=transform:Find("ReadyIcon").gameObject           --获取"准备"Icon


end

function GameMainPanel.Start()

end








