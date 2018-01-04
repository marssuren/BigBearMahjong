
CtrlNames = {
	--Prompt = "PromptCtrl",
	Message = "MessageCtrl",
	Hall = "HallCtrl",
	Rule="RuleCtrl",
	Config="ConfigCtrl",
	CreateRoom="CreateRoomCtrl",
	EnterRoom="EnterRoomCtrl",
	Store="StoreCtrl",
	GameMain="GameMainCtrl",
	Login="LoginCtrl",
	Share="ShareCtrl",
}

PanelNames = {
	--"PromptPanel",	
	MessagePanel="MessagePanel",
	HallPanel="HallPanel",
	RulePanel="RulePanel",
	ConfigPanel="ConfigPanel",
	CreateRoomPanel="CreateRoomPanel",
	EnterRoomPanel="EnterRoomPanel",
	StorePanel="StorePanel",
	GameMainPanel="GameMainPanel",
	LoginPanel="LoginPanel",
	SharePanel="SharePanel",
}

--协议类型--
ProtocalType = {
	BINARY = 0,
	PB_LUA = 1,
	PBC = 2,
	SPROTO = 3,
}

--语言类型--
DialectType={
	SuZhouDialect="SuZhouDialect",
	Mandarin="Mandarin",
}


--当前使用的协议类型--
TestProtoType = ProtocalType.BINARY;

Util = LuaFramework.Util;
AppConst = LuaFramework.AppConst;
LuaHelper = LuaFramework.LuaHelper;
ByteBuffer = LuaFramework.ByteBuffer;

resMgr = LuaHelper.GetResManager();
panelMgr = LuaHelper.GetPanelManager();
soundMgr = LuaHelper.GetSoundManager();
networkMgr = LuaHelper.GetNetManager();

WWW = UnityEngine.WWW;
GameObject = UnityEngine.GameObject;
