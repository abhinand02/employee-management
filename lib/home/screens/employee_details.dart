import 'package:employee_management/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee? employee;

  const EmployeeDetailScreen({super.key, this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            ListTile(
              title: Text('Employee Name: ${employee?.employeeName ?? ''}'),
            ),
            ListTile(
              title: Text('Age: ${employee?.employeeAge ?? ''}'),
            ),
            ListTile(
              title: Text('Salary: ${employee?.employeeSalary ?? ''}'),
            )
          ],
        ),
      ),
    );
  }
}
