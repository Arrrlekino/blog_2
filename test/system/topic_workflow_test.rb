require 'test_helper'
require 'application_system_test_case'

class TopicWorkflowTest < ApplicationSystemTestCase 
  def setup
    @post_design = create(:post, :about_design)
    @post_publication = create(:post, :about_publication)
    @post_detective = create(:post, :about_detective)
    @post_fentesy = create(:post, :about_fentesy)
    @post_story = create(:post, :about_story)
  end

  test 'topic pages' do
    topics = [
        {
            "path" => "/posts/design",
            "page_title" => "Дизайн",
            "post" => @post_design
        },
        {
            "path" => "/posts/publication",
            "page_title" => "Публикации",
            "post" => @post_publication
        },
        {
            "path" => "/posts/detective",
            "page_title" => "Детективы",
            "post" => @post_detective
        },
        {
            "path" => "/posts/fentesy",
            "page_title" => "Фентези",
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
        page.has_content?(topic_data["page_title"])
        page.has_content?(topic_data["post"].title)
        page.has_content?(topic_data["post"].body)
    end
  end
end