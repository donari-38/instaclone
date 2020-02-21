# frozen_string_literal: true

class AddContentToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content, :string
  end
end
