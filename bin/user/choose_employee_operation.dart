import 'dart:io';

import 'user_in_output.dart';

void chooseEmployeeOperation(){
  bool flag2 =true;
  while(flag2){
    print ('''
1==>>> Show Employees 
2==>>> Add Employee
3==>>> Search of Employee with ID
4==>>> Search of Employee with Name
5==>>> Remove of Employee with ID
6==>>> Exist
===============
''');
    stdout.write("\nPlease, Enter Your Operation NO :");
    int empOperationNum = int.parse(stdin.readLineSync()!);
    switch(empOperationNum){
      case 1 :
        print('\n=======================Show Employees =====================');
        if(employees.isNotEmpty){

          for(int i =0 ;i<employees.length ;i++){
            print('''
     Name : ${employees[i].name}
     ID : ${employees[i].id}
     Email : ${employees[i].email}
     Department ID : ${employees[i].departmentId} 
     Score: ${employees[i].performanceScores}
     Hire Date: ${employees[i].hireDate}
     
                  ***********                             ''');

            print("Do you want added a performance score [y/n]?");
            String f =stdin.readLineSync()!;
            while(f =='y' ?true:false){
              print(" adding a performance score (from 1 to 5).");
              var input =stdin.readLineSync();
              int score= int.parse(input!);
              employees[i].addPerformanceScores(score);
              employees[i].generateMonthlyReport(DateTime(2024, 9));
              print("Do you want added a performance score again [y/n]?");
              f =stdin.readLineSync()!;
            }}
        }
        else{print('No Employee\n'
            '*************');}
        break;
      case 2:
        addEmployee();
        break;
      case 3:
        stdout.write("Please, Enter Your ID Employee :");
        int id = int.parse(stdin.readLineSync()!);
        if(id <=employees.length) {
          print('''\n
     Name : ${employees[id - 1].name}
     ID : ${employees[id - 1].id}
     Email : ${employees[id - 1].email}
     Department ID : ${employees[id - 1].departmentId} 
     Score : ${employees[id - 1].performanceScores}
     Hire Date: ${employees[id - 1].hireDate}
     
                               *****                             ''');
        }
        else{
          print('No Employee  ${id-1}  \n'
              '*********');
        }

        break;
      case 4:
        stdout.write("\nPlease, Enter Your Name Employee :");
        String name = stdin.readLineSync()!;
        int id=0;
        for(int i =0 ;i<employees.length ;i++) {
          if (employees[i].name==name)
          {
            id =i;
            break;
          }
          else{
            print('No Employee  $name  \n'
                '*********');
          }
        }

        print('''\n
     Name : ${employees[id ].name}
     ID : ${employees[id ].id}
     Email : ${employees[id].email}
     Department ID : ${employees[id].departmentId} 
     Score : ${employees[id].performanceScores}
     Hire Date: ${employees[id].hireDate}
     
                               *****                             ''');


        break;
      case 5:
        stdout.write("\nPlease, Enter Your ID Employee :");
        int id = int.parse(stdin.readLineSync()!);
        print('\n====>>>Removed Employee${employees[id-1].name} \n'
            '                     *****                             ');
        employees.removeAt(employees[id-1].id-1 );
        break;

      case 6:
        flag2 =false;
        break;

    }
  }
}
