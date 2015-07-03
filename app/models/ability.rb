class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role=='admin'
      can :manage, :all
    elsif user.role=='patient'
      can :read, Patient
      can :read, Appointment
      can :read, Report
    elsif user.role=='doctor'
      can :read, Doctor
      can :manage, Appointment
      can :read, Report
    end
  end
end