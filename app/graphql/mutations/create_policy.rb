module Mutations
  class CreatePolicy < BaseMutation
    argument :data_emissao, String, required: true
    argument :data_fim_cobertura, String, required: true
    argument :segurado, Inputs::Segurado
    argument :veiculo, Inputs::Veiculo

    type Types::PolicyType

    def resolve(**arguments)
      PoliciesPublisher.publish(arguments)
      arguments
    end
  end
end