class TaskSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :project_name
  
  def project_name
    "#{object.project.name}"
  end
  
end
