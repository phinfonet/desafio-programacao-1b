require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:buyer) }
    it { is_expected.to have_db_column(:unit_price) }
    it { is_expected.to have_db_column(:quantity) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:address) }
    it { is_expected.to have_db_column(:supplier) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:buyer) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:supplier) }
  end

  describe '.parse' do
    let(:file)  { File.read('spec/fixtures/dados.txt') }

    it 'does return a array' do
      expect(described_class.parse(file)).to be_kind_of(Array)
    end

    it 'does get a hash with specific buyer' do
      expect(described_class.parse(file).first).to include({buyer: 'João Silva'})
    end
  end
end
