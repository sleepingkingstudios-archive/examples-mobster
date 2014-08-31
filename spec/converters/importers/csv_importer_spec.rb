# spec/converters/importers/csv_importer_spec.rb

require 'converters/importers/csv_importer'

RSpec.describe CSVImporter do
  let(:instance) { described_class.new }

  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe

  describe '#columns' do
    it { expect(instance).to have_reader(:columns).with(nil) }
  end # describe

  describe '#import' do
    let(:columns) { %w(id name type culture range hands) }
    let(:data) do
      [ [0, 'einhander',  'sword', 'German',   nil, 1],
        [1, 'zweihänder', 'sword', 'German',   nil, 2],
        [2, 'crossbow',   'bow',   'European', 40,  2],
        [3, 'shoto',      'sword', 'Japanese', nil, 1]
      ] # end array
    end # let
    let(:raw_data) do
      "\n\n#{columns.join ','}\n#{data.map { |ary| ary.join(',') }.join("\n")}\n"
    end # let
    let(:expected) do
      data.map do |ary|
        {}.tap do |hsh|
          ary.each.with_index do |item, index|
            hsh[columns[index]] = item
          end # each
        end # tap
      end # map
    end # let

    it { expect(instance).to respond_to(:import).with(1).arguments }

    it 'extracts the column names' do
      expect { instance.import raw_data }.to change(instance, :columns).to(be == columns)
    end # it

    it 'converts the data to a hash' do
      expect(instance.import raw_data).to be == expected
    end # it
  end # describe
end # describe
