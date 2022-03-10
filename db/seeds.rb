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

def create_answers
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
