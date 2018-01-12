

GameMainCtrl={}
local this=GameMainCtrl

local gameObject;
local transform;
local message;


function GameMainCtrl.New( )
    return this
end
function GameMainCtrl.Awake( ... )
    panelMgr:CreatePanel(PanelNames.GameMainPanel,this.OnCreate)
end
function GameMainCtrl.OnCreate( _gameObject )
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    --绑定按钮点击事件
    message:AddClick(GameMainPanel.MicphoneBtn,this.OnMicphoneBtnClick)
    message:AddClick(GameMainPanel.MessageBtn,this.OnMessageBtnClick)
    message:AddClick(GameMainPanel.ReadyBtn,this.OnReadyBtnClick)
    message:AddClick(GameMainPanel.DismissRoomBtn,this.OnDismissRoomBtnClick)
    message:AddClick(GameMainPanel.InviteFriendsBtn,this.OnInviteFriendsBtnClick)
    message:AddClick(GameMainPanel.ExitRoomBtn,this.OnExitRoomBtnClick)

end
function GameMainCtrl.OnEnable()			--页面激活

end
function GameMainCtrl.OnDisable()           --页面隐藏

end
function GameMainCtrl:Show()
	if nil==gameObject then
		this.Awake()			--无则加载
	else
		panelMgr:SetPanelActive(PanelNames.GameMainPanel,true,this.OnEnable)	--有则显示
	end

end

function GameMainCtrl:Hide()
	if nil~=gameObject then
		panelMgr:SetPanelActive(PanelNames.GameMainPanel,false,this.OnDisable)
	end
end





function GameMainCtrl.OnMicphoneBtnClick( ... )          --Micphone按钮点击事件
    print("todo:MicphoneBtnClick！")
end
function GameMainCtrl.OnMessageBtnClick( ... )           --MessageBtn按钮点击事件
    print("todo:MessageBtnClick！")
end
function GameMainCtrl.OnReadyBtnClick()                  --准备按钮点击事件
    networkMgr:SendSocketMessage(OpCode.Battle,SubCode.Ready_ClientReq,GameModel:GetMyPlayerDto().ID)



end
function GameMainCtrl.OnInviteFriendsBtnClick( ... )           --"邀请好友"按钮点击事件
    print("todo:InviteFriendsBtnClick！")
end
function GameMainCtrl.OnDismissRoomBtnClick( ... )           --"解散房间"按钮点击事件
    print("todo:DismissRoomBtnClick！")
end
function GameMainCtrl.OnExitRoomBtnClick( ... )           --"退出房间"按钮点击事件
    print("todo:ExitRoomBtnClick！")
    local tExitRoomInfo={
        RoomId=GameModel:GetMatchRoomDto().RoomId,
    }
    local tStr=JsonEncode(tExitRoomInfo)
    networkMgr:SendSocketMessage(OpCode.Room,SubCode.ExitRoom_ClientReq,tStr)
end

function GameMainCtrl:RefreshUIInfo()                       --刷新UI信息
    GameMainPanel.ReadyBtn:SetActive(not GameModel:GetMyPlayerDto().IsReady)
    GameMainPanel.ReadyIcon:SetActive(GameModel:GetMyPlayerDto().IsReady)
end
















