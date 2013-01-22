class Admix::VouchersController < Admix::InheritedController

  before_filter :voucher, only: [:print, :users, :delete]

  def print
    @users = @voucher.users.where(confirmed: true).order_by(name: 1)
    render layout: false
  end

  def users
    @users = @voucher.users.order_by(confirmed: -1, name: 1)
  end

  def delete_user
    @voucher.users.find(params[:user_id]).delete
    redirect_to admix_voucher_users_url
  end

  private
  def voucher
    @voucher = Voucher.find(params[:id])
  end

end
