namespace :dev do

  desc "Configura o ambiente de desenvolvimento"

  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando DB...") { puts %x(rails db:drop) }
      
      show_spinner("Criando DB...") { puts %x(rails db:create) }
      
      show_spinner("Migrando DB...") { puts %x(rails db:migrate) }
      
      show_spinner("Populando DB...") { puts %x(rails db:seed) }

    end
  end
  
  private 

  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ...")
    spinner.auto_spin 
    yield
    spinner.success("#{msg_end}")   
  end
    
end