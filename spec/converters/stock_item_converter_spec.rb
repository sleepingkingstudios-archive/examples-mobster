# spec/converters/stock_item_converter_spec.rb

require 'converters/stock_item_converter'

RSpec.describe StockItemConverter do
  let(:instance) { described_class.new }

  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe

  describe '#import' do
    let(:hashed_data) do
      [ { 'item_id'          => 111010,
          'description'      => 'Coffee',
          'price'            => '$1.25',
          'cost'             => '$0.80',
          'price_type'       => 'system',
          'quantity_on_hand' => '100000',
          'modifier_1_name'  => 'Small',
          'modifier_1_price' => '-$0.25',
          'modifier_2_name'  => 'Medium',
          'modifier_2_price' => '$0.00',
          'modifier_3_name'  => 'Large',
          'modifier_3_price' => '$0.30',
        }, # end hash
      ] # end array
    end # let
    let(:merged_data) do
      [ { 'item_id'          => 111010,
          'description'      => 'Coffee',
          'price'            => '$1.25',
          'cost'             => '$0.80',
          'price_type'       => 'system',
          'quantity_on_hand' => '100000',
          'modifiers' => [
            { 'name'  => 'Small',
              'price' => '-$0.25'
            }, # end hash
            { 'name'  => 'Medium',
              'price' => '$0.00',
            }, # end hash
            { 'name'  => 'Large',
              'price' => '$0.30'
            }, # end hash
          ], # end array
        }, # end hash
      ] # end array
    end # let
    let(:importer) { double('importer', :import => hashed_data) }

    before(:each) do
      allow(CSVImporter).to receive(:new).and_return(importer)
    end # before

    it 'merges the modifiers' do
      expect(instance.import '').to be == merged_data
    end # it
  end # describe
end # describe
