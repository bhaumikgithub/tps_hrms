# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    if @user.user_type == 'Consultant'
      can :read , ConsultantHandbook
    elsif @user.user_type == 'Employee'
      can :read , EmployeeHandbook
    elsif @user.user_type == 'Director' || @user.user_type == 'Admin' 
      can :all, ConsultantHandbook
      can :all, EmployeeHandbook
    end
    # if @user.team_leader? || @user.admin?
    #     can [:read, :manage], Leave
    #     can :manage, [ User, Holiday ,EmployeeHandbook ,Designation ,Degree ,Department ,EventLink ,CredentialType ,Credential ,EventCategory ,Vendor ,Bill ,AssetType ,Asset ,AssetHistory]
    # elsif @user.is_event_manager?
    #     can :read, Leave
    #     can :read, User
    #     can :read, Holiday
    #     can :read, EmployeeHandbook
    #     can :manage, EventLink
    # else
    #     can :read, Leave
    #     can :read, User
    #     can :read, Holiday
    #     can :read, EmployeeHandbook
    #     can :read, EventLink
    #     can :manage, AssetHistory
    # end

    @user.role.permissions.each do |permission|
      if permission.subject_class == "all"
        can permission.action.to_sym, permission.subject_class.to_sym
      else
        can permission.action.to_sym, permission.subject_class.safe_constantize
        # can permission.action.to_sym, permission.subject_class.singularize.to_sym.downcase
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
