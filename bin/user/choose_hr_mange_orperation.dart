import 'dart:io';

import '../domain/hr_manager.dart';
import '../models/contract_employee.dart';
import '../models/employee.dart';
import '../models/permanent_employee.dart';



void chooseHROperation() {
  HRManager hrManager = HRManager();
  bool flag = true;
  while (flag) {
    print('''1==>>> Show All Employees
2==>>> Add Employee
3==>>> Delete Employee
4==>>> Show Employee By ID
5==>>> Generate Company Report
6==>>> Exit
====================''');
    stdout.write("\nPlease, Enter Your Operation NO: ");
    int hrOperationNum = int.parse(stdin.readLineSync()!);
    switch (hrOperationNum) {
      case 1:
        showAllEmployees(hrManager);
        break;
      case 2:
        stdout.write("Enter employee type (permanent or p)/(contract or c): ");
        String type = stdin.readLineSync()!.toLowerCase();

        stdout.write("Please, Enter Employee Name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Please, Enter Employee Email: ");
        String email = stdin.readLineSync()!;
        stdout.write("Please, Enter Department ID: ");
        int departmentId = int.parse(stdin.readLineSync()!);
        DateTime contractEndDate;
        stdout.write("\nPlease, Enter Hire Date (YYYY-MM-DD): ");
        try {
          contractEndDate= DateTime.parse(stdin.readLineSync()!);
        } catch (e) {
          stdout.write("\nError! Please, Enter your Correct Date!");
          stdout.write("\nEnter Hire Year: ");
          int hireYear = int.parse(stdin.readLineSync()!);

          stdout.write("\nEnter Hire Month: ");
          int hireMonth = int.parse(stdin.readLineSync()!);

          stdout.write("\nEnter Hire Day: ");
          int hireDay = int.parse(stdin.readLineSync()!);

          contractEndDate = DateTime(hireYear, hireMonth, hireDay);
        }

        Employee newEmployee;
       if (type == 'permanent' || type == 'p')  {
          stdout.write("Please, Enter Salary: ");
          double salary = double.parse(stdin.readLineSync()!);
          stdout.write("Please, Enter Two Benefits:\n");
          List<String> benefits = [];
          benefits.add(stdin.readLineSync()!);
          benefits.add(stdin.readLineSync()!);

          newEmployee = PermanentEmployee(
            benefits: benefits,
            name: name,
            email: email,
            departmentId: departmentId,
            id: hrManager.employeeHR.length + 1,
            hireDate: DateTime.now(),
            salary: salary,
          );
        } else {
          stdout.write("Please, Enter Hourly Rate: ");
          double hourlyRate = double.parse(stdin.readLineSync()!);
          newEmployee =ContractEmployee(
            name: name,
            email: email,
            departmentId: departmentId,
            hourlyRate: hourlyRate,
            id: hrManager.employeeHR.length + 1,
            hireDate: DateTime.now(),

            contractEndDate: contractEndDate,
          );
        }

        hrManager.addEmployee(newEmployee);
        break;
      case 3:
        deleteEmployeePrompt(hrManager);
        break;
      case 4:
        showEmployeeByIdPrompt(hrManager);
        break;
      case 5:
        hrManager.generateCompanyReport();
        break;
      case 6:
        flag = false;
        break;
      default:
        print('Invalid Option! Please try again.');
    }
  }
}


void showAllEmployees(HRManager hrManager) {
  if (hrManager.employeeHR.isEmpty) {
    print('No Employees in the system.');
  } else {
    hrManager.employeeHR.forEach((id, employee) {
      print('''
     Name: ${employee.name}
     ID: ${employee.id}
     Email: ${employee.email}
     Department ID: ${employee.departmentId} 
     Score: ${employee.performanceScores}
     Hire Date: ${employee.hireDate}
     *************''');
    });
  }
}

void deleteEmployeePrompt(HRManager hrManager) {
  stdout.write("Enter Employee ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);
  hrManager.deleteEmployee(id);
}

void showEmployeeByIdPrompt(HRManager hrManager) {
  stdout.write("Enter Employee ID: ");
  int id = int.parse(stdin.readLineSync()!);
  Employee? employee = hrManager.getEmployeeById(id);
  if (employee != null) {
    print('''\n
     Name: ${employee.name}
     ID: ${employee.id}
     Email: ${employee.email}
     Department ID: ${employee.departmentId} 
     Score: ${employee.performanceScores}
     Hire Date: ${employee.hireDate}
     *************''');
  } else {
    print('Invalid Employee ID.');
  }
}

