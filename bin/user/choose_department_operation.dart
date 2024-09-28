import 'dart:io';

import 'user_in_output.dart';
import '../models/department.dart';
List<Department> departments = [
  Department(departmentId: 1,departmentName: "Sales"),
  Department(departmentName: 'Engineering', departmentId: 2),
  Department(departmentName: 'HR', departmentId: 3)
];
void chooseDepartmentOperation(){

  bool flag2 =true;
  while(flag2) {
    print('''
1==>>> Show Department 
2==>>> Add Employee
3==>>> Add Department
4==>>> Remove of Employee  
5==>>> generateDepartmentReport 
6==>>> Exist
===============
''');
    stdout.write("\nPlease, Enter Your Operation NO :");
    int empOperationNum = int.parse(stdin.readLineSync()!);
    switch (empOperationNum) {
      case 1 :
        print('\n=======================Show Department =====================');
        int id = 0;
        for (int i = 0; i < departments.length; i++) {
          print('''
     Name : ${departments[i].departmentName}
     ID : ${departments[i].departmentId}
     ====================''');
          id = departments[i].departmentId;

          if (employees.isNotEmpty) {
            for (int y = 0; y < employees.length; y++) {
              if (employees[y].departmentId == id) {
                print('''
     Name : ${employees[y].name}
     ID : ${employees[y].id}
     Email : ${employees[y].email}
     Department ID : ${employees[y].departmentId} 
     Score: ${employees[y].performanceScores}
     Hire Date: ${employees[y].hireDate}
     
                  ***********                             ''');
              }

            }
          }
          else {
            print('No Employee\n'
                '*************');
          } }
        break;
      case 2:
        addEmployee();
        break;
      case 3:

        stdout.write("Department ID ${departments.length}");
        stdout.write("\nPlease, Enter Your Name Department :");
        String name = stdin.readLineSync()!;
        departments.add(Department(departmentName: name, departmentId: departments.length));


        break;
      case 4:
        stdout.write("Please, Enter Your ID Employee :");
        int id = int.parse(stdin.readLineSync()!)-1;
        if (id <= employees.length&& employees .isNotEmpty) {
          for (int i = 0; i < departments.length; i++){
            if(employees[id].departmentId==departments[i].departmentId){
              departments[i].removeEmployee(employees[id]);}
          }}
        else {
          print('No Employee  ${id+1}  \n'
              '*********');
        }
        break;
      case 5:
        for (int i = 0; i < departments.length; i++){
          departments[i].generateDepartmentReport();}


        break;
      case 6:
        flag2 =false;
        break;

    }
  }
}
