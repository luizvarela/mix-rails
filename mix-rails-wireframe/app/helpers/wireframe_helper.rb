module WireframeHelper
  extend CoreHelper

  def frame_for_breadcrumbs
    content_for?(:breadcrumbs) ? content_for(:breadcrumbs) : breadcrumbs.render(class: 'breadcrumb')
  end

  def frame_for_footer
    content_for?(:footer) ? content_for(:footer) : "Footer"
  end

end