import 'package:employee_management/model/employee_model.dart';
import 'package:get/get.dart';
import 'employee_service.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var employee = Employee().obs;
  var isLoading = true.obs;
  final EmployeeService _employeeService = EmployeeService();

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      var fetchedEmployees = await _employeeService.fetchEmployees();
      if (fetchedEmployees != null) {
        employees.assignAll(fetchedEmployees);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchEmployeeById(int id) async {
    try {
      isLoading(true);
      var fetchedEmployee = await _employeeService.fetchEmployeeById(id);
      if (fetchedEmployee != null) {
        employee.value = fetchedEmployee;
      }
    } finally {
      isLoading(false);
    }
  }

  void createEmployee(String name, String age, String salary) async {
    try {
      isLoading(true);
      var newEmployee =
          await _employeeService.createEmployee(name, age, salary);
      if (newEmployee != null) {
        employees.add(newEmployee);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<bool> updateEmployee(
      int id, String name, String age, String salary) async {
    try {
      isLoading(true);
      var updatedEmployee =
          await _employeeService.updateEmployee(id, name, age, salary);
      // print(updatedEmployee);
      if (updatedEmployee != null) {
        var index = employees.indexWhere((employee) => employee.id == id);
        if (index != -1) {
          updatedEmployee.id = id;
          employees[index] = updatedEmployee;
        }
      }
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading(false);
    }
  }

  void deleteEmployee(int id) async {
    try {
      isLoading(true);
      final respose = await _employeeService.deleteEmployee(id);
      if (respose) {
        employees.removeWhere((employee) => employee.id == id);
      }
    } finally {
      isLoading(false);
    }
  }
}
