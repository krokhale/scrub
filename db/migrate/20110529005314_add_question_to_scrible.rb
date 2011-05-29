class AddQuestionToScrible < ActiveRecord::Migration
  def self.up
    add_column :scribles, :question, :string
  end

  def self.down
    remove_column :scribles, :question
  end
end
