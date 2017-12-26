ConfigCtrl={}
local this=ConfigCtrl

local gameObject
local transform
local message
local musicManager

function ConfigCtrl.New()
    return this
end

function ConfigCtrl.Awake()
    if gameObject==nil then
        panelMgr:CreatePanel('Config',this.OnCreate)
    else
        this.ChangeShow(true)
    end
end
function ConfigCtrl.OnCreate(_gameObject)
    gameObject=_gameObject
    transform=gameObject.transform
    message=gameObject:GetComponent("LuaBehaviour")

    --按钮绑定事件
    message:AddClick(ConfigPanel.MaskBtn,this.OnMaskBtnClick)

    --音量Slider绑定事件
    message:AddSliderValueChanged(ConfigPanel.MusicVolumeSlider,this.ChangeMusicVolume)
end

function ConfigCtrl.OnMaskBtnClick()   --Mask按钮点击事件
    gameObject:SetActive(false)
end
function ConfigCtrl.ChangeShow(_isShow)     --改变显示状态
    gameObject:SetActive(_isShow)
end
function ConfigCtrl.ChangeMusicVolume(_value)                --改变音乐音量
    --print(_value.."!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    ConfigPanel.MusicManager:GetComponent("AudioSource").volume=_value
end










