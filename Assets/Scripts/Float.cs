using UnityEngine;

public class FloatUpDown : MonoBehaviour
{
    [Header("Rangos de flotación")]
    public Vector2 amplitudeRange = new Vector2(0.3f, 0.7f); // Min y Max de amplitud
    public Vector2 speedRange = new Vector2(1f, 3f);         // Min y Max de velocidad

    private float amplitude;
    private float speed;
    private float startY;

    void Start()
    {
        // Guardamos la posición inicial
        startY = transform.position.y;

        // Asignamos valores random dentro de los rangos
        amplitude = Random.Range(amplitudeRange.x, amplitudeRange.y);
        speed = Random.Range(speedRange.x, speedRange.y);
    }

    void Update()
    {
        // Movimiento senoidal en Y
        float newY = startY + Mathf.Sin(Time.time * speed) * amplitude;

        Vector3 pos = transform.position;
        pos.y = newY;
        transform.position = pos;
    }
}
