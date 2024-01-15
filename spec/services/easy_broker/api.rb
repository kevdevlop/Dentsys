require 'rails_helper'

RSpec.describe EasyBroker::Api, type: :service do
  subject(:api) { EasyBroker::Api.new(api_key) }

  let(:api_key) { 'l7u502p8v46ba3ppgvj5y2aad50lb9' }

  describe '#fetch_properties_titles' do
    context 'when valid request' do
      it 'returns titles' do
        expect(api.fetch_properties_titles[:titles]).to be_a Array
      end
    end

    context 'when invalid request' do
      let(:api_key) { '' }

      it 'returns error' do
        expect(api.fetch_properties_titles[:errors]).to be_a Hash
      end
    end
  end
end