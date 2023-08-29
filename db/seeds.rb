
Admin.create!(
  email: 'x@y.com',
  password: '1234567890',
  name: 'からあげ保育園',
)


User.create!([
  { email: 'tanaka@example.com', user_name: 'いちご保育園', last_name: '田中', first_name: 'A美園長', password: 'password', is_deleted: 'false' },
  { email: 'satou@example.com', user_name: 'サトウ', last_name: '佐藤', first_name: '太郎', password: 'password', is_deleted: 'false' },
  { email: 'yamada@example.com', user_name: 'ヤマダ', last_name: '山田', first_name: '花子', password: 'password', is_deleted: 'false' },
  { email: 'kobayashi@example.com', user_name: 'コバヤシ', last_name: '小林', first_name: '尚子', password: 'password', is_deleted: 'false' },
])

Tag.create!([
  { name: '離乳食5～6か月（ごっくん期）' },
  { name: '離乳食7～8か月（もぐもぐ期）' },
  { name: '離乳食9～11か月（かみかみ期）' },
  { name: '離乳食12～18か月（ぱくぱく期）' },
  { name: '幼児食' }
])

Genre.create!([
  { name: '主食' },
  { name: '主菜' },
  { name: '副菜' },
  { name: '汁物' },
  { name: 'おやつ' }
])

Recipe.create!([
  { user_id:1 ,genre_id:2, name: '麻婆豆腐', introduction: 'ひき肉たっぷり、辛くない麻婆豆腐です', number_of_people: '4', how_to_make: '１，具材を切って、フライパンに入れる。２，炒めてから調味料で味付けをする。３，水溶き片栗粉を入れてとろみをつけて完成！', post_status: 'true', created_at: 'Sat, 24 Jun 2023 07:29:13.536560000 JST +09:00', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe1.jpg"), filename: "sample-recipe1.jpg")},
  { user_id:3 ,genre_id:3, name: 'ねばねばサラダ', introduction: '山芋、納豆、オクラがねばねばしていて、食欲の落ちる夏には大人にも人気なサラダです', number_of_people: '12', how_to_make: '１，下ゆでしたオクラ、山芋、きゅうりを食べやすい大きさに切る２，だし、ポン酢、白ごまを材料に混ぜ合わせて冷蔵庫で20分冷やして完成です', post_status: 'true', created_at: 'created_at: Sat, 24 Jun 2023 09:22:45.392898000 JST +09:00', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe2.jpg"), filename: "sample-recipe2.jpg")},
  { user_id:2 ,genre_id:3, name: '無限ピーマン', introduction: '苦みが少なく、ピーマン嫌いな子どもたちもパックパク食べています', number_of_people: '3', how_to_make: '１，切ったピーマンを耐熱容器に入れ、軽く油切りしたツナ・マヨネーズ・鶏がらスープの素・ごま油を入れて軽く混ぜる２，ラップをして600wで2〜3分加熱する３，加熱後よく混ぜ、味を見て塩胡椒で味を整えて完成', post_status: 'true', created_at: 'Sat, 24 Jun 2023 07:29:13.536560000 JST +09:00', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe3.jpg"), filename: "sample-recipe3.jpg")},
  { user_id:3 ,genre_id:1, name: 'チャーハン', introduction: 'うちの子がよく食べてます！', number_of_people: '3', how_to_make: '野菜は全て細かく切って、米と一緒に炒めて完成です。', post_status: 'true', created_at: 'created_at: Sat, 24 Jun 2023 09:10:45.392898000 JST +09:00', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe4.jpg"), filename: "sample-recipe4.jpg")},
  { user_id:1 ,genre_id:4, name: '小松菜と豆腐のみそ汁', introduction: '野菜嫌いな子も汁と一緒に1口食べてみようとする子が多い１品です', number_of_people: '5', how_to_make: '鍋にだしを取り、小松菜と絹豆腐を切って、入れて煮つめて、味噌を解いて完成！', post_status: 'true', created_at: 'Sat, 24 Jun 2023 07:29:13.536560000 JST +09:00', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe5.jpg"), filename: "sample-recipe5.jpg")}
])

RecipeIngredient.create!([
  { recipe_id:1 , ingredient:'豆腐', ingredient_amount:"300g" },
  { recipe_id:1 , ingredient:'ひき肉', ingredient_amount:"200g" },
  { recipe_id:1 , ingredient:'水溶き片栗粉', ingredient_amount:"大さじ2" },
  { recipe_id:2 , ingredient:'きゅうり', ingredient_amount:"2本" },
  { recipe_id:2 , ingredient:'オクラ', ingredient_amount:"5本" },
  { recipe_id:2 , ingredient:'納豆', ingredient_amount:"1パック" },
  { recipe_id:3 , ingredient:'ピーマン', ingredient_amount:"3個" },
  { recipe_id:3 , ingredient:'にんじん', ingredient_amount:"1/2本" },
  { recipe_id:3 , ingredient:'ツナ缶', ingredient_amount:"1缶" },
  { recipe_id:4 , ingredient:'お米', ingredient_amount:"300g" },
  { recipe_id:4 , ingredient:'卵', ingredient_amount:"2個" },
  { recipe_id:4 , ingredient:'ネギ', ingredient_amount:"1/4本" },
  { recipe_id:5 , ingredient:'小松菜', ingredient_amount:"200g" },
  { recipe_id:5 , ingredient:'絹豆腐', ingredient_amount:"1丁" },
  { recipe_id:5 , ingredient:'味噌', ingredient_amount:"大さじ3" }
])

Comment.create!([
  { user_id:2 ,recipe_id:2 ,comment: 'おいしそう！' },
  { user_id:3 ,recipe_id:2 ,comment: '作ってみたいです' },
  { user_id:1 ,recipe_id:3 ,comment: '保育園でも参考にしてみますね！' },
  { user_id:4 ,recipe_id:2 ,comment: '山芋のレシピありがたいです' },
  { user_id:2 ,recipe_id:5 ,comment: 'ワカメ苦手な子だから、作ってみたいと思います' },
  { user_id:4 ,recipe_id:4 ,comment: 'うちの子いっぱい食べました！' }
])

RecipeTagRelation.create!([
  {recipe_id: 1, tag_id: 5 },
  {recipe_id: 1, tag_id: 4 },
  {recipe_id: 2, tag_id: 3 },
  {recipe_id: 4, tag_id: 1 },
  {recipe_id: 5, tag_id: 2 }
])

Favorite.create!([
  { user_id:1 ,recipe_id:1 },
  { user_id:2 ,recipe_id:3 },
  { user_id:3 ,recipe_id:2 },
  { user_id:4 ,recipe_id:1 },
  { user_id:1 ,recipe_id:4 },
  { user_id:3 ,recipe_id:5 }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

