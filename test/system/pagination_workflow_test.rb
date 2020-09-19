require 'test_helper'
require 'application_system_test_case'

class PaginationWorkflowTest < ApplicationSystemTestCase 
  def setup
    @topic_design = create(:topic, :design)
    @topic_publication = create(:topic, :publication)
    @topic_detective = create(:topic, :detective)
    @topic_fentesy = create(:topic, :fentesy)
    @topic_story = create(:topic, :story)

    @post_design = create_list(:post, 4, :about_design, topic: @topic_design)[0]
    @post_publication = create_list(:post, 4, :about_publication, topic: @topic_publication)[0]
    @post_detective = create_list(:post, 4, :about_detective, topic: @topic_detective)[0]
    @post_fentesy = create_list(:post, 4, :about_fentesy, topic: @topic_fentesy)[0]
    @post_story = create_list(:post, 4, :about_story, topic: @topic_story)[0]
  end

  test 'index pagination' do
    visit "/"
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_story.title, count: 3)

    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_story.title, count: 1)
    page.has_content?(@post_fentesy.title, count: 2)

    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_fentesy.title, count: 2)
    page.has_content?(@post_detective.title, count: 1)

    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_detective.title, count: 3)

    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_publication.title, count: 3)

    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_publication.title, count: 1)
    page.has_content?(@post_design.title, count: 2)

    click_on "Newer"
    
    page.has_css?("card-body", count: 2)
    page.has_content?(@post_design.title, count: 2)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_publication.title, count: 1)
    page.has_content?(@post_design.title, count: 2)

    click_on "Newer"
    click_on "Older"
    click_on "Newer"
    click_on "Older"
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_story.title, count: 3)
  end

  test 'topic pagination' do
    topics = [
        {
            "path" => "/posts/design",
            "post" => @post_design
        },
        {
            "path" => "/posts/publication",
            "post" => @post_publication
        },
        {
            "path" => "/posts/detective",
            "post" => @post_detective
        },
        {
            "path" => "/posts/fentesy",
            "post" => @post_fentesy
        },
        {
            "path" => "/posts/story",
            "page_title" => "Мелодрама",
            "post" => @post_story
        }
    ]

    topics.each do |topic_data|
        visit topic_data["path"]
        page.has_content?(topic_data["post"].title, count: 3)
        click_on "Newer"
        page.has_content?(topic_data["post"].title, count: 1)
        click_on "Older"
        page.has_content?(topic_data["post"].title, count: 3)
    end    
  end
end