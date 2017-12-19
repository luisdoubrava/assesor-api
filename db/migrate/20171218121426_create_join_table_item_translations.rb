class CreateJoinTableItemTranslations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :items, :translations do |t|
      # t.index [:item_id, :translation_id]
      # t.index [:translation_id, :item_id]
    end
  end
end
