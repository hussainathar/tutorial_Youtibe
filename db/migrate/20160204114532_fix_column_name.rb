class FixColumnName < ActiveRecord::Migration
  # def change
  # 	change_table :comments do |t|
  #     t.rename :ststus, :status
  #   end
    rename_column :comments, :ststus, :status
  
end