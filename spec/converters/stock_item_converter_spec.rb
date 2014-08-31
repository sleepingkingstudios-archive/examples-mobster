# spec/converters/stock_item_converter_spec.rb

require 'converters/stock_item_converter'

RSpec.describe StockItemConverter do
  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe
end # describe
