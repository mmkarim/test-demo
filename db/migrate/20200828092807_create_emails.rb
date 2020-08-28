class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :to
      t.string :from
      t.text :message_body
      t.string :direction

      t.timestamps
    end
  end
end
