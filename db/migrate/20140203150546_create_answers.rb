class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text

      t.timestamps
    end
    add_reference :answers, :question, index: true
    add_foreign_key(:answers, :questions)
  end
end
