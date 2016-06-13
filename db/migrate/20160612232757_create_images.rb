class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :name
    	t.string :description
    	t.belongs_to :project, index: true
      t.timestamps null: false
    end

    add_attachment :images, :image_attach

    add_column :projects, :completed_date, :date
  end
end
