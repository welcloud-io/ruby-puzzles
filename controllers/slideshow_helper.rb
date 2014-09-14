#encoding:UTF-8

require_relative '../models/Poll'
require_relative '../models/RunTime'
require_relative '../models/Flip'

$SEPARATOR = "\n\#{SEP}#\n"

def question_id
  params[:splat][1]
end

def answer
  params[:splat][0]
end

def user_session_id
  session[:user_session_id]  
end

def slide_index
  params[:splat][0]
end

def user_name_of(user_session_id)
  return (user_session_id.split('_')[1..-1]).join('_') if user_session_id
end

def next_session_id
  $db.execute_sql("update sessions set last_session_id = last_session_id + 1")
  $db.execute_sql("select last_session_id from sessions").to_a[0]['last_session_id']
end

def current_slide_id
  slide_index = $db.execute_sql("select current_slide_id from teacher_current_slide").to_a[0]
  if (! slide_index) then
    $db.execute_sql("insert into teacher_current_slide values (0)")
  end
  $db.execute_sql("select current_slide_id from teacher_current_slide").to_a[0]['current_slide_id']
end

def update_current_slide_id(current_slide_id)
  if $db.execute_sql("select current_slide_id from teacher_current_slide").to_a[0] then
    $db.execute_sql("update teacher_current_slide set current_slide_id = '#{current_slide_id}'")
  else
    $db.execute_sql("insert into teacher_current_slide values ('#{ current_slide_id }')")
  end
end
