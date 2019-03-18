class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :light, :watering
  belongs_to :comment
end
