# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(worker)
    if worker.admin?
      can [:create], [Sale, Order, Product, Worker]
      can [:delete], [Worker, Sale, Product], office_id: worker.office.id
      can :manage, [Sale], office_id: worker.office.id
      can :manage, [Order], sale_id: worker.office.sales.ids
    else
      can [:create], [Sale, Order]
      can :read, [Product, Worker, Sale], office_id: worker.office.id
      can :manage, [Sale], worker_id: worker.id
      can :edit, [Sale], office_id: worker.office.sales.ids
      can :manage, [Order], sale_id: worker.sales.ids
    end
  end
end
