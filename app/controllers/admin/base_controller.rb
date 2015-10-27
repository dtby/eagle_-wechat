class Admin::BaseController < ApplicationController
  # before_action :authenticate_admin!, :set_left_bar
  before_action :authenticate_user! 
  layout 'admin'
	
  # 侧边栏所有菜单
  def set_left_bar
  	@systems = System.includes(sub_systems: :patterns).all
  end
end
