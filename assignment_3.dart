import 'dart:io';

// abstract class
abstract class Person {
  void studentInfo();
  // asked ai and ai says to skip the body because subclass will override this method
}

// student class
class Student implements Person {
  //private fields
  int _id;
  String _name;

  // constructor
  Student(this._id, this._name);

  // used fat arrow function and used getters to get private values
  int get id => _id;
  String get name => _name;

  void studentInfo() {
    print("ID : $_id");
    print("Name : $_name");
  }
}

//list to store student
List<Student> students = [];

//add student function
void addStudent() {
  print("\n===== Add Student =====");

  print("Enter Student ID: ");
  int id = int.parse(stdin.readLineSync()!);

  print("Enter Student Name: ");
  String name = stdin.readLineSync()!;

  Student student = Student(id, name);
  students.add(student);

  print("Student added successfully");
}

// view student function
void viewStudents() {
  print("\n===== Students List =====");

  if (students.isEmpty) {
    print("No Student Found");
    return;
  }

  //anonymous function
  students.forEach((student) {
    student.studentInfo();
    print("-------------------------");
  });
}

// search student function
void searchStudent() {
  print("\n===== Search Student =====");

  print("Enter Student ID to Search: ");
  int id = int.parse(stdin.readLineSync()!);

  bool found = false;
  for (var student in students) {
    if (student.id == id) {
      print("\nStudent Found:");
      student.studentInfo();
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student Not Found\n");
  }
}

//delete student function
void deleteStudent() {
  print("\n===== Delete Student =====");

  print("Enter Student ID to Delete: ");
  int id = int.parse(stdin.readLineSync()!);

  bool found = false;
  for (var student in students) {
    if (student.id == id) {
      students.remove(student);
      print("Student Deleted Successfully\n");
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student Not Found\n");
  }
}

void main() {
  while (true) {
    print("""
      ====== Student Information Manager ======
      1. Add Student
      2. View Students
      3. Search Student
      4. Delete Student
      5. Exit
    """);

    print("Enter Your Choice:");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addStudent();

      case 2:
        viewStudents();

      case 3:
        searchStudent();

      case 4:
        deleteStudent();

      case 5:
        print("Program Closed.");
        return;
      //end the program

      default:
        print("Invalid Choice!\n");
    }
  }
}
