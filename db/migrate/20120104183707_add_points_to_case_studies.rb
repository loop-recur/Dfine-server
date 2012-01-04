class AddPointsToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_studies, :points, :text
  end
end
