StorePanel={}
local this=StorePanel

local gameObject;
local transform;

function StorePanel.Awake(_gameObject )
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function StorePanel.InitPanel( ... )
    this.MaskBtn=transform:Find("Btns/MaskBtn").gameObject
    this.CloseBtn=transform:FindChild("Btns/CloseBtn").gameObject    --获取关闭按钮
    this.Buy5Btn=transform:Find("ShoppingItems/Scroll View/Grid/Buy5/Buy5Btn").gameObject       --获取"购买5张"房卡按钮
    this.Buy11Btn=transform:Find("ShoppingItems/Scroll View/Grid/Buy11/Buy11Btn").gameObject    --获取"购买11张"房卡按钮
    this.Buy22Btn=transform:Find("ShoppingItems/Scroll View/Grid/Buy22/Buy22Btn").gameObject    --获取"购买22张"房卡按钮
    this.Buy50Btn=transform:Find("ShoppingItems/Scroll View/Grid/Buy50/Buy50Btn").gameObject    --获取"购买50张"房卡按钮
    this.OrderConfirmTip=transform:Find("OrderConfirmTip").gameObject   --获取支付面板
    this.OrderConfirmTipMaskBtn=transform:Find("OrderConfirmTip/OrderConfirmTipMaskBtn").gameObject --获取支付面板遮罩
    this.CostLabel=transform:Find("OrderConfirmTip/CostLabel").gameObject   --获取支付信息内容
    this.WeChatPayBtn=transform:Find("OrderConfirmTip/WeChatPayBtn").gameObject --获取微信支付按钮
end
function StorePanel.Start( ... )
    -- body
end


