import 'employee.dart';

class PermanentEmployee extends Employee {
  final double salary;
  final List<String> benefits;

  PermanentEmployee({
    required this.salary,
    required this.benefits,
    required super.name,
    required super.email,
    required super.id,
    required super.departmentId,
    required super.hireDate,
  });

  @override
  double calculateSalary() {
    return salary;
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['type'] = 'permanent';
    json['salary'] = salary;
    json['benefits'] = benefits;
    return json;
  }

  factory PermanentEmployee.fromJson(Map<String, dynamic> json) {
    return PermanentEmployee(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      departmentId: json['departmentId'],
      hireDate: DateTime.parse(json['hireDate']),
      salary: json['salary'],
      benefits: List<String>.from(json['benefits']),
    );
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
            'Salary: $salary\n '
            'Benefits: $benefits\n '
            '          *****              '
    );
  }
}
