# frozen_string_literal: true

class CommerceAbility
  include CanCan::Ability

  def initialize(commerce)
      can :create, [Worker, Office, Sale, Order, Table, Product]
      can [:manage], [Worker, Office], commerce_id: commerce.id
      can [:manage], [Sale, Product, Table], office_id: commerce.offices.ids
      can [:manage], [Order], sale_id: Commerce.find_orders_ids(commerce)
  end
end
