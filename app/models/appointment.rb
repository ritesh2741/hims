class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient

  def self.overload(doctor_id,schedule)
    appointment_count = Appointment.where(doctor_id: doctor_id, status:'Approved', schedule: schedule ).count
    if appointment_count < 4
      return false
    else
      return true
    end
  end

  def self.check_role(role,appointment)
    if role == 'admin'
        appointment.status = 'Pending'
        appointment.save!
    elsif role == 'superadmin'
        appointment.status = 'Approved'
        appointment.save!
    end
  end
end
