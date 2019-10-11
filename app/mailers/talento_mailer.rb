class TalentoMailer < ApplicationMailer
  default :from => ENV["MAIL_USERNAME"]

  def confirmacao_politica_privacidade
    @talento = params[:talento]

    mail(:to => "#{talento.name_completo} <#{talento.email}>", :subject => "Confirmação da Política de Privacidade do Banco de Talentos")
  end
end
