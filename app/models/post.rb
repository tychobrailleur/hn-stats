class Post
  include Mongoid::Document

  field :title, type: String
  field :url, type: String
  field :id, type: Integer
  field :points, type: Integer

  embedded_in :stat
end
