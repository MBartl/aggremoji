class CreateEmojiData < ActiveRecord::Migration[5.2]
  def change
    create_table :emojis do |t|
      t.string :name
      t.string :file
      t.string :url
      t.timestamps
    end
  end
end
