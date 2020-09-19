require 'test_helper'
require 'application_system_test_case'

class PostWorkflowTest < ApplicationSystemTestCase
  def setup
    @post = create(:post, :about_publication)
    create(:topic, :design)
    create(:topic, :story)
    create(:topic, :detective)
    create(:topic, :fentesy)
  end

  test 'post show' do
    visit "/posts/" + @post.id.to_s

    assert page.has_content?(@post.title)
    assert page.has_content?(@post.body)
  end

  test 'successful post create and edit' do
    # creating post
    visit "/posts/new"

    fill_in "Title", with: "Про моего хомяка"
    fill_in "Text",  with: "История моего хомяка"
    select("Фентези", from: "Choose tema")

    click_on "Создать"

    post_id =  Post.last.id.to_s
    assert_current_path "/posts/" + post_id
    assert page.has_content?("Про моего хомяка")
    assert page.has_content?("История моего хомяка")

    # editing post
    visit "/posts/edit/" + post_id
    page.has_select?('post[topic]', selected: 'Фентези')
    fill_in "Title", with: "Про мою черепашку"
    fill_in "Text",  with: "История моей черепашки"
    select("Дизайн", from: "Choose tema")

    click_on "Сохранить"
    assert_current_path "/posts/" + post_id
    assert page.has_content?("Про мою черепашку")
    assert page.has_content?("История моей черепашки")
    visit "/posts/edit/" + post_id
    page.has_select?('post[topic]', selected: 'Дизайн')
 end

 test 'post create validation errors' do
    # creating post
    visit "/posts/new"

    fill_in "Title", with: ""
    fill_in "Text",  with: ""
    
    click_on "Создать"

    assert page.has_content?("Введите заголовок")
    assert page.has_content?("Введите пост")

    fill_in "Title", with: "x" * 301
    
    click_on "Создать"
    assert page.has_content?("Заголовок слишком длинный")
 end

 test 'post edit validation errors' do
    # editing post
    visit "/posts/edit/" + @post.id.to_s

    fill_in "Title", with: ""
    fill_in "Text",  with: ""
    
    click_on "Сохранить"

    assert page.has_content?("Введите заголовок")
    assert page.has_content?("Введите пост")

    fill_in "Title", with: "x" * 301
    
    click_on "Сохранить"
    assert page.has_content?("Заголовок слишком длинный")
 end
end