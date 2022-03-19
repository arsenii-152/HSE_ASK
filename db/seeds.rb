@users_data = [
  {
    email: "arseniytnt@gmail.com",
    password: 'testtest',
    name: 'Arsenii',
    surname: 'Bychin',
    group: 'ADC_19'
  },
  {
    email: "jaroslaw.chaikin@gmail.com",
    password: 'testtest',
    name: 'Jaroslaw',
    surname: 'Chaikin',
    group: 'ADC_19'
  }
]

def seed
  reset_db
  create_users
  create_quizzes
  create_questions
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_user(user_data)
  User.create!(
    email: user_data[:email],
    password: user_data[:password],
    name: user_data[:name],
    surname: user_data[:surname],
    group: user_data[:group]
  )
end

def create_users
  @users_data.each do |user_data|
  user = create_user(user_data)

  puts "User with name #{user.name}, surname #{user.surname} from group #{user.group} created with email #{user.email}"
  end
end



def create_quizzes
    user = User.all.sample

    quiz = user.quizzes.create!(title: "Quiz app info", description: "quiz about is it ok to make app for quiz", requested_time: "5")
    puts "Quiz created with id #{quiz.id}, name #{quiz.title}, description: #{quiz.description}. Takes #{quiz.requested_time} minutes to pass. Created by user #{quiz.user.name} with id #{quiz.user.id}"
  end

def create_questions
  quiz = Quiz.all.sample

  # quizzes.each do |quiz|
  5.times do
      user = quiz.user
      question = quiz.questions.create!(user_id: user.id, title: "How r u doing?", body: "type here")
      puts " which is: #{question.title} was genereated by #{quiz.user.name} in quiz with id #{quiz.id}"
    end
end



seed
