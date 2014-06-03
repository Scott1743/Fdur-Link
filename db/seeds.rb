# encoding: utf-8
if Permission.first.nil?
  Permission.create(name: 'normal')
  Permission.create(name: 'admin')
end

if User.first.nil?
  user = User.create!(email: '512981271@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'Scott1743'

  user = User.create!(email: 'mqf9.18@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'Arthur'

  user = User.create!(email: '514952991@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'Viking'

  user = User.create!(email: '675433507@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'hty'

  user = User.create!(email: '519421832@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'lc'

  user = User.create!(email: '542985058@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'jq'

  user = User.create!(email: '513105786@qq.com',password: '123123',password_confirmation: '123123', permission_id: 2)
  user.create_user_detail name: 'Dino'

  user = User.create!(email: 'xiedongdong1025@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'xdd'

  user = User.create!(email: 'yilingccc@qq.com',password: '123123',password_confirmation: '123123', permission_id: 1)
  user.create_user_detail name: 'cyl'
end

if Project.first.nil?
   project = User.find(1).projects.create name: '电影待看表--小李', image: "http://image2.sina.com.cn/ent/x/2006-11-23/ac7833b449ac5759b25a64b4d7d94eb2.JPG",
                               description: '十一电影待看表，一天一部', is_public: true, state: 'open'

   project.milestones.create name: '《血钻》'
   project.milestones.create name: '《了不起的盖茨比》'
   project.milestones.create name: '《逍遥法外》'
   project.milestones.create name: '《泰坦尼克号》'
   project.milestones.create name: '《飞行家》'
   project.milestones.create name: '《胡佛传》'
   project.milestones.create name: '《禁闭岛》'

end