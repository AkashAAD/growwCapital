['user', 'admin', 'super_admin'].each do |role|
  Role.create(name: role)
end
User.create(role_id: 2, email: "admin@gmail.com", password: "123456", password_confirmation: "123456")
