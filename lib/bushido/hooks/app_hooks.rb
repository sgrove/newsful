class BushidoAppHooks < Bushido::EventObserver
  def app_claimed
    User.find(1).update_attributes(:email  => params['data']['email'],
      :ido_id => params['data']['ido_id'])
  end
end
