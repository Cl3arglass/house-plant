class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :light, :watering
end
