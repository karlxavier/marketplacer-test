class Product
  include ActiveModel::Model

  attr_accessor :uuid, :name, :price

  FILE_PATH = Rails.root.join("storage", "products.json")

  def initialize(attributes)
    @uuid = attributes["uuid"].to_s
    @name = attributes["name"]
    @price = attributes["price"].to_f
  end

  def self.all
    @all ||= JSON.parse(File.read(FILE_PATH)).map { |item| new(item) }
  end

  def self.find_by_uuid(uuid)
    all.find { |product| product.uuid.to_s == uuid.to_s }
  end
end
