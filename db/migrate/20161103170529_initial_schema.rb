class InitialSchema < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
    end

    create_table :comments do |t|
      t.text :body
      t.timestamps
    end

    add_reference :comments, :story, index: true
    add_reference :comments, :user, index: true
    add_reference :stories, :user, index: true
    add_reference :stories, :category, index: true

  end
end
