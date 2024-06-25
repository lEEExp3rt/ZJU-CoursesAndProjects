public class Student {
    private String name_; // Student name.
    private Score score_; // Student score.

    /**
     * Constructor.
     * @param name
     * @param score
     */
    public Student(String name, Score score) {
        name_ = name;
        score_ = score;
    }

    /**
     * Get the name of the student.
     * @return The name of the student.
     */
    public String getName() {
        return name_;
    }

    /**
     * Get the score of the student.
     * @return The score of the student.
     */
    public float getScore() {
        return score_.totalScore();
    }

}