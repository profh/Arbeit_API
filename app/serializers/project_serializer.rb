class ProjectSerializer < ActiveModel::Serializer
  
  attributes :id, :name
  has_many :tasks
  has_one :domain
  
end
