using UnityEngine;
using UnityEngine.UI;

public class ScreenSpaceUVControllerUI : MonoBehaviour
{
    [Header("Shader Settings")]
    public Material targetMaterial;
    public string noiseFloatProperty = "_NoiseFloat";
    public string screenUVOffsetProperty = "_ScreenUVOffset";

    [Header("UI Sliders")]
    public Slider noiseSlider;
    public Slider offsetXSlider;
    public Slider offsetYSlider;

    void Start()
    {
        if (noiseSlider != null)
            noiseSlider.onValueChanged.AddListener(SetNoiseFloat);

        if (offsetXSlider != null || offsetYSlider != null)
        {
            if (offsetXSlider != null)
                offsetXSlider.onValueChanged.AddListener(SetOffsetX);

            if (offsetYSlider != null)
                offsetYSlider.onValueChanged.AddListener(SetOffsetY);
        }
    }

    public void SetNoiseFloat(float value)
    {
        targetMaterial.SetFloat(noiseFloatProperty, value);
    }

    public void SetOffsetX(float value)
    {
        Vector2 current = targetMaterial.GetVector(screenUVOffsetProperty);
        targetMaterial.SetVector(screenUVOffsetProperty, new Vector2(value, current.y));
    }

    public void SetOffsetY(float value)
    {
        Vector2 current = targetMaterial.GetVector(screenUVOffsetProperty);
        targetMaterial.SetVector(screenUVOffsetProperty, new Vector2(current.x, value));
    }
}
