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

first_post = Post.create(title: 'Hello1', text: 'This is my first post1', user_id: first_user.id)
second_post = Post.create(title: 'Hello2', text: 'This is my first post2', user_id: second_user.id)

Comment.create(post: first_post.id, user_id: first_user.id, text: 'Hi Tom!1')
Comment.create(post: second_post.id, user_id: second_user.id, text: 'Hi Tom!2')