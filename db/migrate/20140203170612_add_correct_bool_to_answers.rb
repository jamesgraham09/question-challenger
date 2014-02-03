class AddCorrectBoolToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :correct, :boolean
  end
end
