class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  validates_presence_of :doctor
  validates_presence_of :patient

  def bookable?
    doctor_id = self.doctor_id
    schedule = self.schedule
    appointment_count = Appointment.where(doctor_id: doctor_id, status: 'Approved', schedule: schedule).count
    if appointment_count < 4
      return false
    else
      return true
    end
  end

  def self.check_role(role, appointment)
    if role == 'admin'
      appointment.status = 'Pending'
      appointment.save!
    elsif role == 'superadmin'
      appointment.status = 'Approved'
      appointment.save!
    end
  end

  def self.remove_appointments(appointments)
    appts = appointments.map { |x| { 'schedule' => x['schedule'], 'id' => x['id'] } }
    appts.each do |a|
      Appointment.delete(a.id) if Date.today > a['schedule']
    end
  end
end
