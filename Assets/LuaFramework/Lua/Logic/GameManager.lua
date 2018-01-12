
require "Common/define"



local gameObject
local transform
local WWW=UnityEngine.WWW

GameManager={}
local this =GameManager


function GameManager.InitViewPanels()
	for	i=1,#PanelNames	do
		require	("View/"..tostring(PanelNames[i]))
	end
end

function GameManager.InitOK()
	AppConst.SocketPort = 2012;
    AppConst.SocketAddress = "117.80.69.120";
	
    networkMgr:SendConnect();

	this.InitViewPanels();
end


function GameManager.EnterRoom()								--进入房间
	local tCreateRoomCtrl=CtrlManager.GetCtrl(CtrlNames.CreateRoom)
	tCreateRoomCtrl:Hide()
	local tEnterRoomCtrl=CtrlManager.GetCtrl(CtrlNames.EnterRoom)
	tEnterRoomCtrl:Hide()
	local tGameMainCtrl=CtrlManager.GetCtrl(CtrlNames.GameMain)
	tGameMainCtrl:Show()

	local tRoomInfo={
		PlayerId=GameModel:GetMyPlayerDto().Id,			--发送自身Id
		RoomId=GameModel:GetMatchRoomDto().RoomId,		--发送房间号
	}
	local tStr=JsonEncode(tRoomInfo)

	networkMgr:SendSocketMessage(OpCode.Room,SubCode.RequestRoomPlayers_ClientReq,tStr)	--请求服务器房间内玩家信息



end