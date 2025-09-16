using UnityEngine;
using UnityEngine.UI; 

public class POMControllerUI : MonoBehaviour
{
    [Header("Shader Settings")]
    public Material targetMaterial; 
    public string heightScaleProperty = "_HeightScale";
    public string refPlaneProperty = "_RefPlane";

    [Header("UI Sliders")]
    public Slider heightScaleSlider;
    public Slider refPlaneSlider;

    void Start()
    {
        if (heightScaleSlider != null)
            heightScaleSlider.onValueChanged.AddListener(SetHeightScale);

        if (refPlaneSlider != null)
            refPlaneSlider.onValueChanged.AddListener(SetRefPlane);
    }

    public void SetHeightScale(float value)
    {
        targetMaterial.SetFloat(heightScaleProperty, value);
    }

    public void SetRefPlane(float value)
    {
        targetMaterial.SetFloat(refPlaneProperty, value);
    }
}