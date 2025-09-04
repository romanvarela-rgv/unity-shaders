using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CanvasScript : MonoBehaviour
{
    [SerializeField] private Button button;
    [SerializeField] private TMP_Text tooltip;


    public void ShowHelp()
    {
        if (tooltip.IsActive())
        {
            tooltip.gameObject.SetActive(false);
        }
        else
        {
            tooltip.gameObject.SetActive(true);
        }
    }
}
