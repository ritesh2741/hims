class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
	validates_presence_of :doctor

  def self.overload(doctor_id,schedule)
    appointment_count = Appointment.where(doctor_id: doctor_id, status:'Approved', schedule: schedule ).count
    if appointment_count < 4
      return true
    else
      return false
    end
  end

  def self.check_role(user,appointment)
    if user.role == 'admin'
        appointment.status = 'Pending'
        appointment.save!
    elsif user.role == 'superadmin'
        appointment.status = 'Approved'
        appointment.save!
    end
  end
end
