import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine();
        String target = scanner.nextLine();
        Lesson lesson = new Lesson(); // Create a lesson object.
        String [] studentInfo = input.split(";"); // Split the input string by student information.
        // Add each student to the lesson object.
        for (String student : studentInfo) {
            String[] info = student.split(",");
            lesson.addStudent(new Student(info[0], new Score(Float.parseFloat(info[1]), Float.parseFloat(info[2]))));
        }
        // Get the target result.
        lesson.printStudentScoreByName(target);
        scanner.close();
        return ;
    }
}