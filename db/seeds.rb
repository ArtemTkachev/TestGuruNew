# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ruby_category = Category.create(title: 'Ruby')
go_category = Category.create(title: 'Go')
js_category = Category.create(title: 'JS')

artur_user = User.create(name: "Artur", password: "123asdf", email: "fhg@gjhf.com")
john_user = User.create(name: "John", password: "456qwer", email: "khk@kfl.com")

gen_ruby_test = Test.create(title: "General Ruby", level: 1, category_id: ruby_category.id, author_id: artur_user.id)
gen_go_test = Test.create(title: "General Go", level: 1, category_id: go_category.id, author_id: artur_user.id)
gen_js_test = Test.create(title: "General JS", level: 2, category_id: js_category.id, author_id: artur_user.id)
practic_go_test = Test.create(title: "General Go", level: 2, category_id: go_category.id, author_id: john_user.id)
practic_js_test = Test.create(title: "General Go", level: 3, category_id: js_category.id, author_id: john_user.id)

question_1 = Question.create(body: "What type of programming language does Go belong to?", test_id: gen_ruby_test.id)
question_2 = Question.create(body: "What type of programming language does Ruby belong to?", test_id: gen_go_test.id)
question_3 = Question.create(body: "What type of programming language does JS belong to?", test_id: gen_js_test.id)
question_4 = Question.create(body: "List the Go language data types", test_id: practic_go_test.id)
question_5 = Question.create(body: "I don't know JS data types", test_id: practic_js_test.id)


answer_1 = Answer.create(body: "I don't know Go", correct: false, question_id: question_1.id)
answer_2 = Answer.create(body: "I don't know Ruby", correct: false, question_id: question_2.id)
answer_3 = Answer.create(body: "I don't know JS", correct: false, question_id: question_3.id)
answer_4 = Answer.create(body: "I don't know Go data types", correct: false, question_id: question_4.id)
answer_5 = Answer.create(body: "I don't know JS data types", correct: false, question_id: question_5.id)

TestPassage.create([{ user_id: artur_user.id, test_id: gen_ruby_test.id, current_question_id: question_1.id },
                  { user_id: artur_user.id, test_id: gen_go_test.id, current_question_id: question_2.id },
                  { user_id: artur_user.id, test_id: gen_js_test.id, current_question_id: question_3.id },
                  { user_id: john_user.id, test_id: practic_go_test.id, current_question_id: question_4.id},
                  { user_id: john_user.id, test_id: practic_js_test.id, current_question_id: question_5.id }])
