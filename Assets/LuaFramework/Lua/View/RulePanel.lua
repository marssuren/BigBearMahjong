local gameObject
local transform


RulePanel={}
local this=RulePanel

function RulePanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function RulePanel.InitPanel()
    this.MaskBtn=transform:Find("MaskBtn").gameObject       --获取遮罩
    this.CloseBtn=transform:Find("CloseBtn").gameObject     --获取关闭按钮
    this.ChangShuMahjongToggle=transform:Find("ChangShuMahjong/Toggle").gameObject --获取"常熟麻将"Toggle
    this.HongZhongMahjongToggle=transform:Find("HongZhongMahjong/Toggle").gameObject   --获取"红中麻将"Toggle
    this.ChangShuMahjongRuleContent=transform:Find("ChangShuMahjongRuleContent").gameObject    --获取常熟麻将规则介绍区域
    this.HongZhongMahjongRuleContent=transform:Find("HongZhongMahjongRuleContent").gameObject    --获取红中麻将规则介绍区域

end
function RulePanel.Start()

    
end




















