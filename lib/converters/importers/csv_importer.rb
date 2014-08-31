# lib/converters/importers/csv_importer.rb

class CSVImporter
  attr_reader :columns

  def import values
    lines = extract_columns(values)

    lines.map { |line| extract_line(line) }
  end # method import

  private

  def extract_columns values
    lines    = values.split(/\n|\r|\r\n/).reject { |str| str.empty? }
    @columns = lines.shift.split(',')

    lines
  end # method extract_columns

  def extract_line line
    hsh    = {}
    values = line.split(',').map { |str| extract_value str }

    values.each.with_index do |value, index|
      column = columns[index]
      hsh[column] = value
    end # each

    hsh
  end # method extract_line

  def extract_value string
    value = string.chomp

    case
    when value.empty?
      nil
    when value =~ /\A-?[0-9]+\z/
      value.to_i
    else
      value
    end # case
  end # method extract_value
end # class
