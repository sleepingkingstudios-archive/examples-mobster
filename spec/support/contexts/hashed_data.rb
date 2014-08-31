# spec/support/contexts/hashed_data.rb

module Spec
  module Contexts
    module HashedData
      RSpec.shared_context 'with hashed data', :hashed_data => true do
        let(:hashed_data) do
          [ { 'object_id' => 123,
              'name' => 'horse',
              'class' => 'mammalia',
              'family' => 'equidae',
              'legs' => 4,
            }, # end hash
            { 'object_id' => 456,
              'name' => 'cobra',
              'class' => 'reptilia',
              'order' => 'squamata',
              'suborder' => 'serpentes',
              'legs' => 0
            }, # end hash
            { 'object_id' => 789,
              'name' => "Portuguese man o' war",
              'phylum' => 'cnidaria',
              'class' => 'hydrozoa',
              'tentacles' => 'many'
            }, # end hash
          ] # end array
        end # let
      end # shared_context
    end # module
  end # module
end # module
