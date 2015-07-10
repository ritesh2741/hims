class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role=='superadmin'
      can :manage, :all
    elsif user.role=='admin'
      can [:update,:destroy,:read],[Doctor,Patient]
      can [:appointments,:send_message] , Patient
      can [:manage],[Appointment,Report]
    elsif user.role=='user'
      can [:read], [Doctor,Patient,Appointment,Report]
    else
      can :read, Doctor
    end
  end
end