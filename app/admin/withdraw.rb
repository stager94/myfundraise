ActiveAdmin.register Withdraw do

  filter :aasm_state, as: :select
  filter :campaign

  member_action :pay, method: :post do
    Withdraw.find(params[:id]).pay!
    redirect_to :back
  end

  member_action :cancel, method: :post do
    Withdraw.find(params[:id]).fail!
    redirect_to :back
  end

  action_item only: :show do
    link_to 'Mark Payed', pay_admin_withdraw_path(resource), method: :post
  end

  action_item only: :show do
    link_to 'Mark Failed', cancel_admin_withdraw_path(resource), method: :post
  end

end
