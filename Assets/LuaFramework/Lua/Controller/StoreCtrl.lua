StoreCtrl={}
local this=StoreCtrl

local gameObject;
local transform;
local message;

function StoreCtrl.New( )
    return this
end
function StoreCtrl.Awake( ... )
    panelMgr:CreatePanel('Store',this.OnCreate)
end
function StoreCtrl.OnCreate( _gameObject )
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    --绑定按钮点击事件
    message:AddClick(StorePanel.MaskBtn,this.OnMaskBtnClick)
    message:AddClick(StorePanel.CloseBtn,this.OnCloseBtnClick)

    message:AddClick(StorePanel.Buy5Btn,this.OnBuy5BtnClick)
    message:AddClick(StorePanel.Buy11Btn,this.OnBuy11BtnClick)
    message:AddClick(StorePanel.Buy22Btn,this.OnBuy22BtnClick)
    message:AddClick(StorePanel.Buy50Btn,this.OnBuy50BtnClick)
    message:AddClick(StorePanel.OrderConfirmTipMaskBtn,this.OnOrderConfirmTipMaskBtnClick)
    message:AddClick(StorePanel.WeChatPayBtn,this.OnWeChatPayBtnClick)

end
function StoreCtrl.Show()
	if nil==gameObject then
		this.Awake()			--无则加载
	else
		panelMgr:SetPanelActive(PanelNames.StorePanel,true,this.OnEnable)	--有则显示
	end

end

function StoreCtrl.Hide()
	if nil~=gameObject then
		panelMgr:SetPanelActive(PanelNames.StorePanel,false)
	end
end

function StoreCtrl.OnEnable()			--页面激活

end
function StoreCtrl.OnMaskBtnClick( ... )        --遮罩按钮点击事件
    this.Hide()
end
function StoreCtrl.OnBuy5BtnClick( ... )        --购买5张房卡按钮点击事件
    print("todo:Buy5BtnClick!")
    StorePanel.CostLabel:GetComponent("UILabel").text="[000000]购买[0000ff]5[-]张房卡，花费[0000ff]25元[-]\n请选择支付方式[-]"
    if StorePanel.OrderConfirmTip.activeSelf==false then
        StorePanel.OrderConfirmTip:SetActive(true)
    end
end
function StoreCtrl.OnBuy11BtnClick( ... )        --购买11张房卡按钮点击事件
    print("todo:Buy11BtnClick!")
    StorePanel.CostLabel:GetComponent("UILabel").text="[000000]购买[0000ff]11[-]张房卡，花费[0000ff]50元[-]\n请选择支付方式[-]"
    if StorePanel.OrderConfirmTip.activeSelf==false then
        StorePanel.OrderConfirmTip:SetActive(true)
    end
end
function StoreCtrl.OnBuy22BtnClick( ... )        --购买22张房卡按钮点击事件
    print("todo:Buy22BtnClick!")
    StorePanel.CostLabel:GetComponent("UILabel").text="[000000]购买[0000ff]22[-]张房卡，花费[0000ff]98元[-]\n请选择支付方式[-]"
    if StorePanel.OrderConfirmTip.activeSelf==false then
        StorePanel.OrderConfirmTip:SetActive(true)
    end
end
function StoreCtrl.OnBuy50BtnClick( ... )        --购买50张房卡按钮点击事件
    print("todo:Buy22BtnClick!")
    StorePanel.CostLabel:GetComponent("UILabel").text="[000000]购买[0000ff]50[-]张房卡，花费[0000ff]200元[-]\n请选择支付方式[-]"
    if StorePanel.OrderConfirmTip.activeSelf==false then
        StorePanel.OrderConfirmTip:SetActive(true)
    end
end
function StoreCtrl.OnOrderConfirmTipMaskBtnClick( ... ) --订单提示遮罩按钮点击事件
    StorePanel.OrderConfirmTip:SetActive(false)
end
function StoreCtrl.OnCloseBtnClick()        --关闭按钮点击事件
    this:Hide()
end
function StoreCtrl.OnWeChatPayBtnClick( ... )   --微信支付按钮点击事件
    print("todo:WeChatPayBtnClick")
end

