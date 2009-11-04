class Notify < ActionMailer::Base
  def notify_pedido (cliente,session_user)
    recipients "#{cliente.nome} <#{cliente.email}>"
    from "#{session_user.nome} <#{session_user.nome}>"
    subject "Pedido Feito com Sucesso!!!"
    body "cliente" => cliente
  end
end 