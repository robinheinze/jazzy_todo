class TodoSerializer < ActiveModel::Serializer
  attributes :title, :is_completed
end