require_relative '../Accesseur'
db = Accesseur.new



# LECTURE

puts '----- CURRENT SLIDE'
read = db.execute_sql('select * from teacher_current_slide')
p read.fields

read.values.each do |row|
  p row
end

puts '----- COMPTEUR'
read = db.execute_sql('select * from sessions')
p read.fields

read.values.each do |row|
  p row
end

puts '----- POLLS_SAVE'
read = db.execute_sql('select * from polls_save')
p read.fields

read.values.each do |row|
  p row
end

puts '----- POLLS (timestamp asc)'
read = db.execute_sql('select * from polls order by timestamp asc')
p read.fields

read.values.each do |row|
  p row
end

puts '----- RUN EVENTS SAVE (timestamp asc)'
read = db.execute_sql('select * from run_events_save order by timestamp asc')
p read.fields

read.values.each do |row|
  p row
end

puts '----- RUN EVENTS (timestamp asc)'
read = db.execute_sql('select * from run_events order by timestamp asc')
p read.fields

read.values.each do |row|
  p row
end

puts '----- FEATURE FLIP'
read = db.execute_sql('select * from flip_values')
p read.fields

read.values.each do |row|
  p row
end
