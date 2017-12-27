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
    panelMgr:CreatePanel('Config',this.OnCreate)
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

function ConfigCtrl.Show()          --显示
    if gameObject==nil then
        this.Awake()
    else
        panelMgr:SetPanelActive(PanelNames.ConfigPanel,true,this.OnEnable)
    end
end

function ConfigCtrl.Hide()
    if nil~=gameObject then
        panelMgr:SetPanelActive(PanelNames.ConfigPanel,false)
    end
end

function ConfigCtrl.OnEnable()			--页面激活

end


function ConfigCtrl.OnMaskBtnClick()   --Mask按钮点击事件
    this.Hide()
end

function ConfigCtrl.ChangeMusicVolume(_value)                --改变音乐音量
    --print(_value.."!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    ConfigPanel.MusicManager:GetComponent("AudioSource").volume=_value
end










