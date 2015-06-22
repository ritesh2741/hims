class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
	validates_presence_of :doctor
	validates_presence_of :patient
end
