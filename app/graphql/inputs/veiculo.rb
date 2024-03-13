module Inputs
  class Veiculo < Types::BaseInputObject
    description "insured vehicle information"

    argument :marca, String, required: true
    argument :modelo, String, required: true
    argument :ano, String, required: true
    argument :placa, String, required: true
  end
end