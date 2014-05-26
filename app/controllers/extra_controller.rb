class ExtraController < ApplicationController

  layout 'welcome', except: :tips

  def index

  end

  def tips

  end

  def about
    @yzt = User.find_by_email '512981271@qq.com'
    @dy = User.find_by_email '514952991@qq.com'
  end

  def terms

  end
end
