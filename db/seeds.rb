def user_creation(role, editor)
  puts "User Created!"
  if editor
    puts "Email: #{role}#{editor}@test.com"
  else
    puts "Email: #{role}@test.com"
  end
  puts "Password: 'password'"
  puts "role: #{role}"
  if editor
    puts "200 cat related articles psoted for #{role}#{editor}"
  end
  puts ""
end

roles = ["user", "admin", "editor", "editor", "editor"]
editor_email = 0
roles.each do |role|
  if role == "editor"
    editor_email += 1
    u = User.create(
      email: "#{role}#{editor_email}@test.com",
      password: "password", 
      roles: role)
      user_creation(role, editor_email)
    else
      u = User.create(
        email: "#{role}@test.com",
        password: "password", 
        roles: role
        )
      user_creation(role, nil)
  end
  if u.roles[0] == :editor
    200.times do
      Article.create(
        title: Faker::Creature::Cat.name,
        content: Faker::Lorem.paragraph(sentence_count: rand(10..30)),
        category: Faker::Creature::Cat.breed,
        user_id: u.id
      )
    end
  end
end

