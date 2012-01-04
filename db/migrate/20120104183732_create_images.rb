class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.string :upload_file_name, :upload_content_type
      t.integer :upload_file_size
      t.datetime :upload_updated_at
      t.belongs_to :case_study
      t.timestamps
    end
  end
end
