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
   this.MaskBtn=transform:Find("Btns/MaskBtn").gameObject

end
function RulePanel.Start()

    
end




















