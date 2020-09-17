class ModifyTopics < ActiveRecord::Migration[6.0]
  def change
    add_index :topics, :alias, unique: true
      Topic.create :alias => "design", :title => "Дизайн"
      Topic.create :alias => "publication", :title => "Публикации"
      Topic.create :alias => "books", :title => "Книги"
      Topic.create :alias => "detective", :title => "Детективы"
      Topic.create :alias => "fentesy", :title => "Фентези"
      Topic.create :alias => "story", :title => "Мелодрама"
      Topic.create :alias => "some", :title => "Разное"
  end
end
