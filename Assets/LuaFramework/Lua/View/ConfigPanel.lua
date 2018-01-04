ConfigPanel={}
local this=ConfigPanel

local gameObject
local transform

function ConfigPanel.Awake(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    this.InitPanel()
end
function ConfigPanel.InitPanel()
    this.MaskBtn=transform:Find("MaskBtn").gameObject      --获取Mask
    this.MusicManager=GameObject.Find("MusicManager").gameObject    --获取MusicManager
    this.SoundEffectVolumeSlider=transform:Find("SoundEffectVolumeSlider").gameObject    --获取音效音量Slider
    this.MusicVolumeSlider=transform:Find("MusicVolumeSlider").gameObject    --获取音乐音量Slider
    this.SuZhouDialectToggle=transform:Find("SuZhouDialectToggle").gameObject    --获取"苏州话"Toggle
    this.MandarinToggle=transform:Find("MandarinToggle").gameObject --获取"普通话"Toggle
    this.LogoutBtn=transform:Find("LogoutBtn").gameObject       --获取"退出登录"Btn
    this.CloseBtn=transform:Find("CloseBtn").gameObject     --获取关闭按钮

end

function ConfigPanel.Start()

end

