--Buildin Table
Protocal = {
	Connect		= '101';	--连接服务器
	Exception   = '102';	--异常掉线
	Disconnect  = '103';	--正常断线   
	Message		= '104';	--接收消息

}


OpCode={
	Account=0,
	Room=1,				--对房间的操作
	Battle=2,			--进入房间后的操作
    Match=3,            --开始匹配的操作
}

SubCode={
	Ready_ClientReq=1002,					--准备游戏客户端请求
	Ready_ServerRes=1003,					--准备游戏服务器回应

	CreateRoom_ClientReq=1200,				--创建房间客户端请求
	CreateRoom_ServerRes=1201,				--创建房间服务器回应
	EnterRoom_ClientReq = 1202,				--进入房间客户端请求
	EnterRoom_SuccessServerRes = 1203,		--进入房间成功服务器回应
	EnterRoom_FailServerRes=1206,			--进入房间失败服务器回应
	ExitRoom_ClientReq=1204,				--退出房间客户端请求
	ExitRoom_ServerRes=1205,				--退出房间服务器回应

	RequestRoomPlayers_ClientReq=1400,		--获取房间内玩家的信息的请求
	RequestRoomPlayers_ServerRes=1401,		--获取房间内玩家信息的回应

    EnterMatch_ClientReq=1600,              --开始匹配客户端请求
    EnterMatch_ServerRes=1601,              --开始匹配服务器回应

	Chat_ServerRes=1800,					--聊天服务器回应
}
