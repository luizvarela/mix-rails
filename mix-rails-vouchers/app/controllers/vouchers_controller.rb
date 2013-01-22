class VouchersController < ApplicationController

  def index
    @vouchers = Voucher.actives
  end

  def show
    @voucher = Voucher.find(params[:id])
    @user = VoucherUser.new
  end

  def confirmation
    @user = VoucherUser.new
  end

  def email_sent
    @voucher = Voucher.find(params[:id])
  end

  def send_confirmation
    @voucher = Voucher.find(params[:id])
    @user = VoucherUser.new(params[:voucher_user])

    if @user.already_required(@voucher)
      if @user.has_confirmed(@voucher)
        render :show, notice: 'Voce ja requisitou este voucher, por favor, aguardo outra promocao'
      else
        render :show, notice: 'Voce ja requisitou este voucher, por favor, acesse seu email para imprimi-lo'
      end
    else
      @voucher.users << @user
      if @voucher.save
        redirect_to :vouchers_email_sent
      else
        render :show, notice: 'Por favor, corrija os erros abaixo'
      end
    end
  end

  def confirmation
    begin
      voucher = Voucher.find(params[:id])
      user = VoucherUser.where(voucher_id: voucher.id).find(params[:user_id])
      user.confirmed = true
      user.confirmation_date = Time.now
      user.save

      redirect_to vouchers_print_path
    rescue
      render :confirmation_error
    end
  end

  def print
    begin
      @voucher = Voucher.find(params[:id])
      @user = VoucherUser.where(voucher_id: @voucher.id).find(params[:user_id])

      render layout: false
    rescue
      render :confirmation_error
    end
  end

  def confirmation_error
  end

end
