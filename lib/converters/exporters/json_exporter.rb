# lib/converters/exporters/json_exporter.rb

require 'json'

class JSONExporter
  def export data, options = {}
    hsh = data.respond_to?(:as_json) ? data.as_json : data

    if options.fetch(:pretty, false)
      JSON.pretty_generate hsh
    elsif defined?(ActiveSupport::JSON)
      ActiveSupport::JSON.encode hsh
    else
      JSON.generate hsh
    end # if-else
  end # method export
end # class
