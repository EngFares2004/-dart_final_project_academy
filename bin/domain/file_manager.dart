import 'dart:convert';
import 'dart:io';
import '../models/employee.dart';

class FileManager {
  void exportEmployeesToJson(List<Employee> employees, String filePath) {
    List<Map<String, dynamic>> jsonList = employees.map((employee) => employee.toJson()).toList();
    File file = File(filePath);
    file.writeAsStringSync(jsonEncode(jsonList));
    print("Employees exported to $filePath successfully.");
  }

  List<Employee> importEmployeesFromJson(String filePath) {
    File file = File(filePath);
    if (!file.existsSync()) {
      print("File not found: $filePath");
      return [];
    }
    String content = file.readAsStringSync();
    List<dynamic> jsonList = jsonDecode(content);
    List<Employee> employees = jsonList.map((json) => Employee.fromJson(json)).toList();
    print("Employees imported from $filePath successfully.");
    return employees;
  }

  void exportEmployeeMonthlyReport(Employee employee, String filePath) {
    String report = '''
========================
Monthly Report for ${employee.name}
========================
ID: ${employee.id}
Email: ${employee.email}
Department ID: ${employee.departmentId}
Hire Date: ${employee.hireDate}
Performance Scores: ${employee.performanceScores}
========================
''';

    File file = File(filePath);
    file.writeAsStringSync(report);
    print("Monthly report for ${employee.name} exported to $filePath successfully.");
  }

  void generateCompanyReport(Map<int, Employee> employeeHR) {
    print('==================');
    print('Company Report');
    print('==================');
    print('Total Employees: ${employeeHR.length}');
    print('==================');

    employeeHR.forEach((id, employee) {
      print('ID: ${employee.id}, Name: ${employee.name}, Department ID: ${employee.departmentId}');
    });
  }

  List<Employee> getEmployeesByDepartmentId(int departmentId, Map<int, Employee> employeeHR) {
    return employeeHR.values.where((employee) => employee.departmentId == departmentId).toList();
  }
}
