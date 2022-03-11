def seed
  reset_db
  create_users
  create_quizzes
  create_questions
  create_answers
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  i = 0

  3.times do
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
    puts "Quiz created with id #{quiz.id}, name #{quiz.title}, description: #{quiz.description}. Takes #{quiz.requested_time} minutes to pass. Created by user #{quiz.user.name} with id #{quiz.user.id}"
  end
end

def create_questions
  quizzes = Quiz.all

  quizzes.each do |quiz|
    3.times do
      user = quiz.user
      question = quiz.questions.create!(user_id: user.id, question: "How r u doing?", body: "Well or not?")
      # Лучше переименовать question.question в title
      puts "Question: #{question.question} with options #{question.body} was genereated by user with id #{question.user.id} in quiz with id #{quiz.id}"
    end
  end
end

def create_answers
  # Найти все вопросы всех пользователей
  # questions = Question.all
  # users = User.all
  #
  # Создать для каждого вопроса от каждого пользователя ответ
  # questions.each do |question|
  #   users.each do |user|
  #     answer = question.answers.create!(result: "Well", user_id: user.id)
  #     puts "User with id #{user.id} answered the question with id #{answer.question.id} from quiz with id #{answer.quesion.quiz.id}"
  #   end
  # end

  quizzes = Quiz.all
  questions = Question.all

  questions.each do |question|
    quizzes.each do |quiz|
      3.times do
        user = User.all.sample
        quiz_creator = quiz.user
        answer = question.answers.create!(result: "Well", user_id: user.id, question_id: question.id)
        answer_creator = answer.user
        puts "User with id #{quiz_creator.id} created a quiz with id #{quiz.id}, with question: #{question.question} with options #{question.body}. User with id #{answer_creator.id} answered #{answer.result} on a question with id #{question.id}"
      end
    end
  end
end

seed
