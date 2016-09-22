class InitialSchema < ActiveRecord::Migration
  def change

    create_table :postings do |p|
      p.string  :title, limit: 60, null: false
      p.text  :description
      p.integer :salary
      p.string :location
      p.float :latitude
      p.float :longitude
      p.boolean  :open, default: true
      p.timestamps
    end

    create_table :submitals do |a|
      a.timestamps
    end

    add_reference  :postings, :user, index: true
    add_reference  :submitals, :posting, index: true
    add_reference  :submitals, :user, index: true

  end
end
