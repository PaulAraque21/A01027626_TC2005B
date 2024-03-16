using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SimonScores : MonoBehaviour
{
    [SerializeField] TMP_Text scoreText;
    [SerializeField] TMP_Text highScoreText;

    int score;
    int highScore;

    // Start is called before
    void Start()
    {
        int score = PlayerPrefs.GetInt("score", 0);
        int highScore = PlayerPrefs.GetInt("highScore", 0);

        if(score > highScore)
        {
            highScore = score;
            PlayerPrefs.SetInt("highScore", highScore);
        }

        scoreText.text = "Score: " + score;
        highScoreText.text = "High Score: " + highScore;
    }
}