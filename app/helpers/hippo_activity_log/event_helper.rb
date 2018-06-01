module HippoActivityLog
  module EventHelper
    def build_event(args)
      Event.create({
        object: args[:object],
        object_id: args[:object].try('fetch', :id),
        object_type: args[:resource],
        author: args[:author],
        author_id: args[:author].try('fetch', :id),
        author_type: args[:author_type],
        action: args[:event_type],
        timestamp: args[:timestamp],
        partner_id: args[:partner_id],
        user: args[:user],
        user_id: args[:user_id],
        loan_application: args[:loan_application],
        loan_application_id: args[:loan_application_id],
        params: args[:event_args],
        name: args[:event_class],
        raw_data: args
      })
    end

    def queried_events(filter_param, sort_param, page_param)
      events = Event.ransack(filter_param)
      events.sorts = sort_param == nil ? "id asc" : sort_param
      events.result.paginate(page: page_param, per_page: 20)
    end
  end
end
