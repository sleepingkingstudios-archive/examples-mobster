# lib/converters/base_converter.rb

# Require all of the importers and exporters automatically.
Dir[File.join __dir__, *%w(importers *.rb)].each { |f| require f }

class BaseConverter
  attr_accessor :hashed_data

  attr_reader :raw_data

  def default_exporter
    :json
  end # method default_exporter

  def default_importer
    :csv
  end # method default_importer

  def import raw_data, options = {}
    @raw_data = raw_data
    importer  = constantize("#{options.fetch(:format, default_importer).upcase}Importer").new

    @hashed_data = importer.import(raw_data)
  end # method import

  private

  def constantize string
    return string.constantize if defined?(string.constantize)

    ns = Object

    string.split('::').each do |segment|
      if ns.const_defined?(segment)
        ns = ns.const_get(segment)
      else
        raise NameError.new "uninitialized constant #{string}", string
      end # if-else
    end # string

    ns
  end # method constantize
end # class
