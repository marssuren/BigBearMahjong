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
    this.MaskBtn=transform:Find("Btns/MaskBtn").gameObject      --获取Mask
    this.MusicManager=GameObject.Find("MusicManager").gameObject    --获取MusicManager
    this.SoundEffectVolumeSlider=transform:Find("SoundEffectSlider/SoundEffectVolumeSliderBack/SliderThumb").gameObject:GetComponent("UISlider")    --获取音效音量Slider
    this.MusicVolumeSlider=transform:Find("MusicVolumeSlider/MusicVolumeSliderBack/SliderThumb").gameObject:GetComponent("UISlider")    --获取音乐音量Slider
end

function ConfigPanel.Start()

end

