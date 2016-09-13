class Order < ApplicationRecord
  validates :buyer, :description, :unit_price,
            :quantity, :address, :supplier,
            presence: true

  def self.parse(file)
    line_items = split_lines(file)
    line_items = remove_header(line_items)
    line_items = split_subitems(line_items)
    normalize_data(line_items)
  end

  private
  def self.split_lines(file)
    file.split(/\n/)
  end

  def self.remove_header(line_items)
    line_items.drop(1)
  end

  def self.split_subitems(line_items)
    line_items.map { |line| line.split(/\t/) }
  end

  def self.normalize_data(items)
    keys = [:buyer, :description, :unit_price, :quantity, :address, :supplier]
    items.map {|item| Hash[keys.zip(item)] }
  end
end
