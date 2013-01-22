module Admix::AlbumsHelper
  def form2_attributes
    %w(name description date published)
  end

  def album_form_attributes(form)
    form.input :name
    form.input :date
  end

end