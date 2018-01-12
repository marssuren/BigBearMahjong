require "Logic/GameManager"

CreateRoomCtrl={}
local this=CreateRoomCtrl

local gameObject
local transform
local message
local rule="2m3c"      --规则
local isFloatFlower=true     --是否飘花
local roundCount=8      --局数
local payType="AA"      --支付方式


function CreateRoomCtrl.New()
    return this
end

function CreateRoomCtrl.Awake()
    panelMgr:CreatePanel(PanelNames.CreateRoomPanel,this.OnCreate)
end

function CreateRoomCtrl.Show()            --显示面板
    if gameObject==nil then
        this.Awake();
    else
        panelMgr:SetPanelActive(PanelNames.CreateRoomPanel,true,this.OnEnable)
    end
end

function CreateRoomCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.CreateRoomPanel,false)
    end
end

function CreateRoomCtrl.OnEnable()

end

function CreateRoomCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")


    message:AddClick(CreateRoomPanel.MaskBtn,this.OnMaskBtnClick)   --绑定遮罩点击事件
    message:AddClick(CreateRoomPanel.CloseBtn,this.OnCloseBtnClick) --绑定关闭按钮点击事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongToggle,this.OnMixedMahjongToggleValueChanged)
    --绑定花麻将Toggle监听事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongRuleToggle,this.OnMixedMahjongRuleToggleValueChanged)
    --绑定花麻将规则Toggle监听事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongFloatFlowerToggle,this
    .OnMixedMahjongFloatFlowerToggleValueChanged)   --绑定花麻将飘花Toggle监听事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongRoundCountToggle,this
    .OnMixedMahjongRoundCountToggleValueChanged)  --绑定花麻将局数Toggle监听事件
    message:AddToggleValueListener(CreateRoomPanel.MixedMahjongPayTypeToggle,this
    .OnMixedMahjongPayTypeToggleValueChanged)  --绑定花麻将支付方式Toggle监听事件

    --message:AddToggleValueListener(CreateRoomPanel.HundredMatchMahjongToggle,this
    --.OnHundredMatchMahjongToggleValueChanged)
    --绑定百搭麻将Toggle监听事件
    message:AddClick(CreateRoomPanel.CreateBtn,this.OnCreateBtnClick)   --绑定"创建"按钮点击事件
end
function CreateRoomCtrl.OnMaskBtnClick()        --遮罩点击事件
    this.Hide()
end
function CreateRoomCtrl.OnCloseBtnClick()       --关闭按钮点击事件
    this.Hide()
end

function CreateRoomCtrl.OnMixedMahjongToggleValueChanged(_value)        --花麻将Toggle值变化事件
        CreateRoomPanel.MixedMahjongArea:SetActive(_value)
end
function CreateRoomCtrl.OnHundredMatchMahjongToggleValueChanged(_value) --百搭麻将Toggle值变化事件
        CreateRoomPanel.HundredMatchMahjongArea:SetActive(_value)
end
function CreateRoomCtrl.OnMixedMahjongRuleToggleValueChanged(_value)    --"规则"Toggle值变化事件
    if _value then
        rule="2m3c"     --2摸3铳
    else
        rule="3m4c"     --3摸4铳
    end
end
function CreateRoomCtrl.OnMixedMahjongFloatFlowerToggleValueChanged(_value) --"飘花"Toggle值变化事件
    isFloatFlower=_value    --是否飘花
end
function CreateRoomCtrl.OnMixedMahjongRoundCountToggleValueChanged(_value)      --"局数"Toggle值变化事件
    if _value then
        roundCount=8        --8轮
    else
        roundCount=16       --16轮
    end
end
function CreateRoomCtrl.OnMixedMahjongPayTypeToggleValueChanged(_value)   --"支付方式"Toggle值变化事件
    if _value then
        payType="AA"        --AA
    else
        payType="Owner"     --房主支付
    end
end


function CreateRoomCtrl.OnCreateBtnClick()          --"创建"按钮点击事件
    if CreateRoomPanel.MixedMahjongToggle:GetComponent("UIToggle").value then
        print("todo:创建花麻将房间")
        local tCreateRoomInfo={
            RoomType="MixMahjongRoom",
            Rule=rule,
            IsFloatFlower=isFloatFlower,
            RoundCount=roundCount,
            PayType=payType,
        }
        local tStr=JsonEncode(tCreateRoomInfo)      --发送json
        print(tStr)
        networkMgr:SendSocketMessage(OpCode.Room,SubCode.CreateRoom_ClientReq,tStr);
    else if CreateRoomPanel.HundredMatchMahjongToggle:GetComponent("UIToggle").value then
        print("todo:创建百搭麻将房间")

        end
    end



    --this.Hide();
    --GameManager.EnterRoom()          --进入房间
end


