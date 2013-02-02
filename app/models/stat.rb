class Stat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :average, type: Float
  field :median, type: Float
  field :mode, type: Float

  embeds_many :posts
end
