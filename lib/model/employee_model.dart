class Employee {
  int? id;
  final String? employeeName;
  final int? employeeAge;
  final int? employeeSalary;

  Employee({
    this.id,
    this.employeeName,
    this.employeeAge,
    this.employeeSalary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeAge: json['employee_age'],
      employeeSalary: json['employee_salary'],
    );
  }
}
