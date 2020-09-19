FactoryBot.define do
    factory :post do
      title { "Пост о котиках" }
      body  { "Много информации о котиках" }
      
      trait :about_design do
        title { "Пост о котиках" }
        body  { "Много информации о котиках" }
        association :topic, factory: [:topic, :design]
      end  
      trait :about_story do
        title { "Пост о собачках" }
        body { "Много информации о собачках" }
        association :topic, factory: [:topic, :story]
      end  
      trait :about_fentesy do
        title { "Пост о хомячках" }
        body { "Много информации о хомячках" }
        association :topic, factory: [:topic, :fentesy]
      end  
      trait :about_publication do
        title { "Пост о черепашках" }
        body { "Много информации о черепашках" }
        association :topic, factory: [:topic, :publication]
      end  
      trait :about_detective do
        title { "Пост о кроликах" }
        body { "Много информации о кроликах" }
        association :topic, factory: [:topic, :detective]
      end  
    end
    
    factory :topic do
        trait :design do
          add_attribute(:alias) { "design" }
          title { "Дизайн" }
        end  
        trait :publication do 
          add_attribute(:alias) { "publication" }
          title { "Публикации" }
        end  
        trait :detective do
          add_attribute(:alias) { "detective" }
          title { "Детективы" }
        end  
        trait :fentesy do
          add_attribute(:alias) { "fentesy" }
          title { "Фентези" }
        end  
        trait :story do
          add_attribute(:alias) { "story" }
          title { "Мелодрама" }
        end
        trait :story do
            add_attribute(:alias) { "some" }
            title { "Разное" }
          end
    end

   # factory :comment do
   #   body  { "Очень милый котик" }
   #   parent_id { 0 }
   #   association :post, factory: :post
   # end  
  end