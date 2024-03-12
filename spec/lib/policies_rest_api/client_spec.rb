# frozen_string_literal: true

require 'rails_helper'

describe PoliciesRestApi::Client do
  let(:request_url) { ENV['POLICIES_REST_API_URL'] + request_route }
  describe '.get_policy_by_id' do
    subject { described_class.get_policy_by_id(policy_id) }
    let(:policy_id) { 1 }
    let(:request_route) { "/policies/#{policy_id}" }

    before do
      allow(Faraday).to receive(:get).and_return(response_double)
    end

    context 'when success' do
      let(:response_double) do
        double('Faraday::Response', body: expected_response.to_json, status: 200)
      end
      let(:expected_response) do
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
      end

      it 'calls faraday with correct params' do
        subject
        expect(Faraday).to have_received(:get).with(request_url).once
      end
      it 'returns the parsed response body' do
        expect(subject).to eq(expected_response)
      end
    end

    context 'when some error occurs' do
      let(:response_double) do
        double('Faraday::Response', body: error.to_json, status: 404)
      end
      let(:error) { { error: "Couldn't find Policy with 'id'=1" } }

      it 'calls faraday with correct params' do
        subject
        expect(Faraday).to have_received(:get).with(request_url).once
      end

      it 'returns the parsed response body' do
        expect(subject).to eq(error)
      end
    end
  end
end