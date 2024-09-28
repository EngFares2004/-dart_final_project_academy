

import 'employee.dart';

class ContractEmployee extends Employee {
  final DateTime contractEndDate;
  final double hourlyRate;
  double hoursWorked = 0;

  ContractEmployee({
    required this.contractEndDate,
    required this.hourlyRate,
    required super.name,
    required super.email,
    required super.id,
    required super.departmentId,
    required super.hireDate,
  });

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['type'] = 'contract';
    json['contractEndDate'] = contractEndDate.toIso8601String();
    json['hourlyRate'] = hourlyRate;
    return json;
  }

  factory ContractEmployee.fromJson(Map<String, dynamic> json) {
    return ContractEmployee(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      departmentId: json['departmentId'],
      hireDate: DateTime.parse(json['hireDate']),
      contractEndDate: DateTime.parse(json['contractEndDate']),
      hourlyRate: json['hourlyRate'],
    );
  }

  void addWorkedHours(int additionalHours) {
    if (additionalHours > 0) {
      hoursWorked += additionalHours;
      print('Added $additionalHours hours. Total hours worked: $hoursWorked\n'
          '                           *****                             ');
    } else {
      print('Invalid hours. Please add positive hours.\n'
          '                     *****                             ');
    }
  }

  @override
  void showEmployeeDetails() {
    print(
        '================Employee Details==============\n'
            'Date: $hireDate am\n'
            'ID: $id\n '
            'Name: $name Report \n '
            'Email: $email\n '
            'Department Id: $departmentId\n '
            'Hours Worked: $hoursWorked\n '
            'Hourly Rate: $hourlyRate\n '
            '          *****              '
    );
  }
}
