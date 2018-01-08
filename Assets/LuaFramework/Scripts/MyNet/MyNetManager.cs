using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Protocol.Code;


public class MyNetManager : MonoBehaviour
{
	public static MyNetManager Instance;
	private ClientPeer clientPeer = new ClientPeer("127.0.0.1", 6666);

	private MatchHandler matchHandler = new MatchHandler();		//用于处理匹配相关操作

	void Awake()
	{
		Instance = this;
	}
	void Start()
	{
		clientPeer.Connect();
	}
	void Update()
	{
		if(null == clientPeer)
		{
			return;
		}

		while(clientPeer.SocketMsgQueue.Count > 0)
		{
			SocketMessage tSocketMessage = clientPeer.SocketMsgQueue.Dequeue();

		}
	}
	private void processSocketMessage(SocketMessage _socketMessage)
	{
		switch (_socketMessage.OpCode)
		{

			case OpCode.FIGHT:

			break;
			//default:
			//	break;
		}
	}
}
