class CreateCommentquestions < ActiveRecord::Migration[7.0]
  def change
    create_table :commentquestions do |t|
      t.string :body
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
