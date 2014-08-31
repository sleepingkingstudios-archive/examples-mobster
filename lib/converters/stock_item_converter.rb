# lib/converters/stock_item_converter.rb

require 'converters/base_converter'

class StockItemConverter < BaseConverter
  def import raw_data, options = {}
    @hashed_data = merge_modifiers super(raw_data, options)
  end # method import

  private

  def merge_modifiers hashed_data
    hashed_data.each do |data|
      next unless data['modifiers'].nil?
      modifiers = data['modifiers'] = []
      
      data.keys.each do |key|
        if match = /\Amodifier_(?<index>\d+)_(?<property>[\w_]+)\z/.match(key)
          hsh = modifiers[match[:index].to_i] ||= {}
          hsh[match[:property]] = data.delete(key)
        end # if
      end # each

      modifiers.compact!
    end # each
  end # method merge_modifiers
end # class
