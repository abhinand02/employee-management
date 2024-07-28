import 'package:employee_management/home/screens/add_employee.dart';
import 'package:employee_management/home/screens/employee_details.dart';
import 'package:employee_management/model/employee_model.dart';
import 'package:employee_management/services/auth/auth_controller.dart';
import 'package:employee_management/services/employee/employee_controller.dart';
import 'package:employee_management/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final EmployeeController employeeController = Get.put(EmployeeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (employeeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (employeeController.employees.isEmpty) {
          return const Center(child: Text('No employees found'));
        } else {
          return ListView.builder(
            itemCount: employeeController.employees.length,
            itemBuilder: (context, index) {
              Employee employee = employeeController.employees[index];
              return ListTile(
                title: Text(employee.employeeName ?? ''),
                subtitle: Text(
                    'Age: ${employee.employeeAge}, Salary: ${employee.employeeSalary}'),
                onTap: () {
                  if (employee.id != null) {
                    // GETTING TOO MANY REQUEST ERROR
                    // employeeController.fetchEmployeeById(employee.id!);

                    Get.to(() => EmployeeDetailScreen(employee: employee));
                  }
                },
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      Get.to(() => EmployeeFormScreen(employee: employee));
                    } else if (value == 'delete') {
                      showDeleteConfirmationDialog(
                        context: context,
                        content:
                            'Are you sure you want to delete ${employee.employeeName}?',
                        title: 'Delete',
                        buttonText: 'Delete',
                        onClick: () {
                          if (employee.id != null) {
                            employeeController.deleteEmployee(employee.id!);
                          }
                        },
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Edit', 'Delete'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice.toLowerCase(),
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              );
            },
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => EmployeeFormScreen());
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
