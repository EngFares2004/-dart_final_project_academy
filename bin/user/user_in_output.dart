
import 'dart:io';


import '../domain/file_manager.dart';
import '../models/contract_employee.dart';
import '../models/employee.dart';
import '../models/permanent_employee.dart';
import 'choose_department_operation.dart';
import 'choose_employee_operation.dart';
import '../domain/hr_manager.dart';
import 'choose_file_mange_orperation.dart';
import 'choose_hr_mange_orperation.dart';
List<Employee> employees = [];
List<HRManager> employeeHR = [];

void welcome(){
  print('''
  ************************************************
  Welcome to *************************************
  ********** Company Manage Employee *************
           ************************************************
  ************************* Developed by Eng Fares😎
           ************************************************
  
  ''');


  print('Press Enter to continue...');
  stdin.readLineSync();

}
void chooseOperation(){
  welcome();
  bool flag =true;
  while(flag){
print ('''
1==>>> EMPLOYEES OPERATIONS 
2==>>> DEPARTMENT OPERATIONS 
3==>>> HR MANAGER OPERATIONS 
4==>>> FILE MANAGER OPERATIONS 
5==>>> EXIST
===============
''');
stdout.write("\nPlease, Enter Your Operation NO :");
int operationNum = int.parse(stdin.readLineSync()!);
switch(operationNum){
  case 1 :
    print('======================= Employee =====================');
    chooseEmployeeOperation();
    break;

case 2 :
    print('======================= Department =====================');
    chooseDepartmentOperation();
    break;

case 3 :
    print('======================= HR Manger =====================');
    chooseHROperation();
    break;

case 4 :
    print('======================= File Manger =====================');
    chooseFileManagerOperation(FileManager(),employees);
    break;

case 5 :
    flag =false;
    break;



}
}}





void addEmployee(){
  print("********************** add Employee *********************");

  while (true) {

    addDataEmployee();
    print("\nWould you like to add another employee? (yes/no)");
    String? response = stdin.readLineSync();
    if (response?.toLowerCase() != 'yes') {
      break;
    }
  }
}

void addDataEmployee()
{
  stdout.write("Enter employee type (permanent or p)/(contract or c): ");
  String type = stdin.readLineSync()!.toLowerCase();

  int id = employees.length + 1;
  print("\nYour Id: $id");
  stdout.write("Please, Enter Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("\nPlease, Enter Email: ");
  String email = stdin.readLineSync()!;

  stdout.write("\nPlease, Enter Department ID (1, 2 or 3): ");
  int departmentId = int.parse(stdin.readLineSync()!);
  departmentId = departmentId ;

  DateTime hireDate;
  stdout.write("\nPlease, Enter Hire Date (YYYY-MM-DD): ");
  try {
    hireDate = DateTime.parse(stdin.readLineSync()!);
  } catch (e) {
    stdout.write("\nError! Please, Enter your Correct Date!");
    stdout.write("\nEnter Hire Year: ");
    int hireYear = int.parse(stdin.readLineSync()!);

    stdout.write("\nEnter Hire Month: ");
    int hireMonth = int.parse(stdin.readLineSync()!);

    stdout.write("\nEnter Hire Day: ");
    int hireDay = int.parse(stdin.readLineSync()!);

    hireDate = DateTime(hireYear, hireMonth, hireDay);
  }

  if (type == 'permanent' || type == 'p') {
    stdout.write("\nEnter Salary: ");
    double salary = double.parse(stdin.readLineSync()!);

    stdout.write("Please, Enter Two Benefits:\n");
    List<String> benefits = [];
    benefits.add(stdin.readLineSync()!);
    benefits.add(stdin.readLineSync()!);

    PermanentEmployee permanentEmployee = PermanentEmployee(
      salary: salary,
      benefits: benefits,
      name: name,
      email: email,
      id: id,
      departmentId: departmentId,
      hireDate: hireDate,
    );
    employees.add(permanentEmployee);

    print("\nPermanent employee added successfully.\n************************");
  } else if (type == 'contract' || type == 'c') {
    stdout.write("Enter Contract End Date (YYYY-MM-DD): ");
    DateTime contractEndDate;
    try {
      contractEndDate = DateTime.parse(stdin.readLineSync()!);
    } catch (e) {
      stdout.write("\nError! Please, Enter your Correct Date!\n");
      stdout.write("\nEnter Contract End Year: ");
      int contractEndYear = int.parse(stdin.readLineSync()!);

      stdout.write("\n Contract End Month: ");
      int contractEndMonth = int.parse(stdin.readLineSync()!);

      stdout.write("\nEnter Contract End Day: ");
      int contractEndDay = int.parse(stdin.readLineSync()!);

      contractEndDate = DateTime(contractEndYear, contractEndMonth, contractEndDay);
    }

    stdout.write("\nPlease, Enter Hourly Rate: ");
    double hourlyRate = double.parse(stdin.readLineSync()!);

    ContractEmployee contractEmployee = ContractEmployee(
      contractEndDate: contractEndDate,
      hourlyRate: hourlyRate,
      name: name,
      email: email,
      id: id,
      departmentId: departmentId,
      hireDate: DateTime.now(),
    );
    employees.add(contractEmployee);
    print("\nContract employee added successfully.\n********************************");
  } else {
    print("Invalid employee type!");
  }
}