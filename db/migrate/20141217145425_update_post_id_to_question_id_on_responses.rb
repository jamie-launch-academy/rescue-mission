class UpdatePostIdToQuestionIdOnResponses < ActiveRecord::Migration
  def change
    rename_column :responses, :post_id, :question_id
  end
end
