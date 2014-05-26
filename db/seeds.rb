# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Permission.first.nil?
  Permission.create(name: 'normal')
  Permission.create(name: 'admin')
end

if User.first.nil?
  user = User.create!(email: '512981271@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'Scott1743'

  user = User.create!(email: 'mqf9.18@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'mqf'

  user = User.create!(email: '514952991@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'Viking'

  user = User.create!(email: '675433507@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'hty'

  user = User.create!(email: '519421832@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'lc'

  user = User.create!(email: '542985058@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'jq'

  user = User.create!(email: '513105786@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'yy'

  user = User.create!(email: 'xiedongdong1025@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'xdd'

  user = User.create!(email: 'yilingccc@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'cyl'
end

if Project.first.nil?


end