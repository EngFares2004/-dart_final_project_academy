import 'dart:io';

import '../domain/file_manager.dart';
import '../models/employee.dart';
import 'user_in_output.dart';

void chooseFileManagerOperation(FileManager fileManager, List<Employee> employees) {
  bool flag = true;
  while (flag) {
    print(''' 
1==>>> Export Employees to JSON
2==>>> Import Employees from JSON
3==>>> Generate Monthly Report for an Employee
4==>>> Generate Company Report
5==>>> Exit
====================
''');
    stdout.write("Please, Enter Your Operation NO: ");
    int operationNum = int.parse(stdin.readLineSync()!);
    switch (operationNum) {
      case 1:
        stdout.write("Enter the file path to export: ");
        String filePath = stdin.readLineSync()!;
        fileManager.exportEmployeesToJson(employees, filePath);
        break;
      case 2:
        stdout.write("Enter the file path to import: ");
        String importPath = stdin.readLineSync()!;
        List<Employee> importedEmployees = fileManager.importEmployeesFromJson(importPath);
        employees.addAll(importedEmployees);
        break;
      case 3:
        stdout.write("Enter Employee ID for Monthly Report: ");
        int employeeId = int.parse(stdin.readLineSync()!);
        if (employees.any((emp) => emp.id == employeeId)) {
          Employee employee = employees.firstWhere((emp) => emp.id == employeeId);
          stdout.write("Enter the file path for the report: ");
          String reportPath = stdin.readLineSync()!;
          fileManager.exportEmployeeMonthlyReport(employee, reportPath);
        } else {
          print("Employee not found!");
        }
        break;
      case 4:
        fileManager.generateCompanyReport(employeeHR as Map<int, Employee>);
        break;
      case 5:
        flag = false;
        break;
      default:
        print("Invalid option! Please try again.");
    }
  }
}
