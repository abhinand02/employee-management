import 'dart:convert';
import 'package:employee_management/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static const String baseUrl = 'https://dummy.restapiexample.com/api/v1';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/employees'));
      // print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body)['data'];
        // print(body);
        List<Employee> employees =
            body.map((dynamic item) => Employee.fromJson(item)).toList();
        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee?> fetchEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/employee/$id'));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body)['data'];
      // print(body);
      Employee employees = Employee.fromJson(body);
      return employees;
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<Employee?> createEmployee(
      String name, String age, String salary) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'employee_name': name,
        'employee_salary': int.parse(salary),
        'employee_age': int.parse(age),
      }),
    );

    // print(response.statusCode);

    if (response.statusCode == 200) {
      Get.back();
      return Employee.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to create employee');
    }
  }

  Future<Employee?> updateEmployee(
      int id, String name, String age, String salary) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'employee_name': name,
        'employee_salary': int.parse(salary),
        'employee_age': int.parse(age),
      }),
    );
    if (response.statusCode == 200) {
      // print(response.body);
      Get.back();
      return Employee.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to update employee');
    }
  }

  Future<bool> deleteEmployee(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));
      // print(response.statusCode);
      if (response.statusCode != 200) {
        Get.showSnackbar(const GetSnackBar(
          margin: EdgeInsets.all(15),
          maxWidth: 400,
          duration: Duration(seconds: 3),
          message: 'Failed to delete employee',
        ));
        return false;
      }
      return true;
    } catch (e) {
      throw Exception('Failed to delete employee');
    }
  }
}
