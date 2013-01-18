class VoucherMailer < AdmixMailer

  def send_confirmation_link(voucher_user)
    @voucher_user = voucher_user
    @url = vouchers_confirmation_url(voucher_user.voucher, voucher_user)

    mail(to: voucher_user.email, subject: t('vouchers.mailers.send_confirmation_link.subject'))
  end

end
