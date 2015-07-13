class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  validates_presence_of :doctor
  validates_presence_of :patient
  scope :approved_appointments, -> { where(status: 'Approved') }

  def bookable?
    Appointment.where(doctor_id: self.doctor_id, schedule: self.schedule).approved_appointments.count < 4
  end
end
