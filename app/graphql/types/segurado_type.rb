# frozen_string_literal: true

module Types
  class SeguradoType < Types::BaseObject
    field :nome, String, null: true
    field :cpf, String, null: true
  end
end
