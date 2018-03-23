module HippoActivityLog
  module EventHelper
    def build_event(args)
      Event.create({
        object: args[:object],
        object_id: args[:object_id],
        object_type: args[:resource],
        author: args[:author],
        author_id: args[:author][:id],
        author_type: args[:author_type],
        action: args[:event_type],
        timestamp: args[:timestamp],
        partner_id: args[:partner_id],
        user: args[:user],
        user_id: args[:user_id],
        params: args[:event_args],
        name: args[:event_class],
        raw_data: args
      })
    end
  end
end
