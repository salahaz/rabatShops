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

  # Finds shops nearby to the provided longitude, and latitude exclude does already liked by the user
  def self.nearby(lng,lat, id)
    @user = User.find(id)
    Shop.where(id: { :$nin => @user.favorite_places }).near( :"location"=> { :"type"=>"Point", :"coordinates"=> [-6.8526685, 34.0019086] } ).each { |shop| pp "#{shop.picture}, #{shop.name}, #{shop.email}, #{shop.city}, #{shop.location}"}
  end

end
