require "csv"

class ExportCsvService
  attr_reader :attributes, :objects, :header, :header_order
  
  def initialize objects, attributes
    @attributes = attributes
    @objects = objects
    @header = attributes.map { |attr| I18n.t("header_csv.#{attr}") }
    @header_order = Order::CSV_ATTRIBUTES_ORDER.map { |attr| I18n.t("header_csv.#{attr}") }
  end

  def perform
    CSV.generate do |csv|
      csv << header
      objects.each do |object|
        if object != objects.last
          csv << object.values 
        else
          csv << header_order
          csv << object.values 
        end
      end
    end
  end
end
