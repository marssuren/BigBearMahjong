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
    message:AddClick(ConfigPanel.LogoutBtn,this.OnLogoutBtnClick)
    message:AddClick(ConfigPanel.CloseBtn,this.OnCloseBtnClick)
    --音量Slider绑定事件
    message:AddSliderValueChanged(ConfigPanel.MusicVolumeSlider,this.ChangeMusicVolume)
    --语言Toggle绑定事件
    message:AddToggleValueListener(ConfigPanel.SuZhouDialectToggle,this.OnSuZhouDialectToggleValueChange)
    message:AddToggleValueListener(ConfigPanel.MandarinToggle,this.OnMandarinToggleValueChange)


end

function ConfigCtrl.Show()          --显示
    if gameObject==nil then
        this.Awake()
    else
        panelMgr:SetPanelActive(PanelNames.ConfigPanel,true,this.OnEnable)
    end
end

function ConfigCtrl.Hide()          --隐藏
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

function ConfigCtrl.OnSuZhouDialectToggleValueChange(_value)  --"苏州方言"Toggle值改变触发事件
    if _value==true then
        print("todo:改为苏州方言")
        LocalData.Dialect=DialectType.SuZhouDialect
        LocalData.SetString("Dialect",DialectType.SuZhouDialect)
        print(Util.GetString("Dialect","-1"))
        
    end
end
function ConfigCtrl.OnMandarinToggleValueChange(_value)  --"普通话"Toggle值改变触发事件
    if _value==true then
        print("todo:改为普通话")
        LocalData.Dialect=DialectType.Mandarin
        LocalData.SetString("Dialect",DialectType.Mandarin)        
        print(Util.GetString("Dialect","-1"))
    end
end
function ConfigCtrl.OnLogoutBtnClick()          --"退出登录"按钮点击事件
    print("todo:LogoutBtnClick!")
end
function ConfigCtrl.OnCloseBtnClick()           --关闭按钮点击事件
    this.Hide()
end









