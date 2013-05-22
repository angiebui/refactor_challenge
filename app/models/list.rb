class List < ActiveRecord::Base
  attr_accessible :name
  has_many :todos

  def self.sanitize list_name
    list_name.downcase.gsub ' ', '-'
  end

end
