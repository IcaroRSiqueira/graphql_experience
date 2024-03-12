# frozen_string_literal: true

module Types
  class VeiculoType < Types::BaseObject
    field :marca, String, null: true
    field :modelo, String, null: true
    field :ano, String, null: true
    field :placa, String, null: true
  end
end
