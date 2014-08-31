# lib/converters/exporters/json_exporter.rb

require 'json'

class JSONExporter
  def export data
    hsh = data.respond_to?(:as_json) ? data.as_json : data

    if defined?(ActiveSupport::JSON)
      ActiveSupport::JSON.encode hsh
    else
      JSON.generate hsh
    end # if-else
  end # method export
end # class
