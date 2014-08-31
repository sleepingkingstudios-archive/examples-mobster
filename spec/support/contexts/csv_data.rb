# spec/support/contexts/csv_data.rb

module Spec
  module Contexts
    module CSVData
      RSpec.shared_context 'with CSV data', :csv_data => true do
        let(:csv_columns) { %w(id name type culture range hands) }
        let(:csv_data) do
          [ [0, 'einhander',  'sword', 'German',   nil, 1],
            [1, 'zweihänder', 'sword', 'German',   nil, 2],
            [2, 'crossbow',   'bow',   'European', 40,  2],
            [3, 'shoto',      'sword', 'Japanese', nil, 1]
          ] # end array
        end # let
        let(:raw_csv_data) do
          "\n\n#{csv_columns.join ','}\n#{csv_data.map { |ary| ary.join(',') }.join("\n")}\n"
        end # let
        let(:hashed_csv_data) do
          csv_data.map do |ary|
            {}.tap do |hsh|
              ary.each.with_index do |item, index|
                hsh[csv_columns[index]] = item
              end # each
            end # tap
          end # map
        end # let
      end # shared_context
    end # module
  end # module
end # module
