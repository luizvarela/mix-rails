class RichtextInput < SimpleForm::Inputs::Base
  def input
    @builder.text_area(attribute_name, input_html_options.merge({class: 'niceditor'}))
  end
end