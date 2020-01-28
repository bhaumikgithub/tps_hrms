# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    if @user.team_leader? || @user.admin?
        can [:read, :manage], Leave
        can :manage, User
        can :manage, Holiday
        can :manage, EmployeeHandbook
        can :manage, Designation
        can :manage, Degree
        can :manage, Department
        can :manage, EventLink
        # can :manage, Contact
    elsif @user.is_event_manager?
        can :read, Leave
        can :read, User
        can :read, Holiday
        can :read, EmployeeHandbook
        can :manage, EventLink
    else
        can :read, Leave
        can :read, User
        can :read, Holiday
        can :read, EmployeeHandbook
        can :read, EventLink
        can :read, Contact
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
