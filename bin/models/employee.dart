import 'dart:convert';
import 'contract_employee.dart';
import 'permanent_employee.dart';

abstract class Employee {
  final String name;
  final String email;
  final int id;
  final int departmentId;
  final DateTime hireDate;
  late List<Map<String, dynamic>> performanceScores = [];

  Employee({
    required this.name,
    required this.email,
    required this.id,
    required this.departmentId,
    required this.hireDate,
  });

  double calculateSalary();
  void showEmployeeDetails();

  void addPerformanceScores(int addScore) {
    if (addScore > 0 && addScore <= 5) {
      performanceScores.add(
        {'score': addScore, 'date': DateTime.now()},
      );
      print('Score $addScore added successfully...\n*****');
    } else {
      print('Invalid performance score. Please add score (from 1 to 5)...\n*****');
    }
  }

  void subPerformanceScores(int index) {
    if (index >= 0 && index < performanceScores.length) {
      performanceScores.removeAt(index);
      print('Score removed successfully...\n'
          '*****');
    } else {
      print('Invalid index for performance scores.\n'
          '*****');
    }
  }

  void clearPerformanceScores() {
    performanceScores.clear();
    print('Cleared performance scores successfully...\n'
        '*****');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'departmentId': departmentId,
      'hireDate': hireDate.toIso8601String(),
      'performanceScores': performanceScores,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    String type = json['type'];

    if (type == 'permanent') {
      return PermanentEmployee.fromJson(json);
    } else if (type == 'contract') {
      return ContractEmployee.fromJson(json);
    } else {
      throw Exception('Unknown employee type');
    }
  }

  void generateMonthlyReport(DateTime month) {
    List<Map<String, dynamic>> monthlyScores = performanceScores.where((score) {
      return score['date'].month == month.month && score['date'].year == month.year;
    }).toList();

    print("============== Monthly Report ====================");
    if (monthlyScores.isEmpty) {
      print("No performance scores for ${month.month}/${month.year}....\n*******");
    } else {
      print("Performance Report for ${month.month}/${month.year}:\nName: $name\n*****");
      for (var score in monthlyScores) {
        print("Date: ${score['date']}, Score: ${score['score']}");
      }
      print("=========================");
    }
  }
}
