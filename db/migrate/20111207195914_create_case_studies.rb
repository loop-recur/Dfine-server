class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.string :title
      t.timestamps
    end
  end
end
