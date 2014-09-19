using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class camera_script : MonoBehaviour
{
	public GUIText text;

	[DllImport("__Internal")]
	private static extern string _GetBundleVersion();

	public void Awake()
	{
#if UNITY_EDITOR
		text.text = "Bundle will be here!";
#else
		try
		{
			text.text = _GetBundleVersion();
		}
		catch(System.Exception e)
		{
			text.text = e.Message;
		}
#endif
	}
}
