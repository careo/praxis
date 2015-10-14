require 'spec_helper'

describe Praxis::Extensions::FieldExpansion do


  let(:controller) do
    Class.new do
      include Praxis::Extensions::FieldExpansion
    end
  end

  context '#expanded_fields' do
    
  end
  #  context '#expand' do
      # let(:fields) { nil }
      # let(:view) { nil }
      # subject(:expansion) { field_selector.expand(view) }
      #
      # it 'memoizes the results of expansion' do
      #   binding.pry
      #   expect(field_selector.expand(view)).to be(field_selector.expand(view))
      # end
      #
      # context 'with no fields provided' do
      #   let(:type) { described_class.for(Person) }
      #
      #   it 'returns the fields for the default view of the type' do
      #
      #     expect(expansion).to eq({id: true, name: true, links: [true]})
      #   end
      #
      #   context 'with a simple view' do
      #     let(:view) { :default }
      #     it 'returns all fields for the view' do
      #       expect(expansion).to eq({id: true, name: true, links: [true]})
      #     end
      #   end
      # end
      #
      # context 'with a set of fields' do
      #   let(:fields) { 'id,name,owner(name)' }
      #   it 'returns the subset of fields that exist for the type' do
      #     expected = {id: true, name: true, owner: {name: true} }
      #     expect(expansion).to eq expected
      #   end
      #
      #   context 'with a simple view' do
      #     let(:view) { :link }
      #     it 'returns the subset of fields that exist for the view' do
      #       expected = {id: true, name: true }
      #       expect(expansion).to eq expected
      #     end
      #   end
      #
      # end


    #end

end
