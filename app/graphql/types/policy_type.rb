# frozen_string_literal: true

module Types
  class PolicyType < Types::BaseObject
    field :policy_id, ID, null: false
    field :data_emissao, String, null: true
    field :data_fim_cobertura, String, null: true
    field :segurado, Types::SeguradoType, null: false
    field :veiculo, Types::VeiculoType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
