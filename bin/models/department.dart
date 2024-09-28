
import '../user/user_in_output.dart';
import 'employee.dart';

class Department {
  final String departmentName ;
  final int departmentId ;
  late List <Employee> listEmployee = employees;


  Department({
    required this.departmentName,
    required this.departmentId ,

  });

  void addEmployee(Employee employee){

    employees.add(employee);
    print('====>>>Added  an Employee${employee.id} to the department$departmentName...\n'
        '                     *****                             ');


  }
  void removeEmployee(Employee employee) {
    print('====>>>Removed Employee ${employee.id} from the department $departmentName...\n'
        '                     *****                             ');

    listEmployee.removeWhere((emp) => emp.id == employee.id);
  }

  void generateDepartmentReport() {
    print('$departmentName Department \n'
        '*****************\n');

    if (listEmployee.isEmpty) {
      print("No Employee!\n"
          "****");
    } else {
      for (var employee in listEmployee) {
        if (employee.performanceScores.isNotEmpty) {
          print("Name :${employee.name}\n"
              "Id :${employee.id}\n"
              "Score :${employee.performanceScores.last}\n"
              "****************");
        } else {
          print("Name :${employee.name}\n"
              "Id :${employee.id}\n"
              "No scores available\n"
              "****************");
        }
      }
    }
  }




}