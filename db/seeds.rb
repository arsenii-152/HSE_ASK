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
  create_question_options
  create_basic_answers
  create_complex_answers
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  @users_data.each do |user_data|
  user = create_user(user_data)

  puts "User with name #{user.name}, surname #{user.surname} from group #{user.group} created with email #{user.email}"
  end
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


def create_quizzes
  user = User.first
  quiz = user.quizzes.create!(title: "Quiz app info", description: "quiz about is it ok to make app for quiz", requested_time: "5")
  puts "Quiz created with id #{quiz.id}, name #{quiz.title}, description: #{quiz.description}. Takes #{quiz.requested_time} minutes to pass. Created by user #{quiz.user.name} with id #{quiz.user.id}"
end

def create_questions
  quiz = Quiz.first
  user = User.first

  data = {
    user_id: user.id,
    title: 'test',
    body: 'test'
  }

  questions = [
    quiz.short_text_questions.create!(data),
    quiz.long_text_questions.create!(data),
    quiz.single_choice_questions.create!(data),
    quiz.multiple_choice_questions.create!(data)
  ]

  questions.each do |q|
    puts "#{q[:type]} created with id #{q[:id]}"
  end
end

def create_question_options
  questions = SingleChoiceQuestion.all + MultipleChoiceQuestion.all

  questions.each do |q|
    question_options = []

    3.times do
      question_option = q.question_options.create!(body: 'test')
      question_options << question_option
    end

    question_options.each do |qo|
      puts "QuestionOption created with id #{qo.id} for question type #{qo.question_optionable_type} with id #{qo.question_optionable_id}"
    end
  end
end

def create_basic_answers
  user = User.last
  questions = ShortTextQuestion.all + LongTextQuestion.all

  questions.each do |q|
    answer = q.answers.create!(user_id: user.id, body: 'test')
    puts "Answer created with id #{answer.id} for question type #{answer.answerable_type} with id #{answer.answerable_id}"
  end
end

def create_complex_answers
  user = User.last
  questions = SingleChoiceQuestion.all + MultipleChoiceQuestion.all

  questions.each do |q|
    answer = q.answers.create!(user_id: user.id)

    if q.type === 'SingleChoiceQuestion'
      question_option = q.question_options.sample
      answer_option = answer.answer_options.create!(user_id: user.id, question_option_id: question_option.id)
      puts "Answer #{answer.id} AnswerOption #{answer_option.id}"
    elsif q.type === 'MultipleChoiceQuestion'
      question_options = q.question_options.sample(2)

      question_options.each do |qo|
        answer_option = answer.answer_options.create!(user_id: user.id, question_option_id: qo.id)
        puts "Answer #{answer.id} AnswerOption #{answer_option.id}"
      end
    end

    # puts "Answer created with id #{answer.id} for question type #{answer.answerable_type} with id #{answer.answerable_id}"
  end
end

seed
