class CreateJoinTableDetailsPosts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :details, :posts do |t|
      t.index [:detail_id, :post_id]
       t.index [:post_id, :detail_id]
    end
  end
end
