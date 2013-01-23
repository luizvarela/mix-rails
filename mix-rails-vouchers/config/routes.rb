Rails.application.routes.draw do
  resources :vouchers

  post 'vouchers/:id' => 'vouchers#send_confirmation', as: :vouchers_send_confirmation
  match 'vouchers/:id/email-enviado' => 'vouchers#email_sent', as: :vouchers_email_sent
  match 'vouchers/:id/confirm/:user_id' => 'vouchers#confirmation', as: :vouchers_confirmation
  match 'vouchers/:id/imprimir/:user_id' => 'vouchers#print', as: :vouchers_print

  scope Admix::namespace_path, as: :admix, module: :admix do
    get 'vouchers/:id/users/print' => 'vouchers#print', as: :voucher_print
    get 'vouchers/:id/users' => 'vouchers#users', as: :voucher_users
    delete 'vouchers/:id/users/:user_id/delete' => 'vouchers#delete_user', as: :voucher_user_delete
    resources :vouchers
  end
end
