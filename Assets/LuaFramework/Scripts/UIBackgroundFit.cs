using UnityEngine;
using System.Collections;

public class UIBackgroundFit : MonoBehaviour
{
    void Start()
    {
		//gameContainer = MainPanelLogic.m_pIns.GameContainer;

        AdaptiveUI();
    }
    //public UISprite[] BG;
    //public UISprite[] BG_Manual;
    public Transform[] LastBG;
    private UIWidget gameContainer;

    public static readonly int ManualWidth = 480;
    public static readonly int ManualHeight = 800;

    private void AdaptiveUI()
    {
		//if ((float)Screen.width / (float)Screen.height < (float)ManualWidth / (float)ManualHeight)      //手机时
		//{
		//    gameContainer.width = Mathf.RoundToInt(System.Convert.ToSingle(ManualHeight) / Screen.height * Screen.width);

		//    for (int i = 0; i < BG.Length; i++)
		//    {
		//        if (BG[i] != null)
		//        {
		//            BG[i].width = Mathf.RoundToInt(System.Convert.ToSingle(ManualHeight) / Screen.height * Screen.width);
		//        }
		//    }
		//}

		////调整底图大小
		//for (int i = 0; i < BG_Manual.Length; i++)
		//{
		//	BG_Manual[i].width = (int)((float)ManualHeight / (float)Screen.height * (float)Screen.width) + 3;
		//	BG_Manual[i].height = (int)((float)BG_Manual[i].width / (float)Screen.width * (float)Screen.height);
		//}
		for (int i = 0; i < LastBG.Length; i++)
        {
            float tScaleX = (float)Screen.width / (float)Screen.height * 1.67f * (float)LastBG[i].localScale.y;
            //Debug.Log("tScaleX = " + tScaleX + "，LastBG[i].localScale.y = " + LastBG[i].localScale.y + "，(float)Screen.height = " + (float)Screen.height + "， Screen.width = " + (float)Screen.width);
            LastBG[i].localScale = new Vector3(tScaleX, LastBG[i].localScale.y, 1);
        }
    }

	public static void AdaptiveBG(UISprite _bg)
	{
		if((float)Screen.width / (float)Screen.height < (float)ManualWidth / (float)ManualHeight)      //手机时
		{
			if(_bg != null)
			{
				_bg.width = Mathf.RoundToInt(System.Convert.ToSingle(ManualHeight) / Screen.height * Screen.width);
			}
		}
	}
    public static void AdaptiveLastBG(UISprite _bg)
    {
		//float tScaleX = (float)Screen.width / (float)Screen.height * 1.67f * (float)_bg.localScale.y;
		//_bg.localScale = new Vector3(tScaleX, _bg.localScale.y, 1);
		_bg.width = (int)((float)ManualHeight / (float)Screen.height * (float)Screen.width) + 3;
		_bg.height = (int)((float)_bg.width / (float)Screen.width * (float)Screen.height);
	}

	public static void AdaptiveCoinGem(GameObject _coinGemObj)
	{
		if((float)Screen.width / (float)Screen.height < 0.58f)      //手机时
		{
			_coinGemObj.transform.localScale = new Vector3(0.9f, 0.9f, 0.9f);
		}
	}
}
