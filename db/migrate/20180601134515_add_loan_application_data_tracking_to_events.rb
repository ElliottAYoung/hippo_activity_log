class AddLoanApplicationDataTrackingToEvents < ActiveRecord::Migration
  def change
    add_column :hippo_activity_log_events, :loan_application, :jsonb, default: {}
    add_column :hippo_activity_log_events, :loan_application_id, :integer, index: true
  end
end
