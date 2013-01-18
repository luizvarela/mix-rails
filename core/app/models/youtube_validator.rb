class YoutubeValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /^http:\/\/(?:www\.)?youtube.com\/watch\?(?=[^?]*v=\w+)(?:[^\s?]+)?$/i
      record.errors[attribute] << (options[:message] or I18n.t("errors.invalid_url"))
    end
  end

end
