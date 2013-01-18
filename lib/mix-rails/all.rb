MixRails::PROJECTS.each do |extension|
  if extension == 'admix'
    require extension
  else
    require "mix-rails-#{extension}"
  end
end