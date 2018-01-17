class DelRelationship < ActiveRecord::Migration[5.1]
  def change
    drop_table :relationships
  end
end
