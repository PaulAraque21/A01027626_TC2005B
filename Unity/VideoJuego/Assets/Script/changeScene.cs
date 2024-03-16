/*
Change Scenes

Paul Araque
2024-03-15
*/

using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    public void LoadSceneMenu()
    {
        SceneManager.LoadScene("Menu");
    }
    public void LoadSceneSimonScene()
    {
        SceneManager.LoadScene("SimonScene");
    }
    public void LoadSceneSimonResult()
    {
        SceneManager.LoadScene("SimonResult");
    }
    public void LoadScenePongScene()
    {
        SceneManager.LoadScene("PongScene");
    }
}
