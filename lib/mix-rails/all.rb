%w(core admix auth settings writer albums videos).each do |extension|
  if extension == 'admix'
    require extension
  else
    require "mix-rails-#{extension}"
  end
end