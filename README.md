# Unity Shaders

Colección de shaders que armamos en grupo para Programación Gráfica en UADE, hechos con Amplify Shader Editor en Unity.

*Unity shader collection (Amplify Shader Editor) from a Graphics Programming group project at UADE.*

## Lo que hice yo

Mi parte fue el agua:

- **Toon Water** (`Assets/Parcial1RGV/Shaders/ToonWater.shader`): agua con estética cartoon, de colores planos. Escena: `ToonWater_RomanVarela.unity`.
- **Depth Fade Water** (`Assets/Parcial1RGV/Shaders/Depth Fade water.shader`): el color del agua cambia según la profundidad, así se ve más clara en la orilla y más oscura en el fondo. Escena: `DepthFade_RomanVarela.unity`.

## Lo que hizo el resto del equipo

| Efecto | Escena |
|---|---|
| Fresnel y Toon shading (step, shadow) | `JGFresnel.unity`, `JGToon.unity` |
| Height map y disolución | `JulianFirpo1.unity`, `JulianFirpo2.unity` |
| Parallax Occlusion Mapping | `POM_Santi.unity` |
| Screen Space UV | `SPUV_Santi.unity` |

En `Assets/Hechos_en_Clase/` están los ejercicios de clase (hologram, height map y otros).

## Cómo abrirlo

1. Unity **2022.3.16f1**.
2. Abrí la carpeta desde Unity Hub.
3. Cada efecto tiene su escena en `Assets/Scenes/`. La de entrada es `InitialScene.unity`.

---

Roman Gael Varela (RGV) · [romangaelvarela.online](https://romangaelvarela.online)
