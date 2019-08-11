# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.tipo == 'Administrador'
      can :manage, :all
      can :export, :all
    elsif user.tipo == 'Cadastrador de talentos'
      can :update, AdminUser, :id => user.id
      can :create, [Cargoocupado, Certificacao, Curso, Formacaoacad, Talento]
      can [:update, :destroy], Talento, :quartel_id => user.quartel.id
      can :read, :all
      can :export, :all
    else
      can :update, AdminUser, :id => user.id
      can :read, :all
      can :export, :all
    end
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
