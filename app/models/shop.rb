class Shop
  include Mongoid::Document
  include Mongoid::Timestamps

  field :picture, type: String
  field :name, type: String
  field :email, type: String
  field :city, type: String
  field :location, type: Point

  validates_presence_of :name, :email, :city, :location

  def sanitize_for_mass_assignment(params)
    params ||= {}
    params.each_pair do |key, val|
      case 
      when ["location"].include?(key)
        params[key]=Point.demongoize(val)
      else
      end
    end
  end

end