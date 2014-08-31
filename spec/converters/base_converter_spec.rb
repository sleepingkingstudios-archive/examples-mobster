# spec/converters/base_converter_spec.rb

require 'converters/base_converter'

RSpec.describe BaseConverter do
  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe
end # describe
