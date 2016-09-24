class WalletoneMiddleware < Walletone::Middleware::Base
  def perform notify, env
    raise 'Wrong sign' unless notify.valid? W1_SECRET_KEY

    # TODO something with notify
    'Return some message for OK response'
  end
end
