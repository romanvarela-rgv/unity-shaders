using UnityEngine;


public class SceneManager : MonoBehaviour
{
    [SerializeField] private string[] sceneNames;
    [SerializeField] private KeyCode nextSceneKey = KeyCode.RightArrow;
    [SerializeField] private KeyCode previousSceneKey = KeyCode.LeftArrow;

    private static SceneManager _instance;
    private int _currentSceneIndex = 0;

    public static SceneManager Instance
    {
        get { return _instance; }
    }

    private void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
            return;
        }
        
        _instance = this;
        DontDestroyOnLoad(gameObject);
    }

    private void Update()
    {
        if (Input.GetKeyDown(nextSceneKey))
        {
            LoadNextScene();
        }
        else if (Input.GetKeyDown(previousSceneKey))
        {
            LoadPreviousScene();
        }
    }

    public void LoadNextScene()
    {
        if (sceneNames.Length == 0) return;

        _currentSceneIndex = (_currentSceneIndex + 1) % sceneNames.Length;
        UnityEngine.SceneManagement.SceneManager.LoadScene(sceneNames[_currentSceneIndex]);
    }

    public void LoadPreviousScene()
    {
        if (sceneNames.Length == 0) return;

        _currentSceneIndex = (_currentSceneIndex - 1 + sceneNames.Length) % sceneNames.Length;
        UnityEngine.SceneManagement.SceneManager.LoadScene(sceneNames[_currentSceneIndex]);
    }
}