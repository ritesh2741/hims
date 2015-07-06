# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'superadmin@hims.com',password: 'shrestha',password_confirmation:'shrestha', role:'superadmin')
User.create(email: 'admin@hims.com',password: 'shrestha',password_confirmation:'shrestha', role: 'admin')
User.create(email: 'user@hims.com',password: 'shrestha',password_confirmation:'shrestha', role: 'user')

departments = ['Orthology','Psychology','Gynaecology','General']
departments.each do|dept|
	Department.create(name: dept)
end

doctors = [
	{ name: 'J.Asthana', description: 'PhD,MD, Physician', dob: Date.parse('1/12/1950'), gender: 'Male', phone: 9841123456, department_id: 4 },
	{ name: 'Rabina', description: 'MD, Orthologist', dob: Date.parse('1/12/1961'), gender: 'Female', phone: 9841127886, department_id: 1 },
	{ name: 'Sabina', description: 'MD, Gynaecology', dob: Date.parse('1/12/1970'), gender: 'Female', phone: 9841120006, department_id: 3},
	{ name: 'B.Careful', description: 'MD, Psychiatrist', dob: Date.parse('1/12/1969'), gender: 'Male', phone: 9841778256, department_id: 2}
	]
Doctor.create(doctors)

patients = [
	{ name: 'Tony Hawk', description: 'Fracture Skull', dob: Date.parse('12/05/1951'), gender: 'Male', phone: 9841123456,address: 'Nepal'  },
	{ name: 'Brett Lee', description: 'Stomach Problem', dob: Date.parse('1/12/1950'), gender: 'Male', phone: 9841098456, address: 'India'},
	{ name: 'John', description: 'Headache', dob: Date.parse('1/2/1960'), gender: 'Male', phone: 9841126812, address: 'China' },
	{ name: 'Ravindra', description: 'Mental Patient', dob: Date.parse('10/2/1956'), gender: 'Male', phone: 9841790456, address: 'Japan' }
]
Patient.create(patients)

