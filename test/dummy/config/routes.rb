Rails.application.routes.draw do
  mount HippoActivityLog::Engine => "/hippo_activity_log"
end
