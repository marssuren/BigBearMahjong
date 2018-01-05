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

    this.ReadyIcon=transform:Find("ReadyIcon").gameObject           --获取"准备"Icon


end

function GameMainPanel.Start()

end








