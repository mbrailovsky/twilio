class AddSecurityQuestionAssociationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :security_question_id, :integer
  end
end
