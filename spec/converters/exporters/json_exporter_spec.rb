# spec/converters/exporters/json_exporter_spec.rb

require 'converters/exporters/json_exporter'

RSpec.describe JSONExporter do
  include Spec::Contexts::HashedData

  let(:instance) { described_class.new }

  describe '::new' do
    it { expect(described_class).to construct.with(0).arguments }
  end # describe

  describe '#export' do
    it { expect(instance).to respond_to(:export).with(1..2).arguments }

    describe 'with hashed data', :hashed_data do
      it 'converts the data to JSON' do
        json = instance.export hashed_data
        expect(JSON.parse json).to be == hashed_data
      end # it
    end # describe
  end # describe
end # describe
