using UnityEngine;


public class CameraController : MonoBehaviour
{
    [SerializeField] private float rotationSpeed = 3.0f;
    [SerializeField] private float moveSpeed = 5.0f;
    [SerializeField] private float verticalMoveSpeed = 3.0f; // Velocidad para el movimiento vertical
    
    private float _yaw = 0.0f;
    private float _pitch = 0.0f;
    private Vector3 _initialRotation;
    
    private void Start()
    {
        _initialRotation = transform.eulerAngles;
        _yaw = _initialRotation.y;
        _pitch = _initialRotation.x;
        
        // Limitar el cursor al centro de la pantalla cuando se rota
        Cursor.lockState = CursorLockMode.None;
    }
    
    private void Update()
    {
        // Rotar cámara cuando se mantiene el botón derecho del mouse
        if (Input.GetMouseButton(1)) // 1 corresponde al botón derecho del mouse
        {
            // Obtener el movimiento del mouse
            float mouseX = Input.GetAxis("Mouse X") * rotationSpeed;
            float mouseY = Input.GetAxis("Mouse Y") * rotationSpeed;
            
            // Actualizar ángulos de rotación
            _yaw += mouseX;
            _pitch -= mouseY; // Invertido para que la rotación se sienta natural
            
            // Limitar el ángulo de pitch para evitar giros excesivos
            _pitch = Mathf.Clamp(_pitch, -89f, 89f);
            
            // Aplicar rotación a la cámara
            transform.rotation = Quaternion.Euler(_pitch, _yaw, 0f);
        }
        
        // Movimiento de la cámara con WASD o flechas
        float horizontalInput = Input.GetAxis("Horizontal"); // AD o flechas izquierda/derecha
        float verticalInput = Input.GetAxis("Vertical");     // WS o flechas arriba/abajo
        
        Vector3 forward = transform.forward;
        Vector3 right = transform.right;
        
        // Eliminar componente Y para evitar movimiento vertical no deseado
        forward.y = 0;
        right.y = 0;
        forward.Normalize();
        right.Normalize();
        
        // Calcular dirección de movimiento
        Vector3 moveDirection = (forward * verticalInput + right * horizontalInput).normalized;
        
        // Aplicar movimiento horizontal
        transform.position += moveDirection * moveSpeed * Time.deltaTime;
        
        // Movimiento vertical con teclas E (arriba) y Q (abajo)
        if (Input.GetKey(KeyCode.E))
        {
            transform.position += Vector3.up * verticalMoveSpeed * Time.deltaTime;
        }
        if (Input.GetKey(KeyCode.Q))
        {
            transform.position += Vector3.down * verticalMoveSpeed * Time.deltaTime;
        }
    }
}