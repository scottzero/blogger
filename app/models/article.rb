class Article < ApplicationRecord
  validates_presence_of :title, :body
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings


  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_String)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    #join tag strings on comma
    #strip to remove whitespace
    #uniq to remove duplicates
    #downcase to lowercase
  end

end
