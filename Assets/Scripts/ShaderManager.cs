using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Experimental.GlobalIllumination;
using UnityEngine.UI;

public class ShaderManager : MonoBehaviour
{
    [SerializeField] private Material Fresnel;
    [SerializeField] private Material Toon;
    [SerializeField] private bool isFresnel;


    [Header("Fresnel Settings")]
    [SerializeField] private Slider powerSlider;
    [SerializeField] private Slider biasSlider;
    [SerializeField] private Slider frecuencySlider;
    [SerializeField] private Slider ScaleSlider;


    [Header("Toon Settings")]
    [SerializeField] private Slider toonForce;
    [SerializeField] private Slider lightrangeSlider;
    [SerializeField] private Slider lightintensitySlider;
    [SerializeField] private Slider lightRotator;


    [SerializeField] private Light mainLight;
    [SerializeField] private Light pointlight;
    [SerializeField] private TMPro.TextMeshProUGUI lightstate;
    [SerializeField] private Transform lightRotation;
    private Quaternion initialRotation;



    private void Start()
    {
        if (isFresnel)
        {
            setFresnelValues();
        }
        else
        {
            setToonValues();
        }
        if (mainLight.intensity != 0 && mainLight != null) 
        {
            if (lightstate != null) { lightstate.text = "Directional Light Active"; }
        }
        else
        {
            if(lightstate != null) { lightstate.text = "Point Light Active"; }
            
        }
        initialRotation = lightRotation.rotation;
    }

    private void setFresnelValues()
    {
        powerSlider.value = Fresnel.GetFloat("_Power");
        biasSlider.value = Fresnel.GetFloat("_Bias");
        frecuencySlider.value = Fresnel.GetFloat("_Frecuencia");
        ScaleSlider.value = Fresnel.GetFloat("_Scale");
    }

    private void setToonValues()
    {
        toonForce.value = Toon.GetFloat("_Force");
        lightrangeSlider.value = pointlight.range;
        lightintensitySlider.value = pointlight.intensity;
    }

    public void modifyScale() { Fresnel.SetFloat("_Scale", ScaleSlider.value); }
    public void modifyforce() { Toon.SetFloat("_Force", toonForce.value); }
    public void modifypower() { Fresnel.SetFloat("_Power", powerSlider.value); }
    public void modifybias() { Fresnel.SetFloat("_Bias", biasSlider.value); }
    public void modifyfrecuency() { Fresnel.SetFloat("_Frecuencia", frecuencySlider.value); }
    public void modifylightrange() { pointlight.range = lightrangeSlider.value; }
    public void modifylightIntensity() { pointlight.intensity = lightintensitySlider.value; }

    public void activelight()
    {
        if(mainLight.intensity != 0) 
        { 
            mainLight.intensity = 0; pointlight.intensity = 1; 
            lightstate.text = "Point Light Active";
        }
        else 
        { 
            mainLight.intensity = 1; pointlight.intensity = 0; 
            lightstate.text = "Directional Light Active";
        }
    }

    public void rotateLight()
    {
        // Mapear el valor del slider (0-1) a un ángulo entre 0 y 180 grados
        float rotationAngle = lightRotator.value * 180f;

        // Aplicar la rotación a partir de la rotación inicial
        lightRotation.rotation = initialRotation * Quaternion.AngleAxis(rotationAngle, Vector3.up);
    }
}
