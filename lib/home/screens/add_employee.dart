import 'package:employee_management/model/employee_model.dart';
import 'package:employee_management/services/employee/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EmployeeFormScreen extends StatefulWidget {
  final Employee? employee;

  const EmployeeFormScreen({super.key, this.employee});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController salaryController = TextEditingController();

  final EmployeeController employeeController = Get.find<EmployeeController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initValues();
  }

  initValues() {
    if (widget.employee != null) {
      nameController.text = widget.employee!.employeeName!;
      ageController.text = widget.employee!.employeeAge.toString();
      salaryController.text = widget.employee!.employeeSalary.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.employee == null ? 'Create Employee' : 'Edit Employee'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter employee name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Name', hintText: 'John Doe'),
              ),
              TextFormField(
                controller: ageController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter age';
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration:
                    const InputDecoration(labelText: 'Age', hintText: '18'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: salaryController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter salary';
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                    labelText: 'Salary', hintText: '50000'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  onPressed: employeeController.isLoading.value
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            if (widget.employee == null) {
                              employeeController.createEmployee(
                                nameController.text,
                                ageController.text,
                                salaryController.text,
                              );
                            } else {
                              FocusScope.of(context).unfocus();
                              employeeController
                                  .updateEmployee(
                                widget.employee!.id!,
                                nameController.text,
                                ageController.text,
                                salaryController.text,
                              )
                                  .then((value) {
                                if (value) {
                                  Get.back();
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    margin: EdgeInsets.all(15),
                                    maxWidth: 400,
                                    duration: Duration(seconds: 3),
                                    message: 'Something went wrong!',
                                  ));
                                }
                              });
                            }
                          }
                        },
                  child: Visibility(
                      visible: !employeeController.isLoading.value,
                      replacement: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      child:
                          Text(widget.employee == null ? 'Create' : 'Update')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
