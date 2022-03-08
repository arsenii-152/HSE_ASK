def seed
  reset_db
  create_users
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users
  10.times do
   user = User.create!(name: "Arsenii", surname: "Bychin", group: "ADC_19")
   puts "User created with id #{user.id}, name #{user.name}, surname#{user.surname} from group #{user.group}"
 end
end



seed
