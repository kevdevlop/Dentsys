require 'rails_helper'

RSpec.describe BranchOfficesService::Create, type: :service do
  subject(:service) { described_class.new(client, params) }

  let(:client) { create(:client) }
  let(:params) { {
    name: Faker::Company.name,
    rfc: Faker::Company.duns_number,
    city: Faker::Address.city,
  } }

  context "when params are valid" do
    it "saves the branch office" do
      expect(service.call[:data]).to be_a(BranchOffice)
    end
  end

  context "when params are invalid" do
    let(:params) { {} }

    it "returns errors" do
      expect(service.call[:status]).to eq(:unprocessable_entity)
    end
  end
end