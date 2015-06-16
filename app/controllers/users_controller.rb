class UsersController < ApplicationController
  def signup
  end

  def find_pw
  user_email=params[:email]
  user=User.find_by(email:params[:email])
  require 'gmail'
  gmail = Gmail.connect('oreumoreum@gmail.com','01300130')
  puts gmail.logged_in?
  gmail.deliver do
    to user_email
    subject "<THE BAB> 잃어버린 비밀번호입니다."
    text_part do
    if user.nil?
      body "E-mail을 잘못 적었습니다. 다시 적어 주세요."
    else
      body user.username+"계정의 비밀번호는 "+user.password+"입니다."
    end
   end
  end
end


  def find_id
  user_email=params[:email]
  user=User.find_by(email:params[:email])
  if user.nil?
    flash[:alert] = "비밀번호가 맞지 않습니다."
    redirect_to :back
  else
    flash[:alert] = "아이디는 "+user.username+"입니다."
    redirect_to :back
    end
  end

  def find
  end

  def signup_complete
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.phonenumber = params[:phonenumber]
    if params[:password] == params[:retype_password]
      user.password = params[:password]
      if user.save
       #flash[:alert] = "성공적으로 가입되었습니다."
	redirect_to "/"
      else
        flash[:alert] = user.errors.values.flatten.join(' ')
        redirect_to :back
      end
    else
      flash[:alert] = "비밀번호가 맞지 않습니다."
      redirect_to :back
    end
  end

  def login
  end

  def login_complete
    user = User.where(username: params[:username])[0]
    if user.nil?
      flash[:alert] = "아이디 또는 비밀번호를 잘못 입력하셨습니다."
      redirect_to :back
    elsif user.password != params[:password]
      flash[:alert] = "아이디 또는 비밀번호를 잘못 입력하셨습니다."
      redirect_to :back
    elsif params[:username] == 'manager'
      if user.password != params[:password]
      flash[:alert] = "아이디 또는 비밀번호를 잘못 입력하셨습니다."
      redirect_to :back
      else
      session[:user_id] = user.id
      redirect_to "/manager/man"
      end
    else
      session[:user_id] = user.id
     #flash[:alert] = "성공적으로 로그인하였습니다."
      redirect_to "/"
    end

  end

  def logout_complete
    reset_session
    #flash[:alert] = "성공적으로 로그아웃하였습니다."
    redirect_to "/"
  end
end
