class CreateCommentanswers < ActiveRecord::Migration[7.0]
  def change
    create_table :commentanswers do |t|
      t.string :body
      t.belongs_to :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
