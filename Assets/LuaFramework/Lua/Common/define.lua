
CtrlNames = {
	--Prompt = "PromptCtrl",
	Message = "MessageCtrl",
	Home = "HomeCtrl",
	Rule="RuleCtrl",
	Config="ConfigCtrl",
	CreateRoom="CreateRoomCtrl",
	EnterRoom="EnterRoomCtrl"
}

PanelNames = {
	--"PromptPanel",	
	MessagePanel="MessagePanel",
	HomePanel="HomePanel",
	RulePanel="RulePanel",
	ConfigPanel="ConfigPanel",
	CreateRoomPanel="CreateRoomPanel",
	EnterRoomPanel="EnterRoomPanel",
}

--协议类型--
ProtocalType = {
	BINARY = 0,
	PB_LUA = 1,
	PBC = 2,
	SPROTO = 3,
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
