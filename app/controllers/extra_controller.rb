# encoding: utf-8
class ExtraController < ApplicationController

  layout 'welcome', except: :tips

  def index

  end

  def tips

  end

  def about
    duty_type = ['架构', 'UI设计与实现', 'Android','技术支持', '美术支持', '宣传', '运营', '运营支持']
    # - - - - - - 0 - - - - 1 - - - - - - 2 - - - - 3 - - - - - 4 - - - 5 - - - 6 - - - - 7
    @dev_team = []
    @ops_team = []
    @dev_team << { human: (User.find_by_email '512981271@qq.com'), duty: (duty_type[0].to_s + '、' + duty_type[1].to_s), page: 'http://www.baidu.com' }
    @dev_team << { human: (User.find_by_email '513105786@qq.com'), duty: duty_type[1].to_s }
    @dev_team << { human: (User.find_by_email '519421832@qq.com'), duty: duty_type[2].to_s }
    @dev_team << { human: (User.find_by_email 'mqf9.18@qq.com'), duty: duty_type[3].to_s }
    #@dev_team << { human: (User.find_by_email '542985058@qq.com'), duty: duty_type[3].to_s }
    #- - - - -
    @ops_team << { human: (User.find_by_email '514952991@qq.com'), duty: (duty_type[5].to_s + '、' + duty_type[6].to_s) }
    @ops_team << { human: (User.find_by_email '675433507@qq.com'), duty: (duty_type[5].to_s + '、' + duty_type[6].to_s) }
    @ops_team << { human: (User.find_by_email 'xiedongdong1025@qq.com'), duty: duty_type[7].to_s }
    @ops_team << { human: (User.find_by_email 'yilingccc@qq.com'), duty: duty_type[4].to_s }
  end

  def terms

  end
end
