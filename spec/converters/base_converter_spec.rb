# spec/converters/base_converter_spec.rb

require 'converters/base_converter'

RSpec.describe BaseConverter do
  include Spec::Contexts::CSVData

  let(:instance) { described_class.new }

  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe

  describe '#default_exporter' do
    it { expect(instance).to have_reader(:default_exporter).with(:json) }
  end # describe

  describe '#default_importer' do
    it { expect(instance).to have_reader(:default_importer).with(:csv) }
  end # describe

  describe '#hashed_data' do
    it { expect(instance).to have_reader(:hashed_data).with(nil) }

    it { expect(instance).to have_writer(:hashed_data) }
  end # describe

  describe '#raw_data' do
    it { expect(instance).to have_reader(:raw_data).with(nil) }
  end # describe

  describe '#import' do
    it { expect(instance).to respond_to(:import).with(1..2).arguments }

    describe 'with CSV data', :csv_data do
      it 'returns the hashed data' do
        expect(instance.import raw_csv_data).to be == hashed_csv_data
      end # it

      it 'stores the raw_data' do
        expect { instance.import raw_csv_data }.to change(instance, :raw_data).to(be == raw_csv_data)
      end # it

      it 'stores the hashed data' do
        expect { instance.import raw_csv_data }.to change(instance, :hashed_data).to(be == hashed_csv_data)
      end # it
    end # describe
  end # describe
end # describe
