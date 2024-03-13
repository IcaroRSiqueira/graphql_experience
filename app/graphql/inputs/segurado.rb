module Inputs
  class Segurado < Types::BaseInputObject
    description "insured personal information"

    argument :nome, String, required: true
    argument :cpf, String, required: true
  end
end