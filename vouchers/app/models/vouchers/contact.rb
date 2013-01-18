module Vouchers
  class Contact < MailForm::Base
    attribute :name
    attribute :email
    attribute :message

    def headers
      {
        to: %("#{name}" <#{email}>),
        subject: "Imprima seu Voucher",
        # TODO get site name automatically
        from: "Forro com turista <noreply@forrocomturista.com.br"
      }
    end

  end
end
