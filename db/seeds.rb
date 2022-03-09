def seed
  reset_db
  create_users
  create_quizzes
  create_questions
  # create_answers
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest',
      name: 'Arsenii',
      surname: 'Bychin',
      group: 'ADC_19'
    }

    if i == 0
      user_data[:email] = "admin@email.com"
      user_data[:admin] = true
    end

    user = User.create!(user_data)
    puts "User created with id #{user.id}, name #{user.name}, surname #{user.surname} from group #{user.group}"
    i += 1
  end
end

def create_quizzes
  3.times do
    user = User.all.sample
    quiz = user.quizzes.create!(title: "Quiz app info", description: "quiz about is it ok to make app for quiz", requested_time: "5")
    puts "Quiz created with id #{quiz.id}, name #{quiz.title}, description: #{quiz.description}. Takes #{quiz.requested_time} minutes to pass. Created by user #{user.name} with id #{user.id}"
  end
end

def create_questions
  quizzes = Quiz.all

  quizzes.each do |quiz|
    3.times do
      user = User.all.sample
      question = quiz.questions.create!(user_id: user.id, quiz_id: quiz.id, question: "How r u doing?", body: "Well or not?")
      puts "Question: #{question.question} with options #{question.body} was genereated by user with id #{user.id} in quiz with id #{quiz.id}"
    end
end
end
# НЕ РАБОТАЕТ
# def create_answers
#     user = User.all.sample(2)
#     quizzes = Quiz.all
#     question = Question.all
#     answer = Answer.create!(result: "Well", user_id: user.id, question_id: question.id)
#
#     users[0].quizzes.create!(title: "Quiz app info", description: "quiz about is it ok to make app for quiz", requested_time: "5")
#     users[0].quiz_questions.create!(user_id: user.id, quiz_id: quiz.id, question: "How r u doing?", body: "Well or not?")
#     users[1].user_answers.create!(result: answer.result, user_id: user.id, question_id: question_id)
#     puts "User with id #{user[0].id} created a quiz with #{quiz.id}, with question: #{question.question} with options #{question.body}. User with id #{user[1].id} answered #{answer.result}"
#


seed
