using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraManager : MonoBehaviour
{
	[SerializeField]
	private GameObject uiCamera;
	void Start()
	{
		uiCamera.SetActive(false);//仅在编辑器中使用的摄像机，游戏运行后隐藏
	}
}
