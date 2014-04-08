#encoding: utf-8
module UsersHelper
  def signup_error
	@signup_errors = Hash.new
	@signup_errors[:email]={}
	@signup_errors[:password]={}
	@signup_errors[:password_confirmation]={}
	@user.errors.full_messages.each do |e|
	  if e=="Email is invalid"
	    @signup_errors[:email][:beblank] = '该邮箱无效'
	  elsif e=="Email can't be blank"
	    @signup_errors[:email][:invalid] = '邮箱不能为空'
	  elsif e=="Email has already been taken"
	    @signup_errors[:email][:betaken] = '该邮箱已经被注册'	
	  elsif e == "Password can't be blank"
	    @signup_errors[:password][:beblank] ='密码不能为空'
	  elsif e == "Password is too short (minimum is 6 characters)"
	    @signup_errors[:password][:beshort] = '密码长度必须大于6'
	  elsif e == "Password confirmation doesn't match Password" or e== "Password confirmation can't be blank"
	    @signup_errors[:password_confirmation][:defferent] = '两次密码输入不一致'
	  end
    end
    @signup_errors
  end
end
