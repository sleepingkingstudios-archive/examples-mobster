# spec/converters/importers/csv_importer_spec.rb

require 'converters/importers/csv_importer'

RSpec.describe CSVImporter do
  include Spec::Contexts::CSVData

  let(:instance) { described_class.new }

  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe

  describe '#columns' do
    it { expect(instance).to have_reader(:columns).with(nil) }
  end # describe

  describe '#import', :csv_data do
    it { expect(instance).to respond_to(:import).with(1).arguments }

    it 'extracts the column names' do
      expect { instance.import raw_csv_data }.to change(instance, :columns).to(be == csv_columns)
    end # it

    it 'converts the data to a hash' do
      expect(instance.import raw_csv_data).to be == hashed_csv_data
    end # it
  end # describe
end # describe
