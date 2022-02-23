# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Zain', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Pakistan.')
fourth_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Canada.')
fifth_user = User.create(name: 'Alien', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Australia.')
sixth_user = User.create(name: 'Putin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Moscow.')

first_post = Post.create(title: 'Hello1', text: 'This is my first post1', user_id: first_user.id)
second_post = Post.create(title: 'Hello2', text: 'This is my first post2', user_id: first_user.id)
third_post = Post.create(title: 'Hello3', text: 'This is my first post3', user_id: second_user.id)
fourth_post = Post.create(title: 'Hello4', text: 'This is my first post4', user_id: second_user.id)
fifth_post = Post.create(title: 'Hello5', text: 'This is my first post5', user_id: third_user.id)
sixth_post = Post.create(title: 'Hello6', text: 'This is my first post6', user_id: third_user.id)

Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Hi Tom!1')
Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Hi Tom!2')
Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Hi Tom!3')
Comment.create(post_id: second_post.id, user_id: second_user.id, text: 'Hi Tom!4')
Comment.create(post_id: second_post.id, user_id: second_user.id, text: 'Hi Tom!5')
Comment.create(post_id: second_post.id, user_id: second_user.id, text: 'Hi Tom!6')
Comment.create(post_id: third_post.id, user_id: third_user.id, text: 'Hi Tom!7')
Comment.create(post_id: third_post.id, user_id: third_user.id, text: 'Hi Tom!8')
Comment.create(post_id: third_post.id, user_id: third_user.id, text: 'Hi Tom!9')