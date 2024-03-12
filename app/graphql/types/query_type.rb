# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :policy, Types::PolicyType, null: false, description: "Fetches an policy information given its ID" do
      argument :policy_id, ID, required: true, description: "ID of the object."
    end

    def policy(policy_id:)
      #TODO: call api rest to fetch policy information
      if policy_id.to_i == 1
        {
          id: 1,
          data_emissao: '2024-01-01',
          data_fim_cobertura: '2025-01-01',
          segurado: {
            nome: 'Joao Silva',
            cpf: '001.002.003-90'
          },
          veiculo: {
            marca: 'Fiat',
            modelo: 'Uno 1.0',
            ano: '1996',
            placa: 'ABC-1234'
          }
        }
      else
        nil
      end
    end
  end
end
