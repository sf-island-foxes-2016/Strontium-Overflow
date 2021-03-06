class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :approval
      t.belongs_to :user
      t.references :votable, polymorphic: true, index: true

      t.timestamps(null: false)
    end
  end
end
