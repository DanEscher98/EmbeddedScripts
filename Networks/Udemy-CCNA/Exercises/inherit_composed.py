#!/usr/bin/python3


class PayrollSystem:
    def calculate_payroll(self, employees):
        print("Calculating Payroll")
        print("===================")
        for employee in employees:
            print(f"Payroll for: {employee.id} - {employee.name}")
            print(f" - Check amount: {employee.calculate_payroll()}")
            print("")


class Employee:
    def __init__(self, id, name):
        self.id = id
        self.name = name


class DisgruntledEmployee:
    def __init__(self, id, name):
        self.id = id
        self.name = name

    def calculate_payroll(self):
        return 1000000


class SalaryEmployee(Employee):
    def __init__(self, id, name, weekly_salary):
        super().__init__(id, name)
        self.weekly_salary = weekly_salary

    def calculate_payroll(self):
        return self.weekly_salary


class HourlyEmployee(Employee):
    def __init__(self, id, name, hours_worked, hour_rate):
        super().__init__(id, name)
        self.hours_worked = hours_worked
        self.hour_rate = hour_rate

    def calculate_payroll(self):
        return self.hours_worked * self.hour_rate


class CommissionEmployee(SalaryEmployee):
    def __init__(self, id, name, weekly_salary, commission):
        super().__init__(id, name, weekly_salary)
        self.commission = commission

    def calculate_payroll(self):
        fixed = super().calculate_payroll()
        return fixed + self.commission


salary_employee = SalaryEmployee(1, "John Smith", 1500)
hourly_employee = HourlyEmployee(2, "Jane Doe", 40, 15)
commission_employee = CommissionEmployee(3, "Kevin Bacon", 1000, 250)
disgruntled_employee = DisgruntledEmployee(20000, "Anonymous")
payroll_system = PayrollSystem()
payroll_system.calculate_payroll(
    [salary_employee, hourly_employee, commission_employee, disgruntled_employee]
)

# -- EMPLOYEES --------------------------------------------


class Manager(SalaryEmployee):
    def work(self, hours):
        print(f"{self.name} screams and yells for {hours} hours.")


class Secretary(SalaryEmployee):
    def work(self, hours):
        print(f"{self.name} expends {hours} hours doing office paperwork")


class SalesPerson(CommissionEmployee):
    def work(self, hours):
        print(f"{self.name} expends {hours} hours on the phone.")


class FactoryWorker(HourlyEmployee):
    def work(self, hours):
        print(f"{self.name} manufactures gadgets for {hours} hours.")


class ProductivitySystem:
    def track(self, employees, hours):
        print("Tracking Employee Productivity")
        print("==============================")
        for employee in employees:
            employee.work(hours)
        print("")


manager = Manager(1, "Mary Poppins", 3000)
secretary = Secretary(2, "John Smith", 1500)
sales_guy = SalesPerson(3, "Kevin Bacon", 1000, 250)
factory_worker = FactoryWorker(2, "Jane Doe", 40, 15)
employees = [manager, secretary, sales_guy, factory_worker]
productivity_system = ProductivitySystem()
productivity_system.track(employees, 40)
payroll_system = PayrollSystem()
payroll_system.calculate_payroll(employees)
# https://realpython.com/inheritance-composition-python/
