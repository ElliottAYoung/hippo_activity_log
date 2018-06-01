class AddLoanApplicationDataTrackingToEvents < ActiveRecord::Migration
  def change
    add_column :loan_application, :jsonb, default: {}
    add_column :loan_application_id, :integer, index: true
  end
end
