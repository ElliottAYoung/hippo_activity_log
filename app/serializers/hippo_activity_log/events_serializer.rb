module HippoActivityLog
  class EventsSerializer < ActiveModel::Serializer
    attributes :object, :object_type, :author, :author_type, :action, :timestamp, :partner_id, :user, :params, :name
  end
end
