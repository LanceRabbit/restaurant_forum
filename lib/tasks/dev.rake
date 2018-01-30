namespace :dev do
  # restaurant
  task fake_restaurant: :environment do
    Restaurant.destroy_all
    puts " create fake restaurants data ..."
    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts " #{Restaurant.count} restaurants data"
  end
  
  # user
  task fake_user: :environment do
    #User.destroy_all
    puts " create fake users data ..."
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        email: "#{user_name}@example.com",
        password: "12345678",
        name: "#{user_name}"
      )
    end
    puts " #{User.count} users data"
  end

  # comment
  task fake_comment: :environment do
    Comment.destroy_all
    puts " create fake comment data ..."
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts " #{Comment.count} comment data"
  end

  # favorite
  task fake_favorite: :environment do
    Favorite.destroy_all
    puts "creating fake favorites..." 
    User.all.each do |user|
     20.times do
      user.favorites.create!(
        restaurant: Restaurant.all.sample,
       )      
     end     
    end
    puts " #{Favorite.count} favorited restaurants"
  end 

  # like
  task fake_like: :environment do
    Like.destroy_all
    puts "creating fake likes..." 
    User.all.each do |user|
     5.times do
      user.likes.create!(
        restaurant: Restaurant.all.sample,
       )      
     end     
    end
    puts " #{Like.count} liked restaurants"
  end  

  #fake all data
  task fake_all: :environment do
    # Rake::Task['db:drop'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_restaurant'].execute
    Rake::Task['dev:fake_user'].execute
    Rake::Task['dev:fake_comment'].execute
    Rake::Task['dev:fake_favorite'].execute
    Rake::Task['dev:fake_like'].execute
  end
end