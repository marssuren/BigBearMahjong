using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class HandlerBase               //client处理的基类
{
	public abstract void OnReceive(int _subCode, object _value);
	//protected void DisPatch(int _eventCode, object _message)
	//{

	//}



}
