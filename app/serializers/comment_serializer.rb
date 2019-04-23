class CommentSerializer < ActiveModel::Serializer
  attributes :id, :note
  has_many :plants
end
