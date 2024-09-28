import '../models/department.dart';
import '../models/employee.dart';

class HRManager {
  Map<int, Department> departmentHR = {};
  Map<int, Employee> employeeHR = {};

  void addEmployee(Employee empHR) {
    if (!employeeHR.containsKey(empHR.id)) {
      employeeHR[empHR.id] = empHR;
      print('Employee ${empHR.name} added successfully.');
    } else {
      print('Employee with ID ${empHR.id} already exists.');
    }
  }

  void deleteEmployee(int employeeId) {
    if (employeeHR.containsKey(employeeId)) {
      employeeHR.remove(employeeId);
      print('Employee with ID $employeeId deleted successfully.');
    } else {
      print('Employee with ID $employeeId not found.');
    }
  }

  Employee? getEmployeeById(int employeeId) {
    return employeeHR[employeeId];
  }

  void generateCompanyReport() {
    int totalEmployees = employeeHR.length;
    int totalDepartments = departmentHR.length;

    print('Company Report');
    print('==================');
    print('Total Employees: $totalEmployees');
    print('Total Departments: $totalDepartments');
    print('==================');

    print('Employee Details:');
    employeeHR.forEach((id, employee) {
      print('ID: ${employee.id}\n'
          'Name: ${employee.name} '
          'Department ID: ${employee.departmentId}\n'
          '====================');
    });
  }

  List<Employee> getEmployeesByDepartmentId(int departmentId) {
    return employeeHR.values
        .where((employee) => employee.departmentId == departmentId)
        .toList();
  }
}
