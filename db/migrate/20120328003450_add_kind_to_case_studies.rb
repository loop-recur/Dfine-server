class AddKindToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_studies, :kind, :string
  end
end
