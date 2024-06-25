public class Score {
    private float dailyScore_; // Daily score.
    private float finalScore_; // Final score.

    /**
     * Constructor.
     * @param dailyScore
     * @param finalScore
     */
    public Score(float dailyScore, float finalScore) {
        dailyScore_ = dailyScore;
        finalScore_ = finalScore;
    }

    /**
     * Get the total score.
     * @return
     */
    public float totalScore() {
        return dailyScore_ * (float)0.3 + finalScore_ * (float)0.7;
    }

}