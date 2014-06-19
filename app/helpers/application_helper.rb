# -*- encoding : utf-8 -*-
module ApplicationHelper
  def error_messages_for(object)
    render 'layouts/error_messages_for', object: object
  end  
  
  def link_to_back
    link_to(fa_icon("angle-left")+' Назад',:back, class: 'btn btn-default')
  end
  
end
