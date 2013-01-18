%w(core admix auth settings writer albums).each do |extension|
  if extension == 'admix'
    require extension
  else
    require "mix-rails-#{extension}"
  end
end