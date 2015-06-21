# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
department_names = ['Dental', 'Ortho', 'Mental']
departments = department_names.each{|d| Department.create(name: d)}

doctors = [
	{ name: 'Ritesh', description: 'MD, Physician', department: departments.sample }
	{ name: 'Ritesh2', description: 'MD, Physician' }
	{ name: 'Ritesh3', description: 'MD, Physician' }
	{ name: 'Ritesh4', description: 'MD, Physician' }
]

Doctor.create(doctors)
