module AdmixHelper
  
  include CoreHelper

  def app_title
    Setting.app_title
  end

  def input_label(model_name, input_name)
    I18n.t("#{model_name}.#{input_name}", scope: :"simple_form.labels", default: [:"defaults.#{input_name}"])
  end

end