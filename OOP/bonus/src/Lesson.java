import java.util.List;
import java.util.ArrayList;

public class Lesson {
    private List<Student> students;

    /**
     * Constructor.
     */
    public Lesson() {
        students = new ArrayList<Student>();
    }

    /**
     * Add a student's information to the list.
     * @param student
     */
    public void addStudent(Student student) {
        students.add(student);
    }

    /**
     * Print the score of a student by their name.
     * @param studentName The name of the student.
     */
    public void printStudentScoreByName(String studentName) {
        for (Student student : students) {
            if (student.getName().equals(studentName)) {
                System.out.println(Float.toString(student.getScore()));
                break;
            }
        }
        return ;
    }

}