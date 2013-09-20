class Plant < ActiveRecord::Base
  attr_accessible :common_names, :en, :gang, :ke, :latin, :men, :mu, :name, :shu, :slug
  #def to_param
    #slug
  #end
  #def self.find id
    #if id.is_a?(String) and id.to_i.zero?
      #find_by_slug id
      #else
      #super id
    #end
  #end
end
