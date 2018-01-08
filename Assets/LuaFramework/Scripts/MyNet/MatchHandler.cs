using System.Collections;
using System.Collections.Generic;
using Protocol.Code;
using UnityEngine;

public class MatchHandler : HandlerBase
{
	public override void OnReceive(int _subCode, object _value)
	{
		switch(_subCode)
		{
			case MatchCode.READY_BRO:

			break;
			default:
			break;
		}
	}
	private void readyBroadcast(int _readyPlayerID)         //收到准备好的广播的回调
	{

	}
}
