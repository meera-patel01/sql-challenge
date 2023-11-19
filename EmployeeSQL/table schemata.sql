-- DATA ENGINEERING

CREATE TABLE Departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id),
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date VARCHAR(20) NOT NULL
);

CREATE TABLE Dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE Dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INT NOT NULL
);