# README

# Nome

Banco de Talentos: Web App para recrutamento de (ex-)militares temporários por empresas.

# Descrição

O sistema foi concebido pela 29ª CSM, como uma forma de criar uma plataforma para conectar organizações militares do Exército com empresas, de maneira que as primeiras disponibilizem perfis profissionais de militares temporários que gostariam de recomendar, e as últimas possam selecionar e contratar esses militares.

Foi observado que diversos tipos de empresas gostam de contratar ex-militares que possuam recomendação de suas OMs. A plataforma é portanto uma evolução da antiga "Carta de Recomendação", que existe no Exército, de forma a colaborar com papel social do Exército e premiar os bons serviços prestados pelos militares temporários durante os anos na Força.

É uma forma de colaborar com esses militares que ficam de 1 à 8 anos no serviço militar em sua recolocação no mercado de trabalho. A intenção é que possa ser implantado e administrado pelas Regiões Militares do Exército em qualquer parte do país.

As funcionalidades básicas do aplicativo são:
* Cadastramento de perfis profissionais, por parte das organizações militares.
* Busca por múltiplos critérios por parte dos recrutadores de empresas.
* Criação de processos de recrutamento por parte dos recrutadores.

Os militares donos dos perfis profissionais, **não possuem acesso à ferramenta**. Somente os responsáveis pelo pessoal das OMs (S1), Cmt/Ch/Dir de OMs, recrutadores de empresas interessadas e os administradores do sistema, militares encarregados do "Serviço Militar" nas diversas Regiões Militares do Exército.

# Implantação

## Requisitos de Hardware

Sugere-se máquina virtual com:
*  2 cores de processamento,
*  4 GB de RAM,
*  200 GB de armazenamento.

## Requisitos de Software

O web app foi testado no sistema operacional Ubuntu Server 16.04 LTS.

O web app foi desenvolvido em Ruby on Rails. A versão do Ruby é a 2.5.1.

## Tutorial de Instalação:

#### Primeiro deve-se instalar o Node.js e Yarn:

#### Dependências:

```sh
$ sudo apt-get update
$ sudo apt-get install apache2 curl git libmysqlclient-dev mysql-server nodejs
```

Em seguida precisamos instalar o Ruby. A questão é instalar a mesma versão que foi empregada no desenvolvimento do app. No presente momento em que este tutorial foi feito, o comando "apt-get install ruby" já baixava o binário mais recente do que o que precisamos (2.5.1). Dessa forma sugere-se o uso de um pacote chamado "RVM" (Ruby Version Manager), de forma que com ele possamos baixar o binário que queremos (2.5.1).

#### A instalação do Ruby será feita nesse tutorial utilizando o RVM seguindo os comandos:

https://github.com/rvm/ubuntu_rvm

```sh
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository -y ppa:rael-gc/rvm
$ sudo apt-get update
$ sudo apt-get install rvm
$ sudo rvm requirements --autolibs=enable
$ sudo rvm install ruby-2.5.1
$ sudo rvm --default use ruby-2.5.1
$ reboot
```
Caso as informações disponíveis neste tutorial para a instalação do Ruby versão 2.5.1 via RVM não sejam suficientes, sugere-se seguir o seguinte tutorial:

[https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html
](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html)

#### Confirme que a versão do Ruby que você instalou é realmente a 2.5.1

```sh
$ ruby -v
```

#### Após isso, precisamos clonar o GSTI de seu repositório web oficial no diretório escolhido para instalar o app:

```sh
$ git clone https://gitlab.com/brunocampana/banco_talentos.git
```

A partir daqui execute todos os comandos a partir do diretório raiz "banco_talentos".

#### Após isso o Bundler e o Rails devem ser instalados

```sh
$ gem install nokogiri
$ gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

#### Confirme se foram instaladas as versões que precisamos do Rails e Bundler:

```sh
$ rails -v
$ bundler -v
```

O Rails deverá ser 5.2.3 e o Bundler 1.17.1.

#### Acesse o diretório raiz do projeto e utilize o Bundle para instalar todas as gemas (pacotes dependências do nosso web app):

```sh
$ bundle install
```

#### Configurando o ambiente:

Vá até o diretório raiz do seu web app e crie um arquivo chamado ".env". Nesse arquivo encontrar-se-á a configuração do seu ambiente específico. Copie o texto abaixo e cole em seu arquivo:

```sh
MAIL_USERNAME = preencha_com_o_email_que_enviará_emails_automaticos_para_usuarios_e_donos_de_perfil@algumarm.eb.mil.br
MAIL_PASSWORD = senha_do_email_de_cima
SMTP_URL = URL_do_servidor_de_email (exemplo: smtp.gmail.com)
MAIL_PORT = 587 (substituir pela porta correta)
MAIL_DOMAIN = example.com
MAILER_URL = talentos.12rm.eb.mil.br (daonde o email será enviado)

DB_BANCO_TALENTOS = depotproduction (coloque aqui o nome do DB que você criará no MySQL e depois remova esse parênteses)
DB_USERNAME = deploy (coloque aqui o nome do usuário que você criará no MySQL e depois remova esse parênteses)
DB_PASSWORD = deploy (coloque aqui o nome do password do DB que você criará no MySQL e depois remova esse parênteses)

NOME_ORG_GER_TALENTOS = Banco de Talentos da 12ª Região Militar

AVISO_OM = Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ornare, enim a mollis ultricies, orci massa tempor lectus, vitae pulvinar est ligula quis libero. Praesent fermentum est in massa vulputate, volutpat suscipit dui egestas. Aliquam viverra odio eget purus sodales vulputate. Cras eu lorem eu erat vulputate pellentesque. Nam pharetra cursus dui a maximus. Sed aliquam orci vitae magna volutpat, efficitur vestibulum orci sodales. In sed massa orci. Vestibulum sed hendrerit nibh, ut ornare lacus. Phasellus interdum consequat mauris, aliquet vestibulum elit elementum nec.

AVISO_RECRUTADOR = Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ornare, enim a mollis ultricies, orci massa tempor lectus, vitae pulvinar est ligula quis libero. Praesent fermentum est in massa vulputate, volutpat suscipit dui egestas. Aliquam viverra odio eget purus sodales vulputate. Cras eu lorem eu erat vulputate pellentesque. Nam pharetra cursus dui a maximus. Sed aliquam orci vitae magna volutpat, efficitur vestibulum orci sodales. In sed massa orci. Vestibulum sed hendrerit nibh, ut ornare lacus. Phasellus interdum consequat mauris, aliquet vestibulum elit elementum nec.

QTD_MIL_CONTRATADOS = 0

```
#### Prepare a base de dados, entrando no diretório raiz do web app e usando os seguintes comandos:

Use o MySQL para criar uma database nova, com o mesmo nome e configuração da escrita no arquivo ".env" do passo anterior.
Em seguida vamos criar as tabelas dessa nova database com os comandos abaixo:

```sh
rake db:create:all
rake db:migrate
```

Caso queira popular já com as cidades, usuários e outros elementos que já sabe que vai com certeza precisar, modifique o arquivo "seed.rb" de acordo com suas necessidades, usando como exemplo o próprio arquivo. O arquivo "seed" irá popular seu banco de dados de acordo com sua necessidade. É também no arquivo de seed.rb que são criados os primeiros uruários de acesso ao sistema. O usuário padrão criado tem login "admin@example.com" e senha "password".

```sh
rake db:seed
```

#### Configurando o servidor:

Visando dar robustez ao web app, recomenda-se usar a ferramenta "Nginx" como servidor web e proxy reverso e a ferramenta "Passenger" como servidor de aplicativos.

Seguem abaixo dois links que explicam detalhadamente como implantar em no ambiente de produção todos os passos de um aplicativo Ruby on Rails:

[https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/xenial/deploy_app.html
](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/xenial/deploy_app.html)

[https://gorails.com/deploy/ubuntu/16.04
](https://gorails.com/deploy/ubuntu/16.04)

Recomenda-se o uso dos dois tutoriais acima combinados. Caso não sejam satisfatórios, recomenda-se buscar no Google:

"Como implantar em ambiente de produção um rails app usando nginx + passenger".

Uma vez configurados o passenger e o nginx, você já estará com o web app executando na internet (lembrando que seu servidor deverá estar na DMZ de sua LAN).

Um último passo é programar cron jobs para a inativação de usuários antigos que os quais eventualmente as empresas não informem os administradores do sistema que deverão ser desativados:

```sh
# Recomenda-se a criação de um arquivo de texto vazio para acompanhar os eventuais erros na criação do cron job:
$ nano crontab_errors.txt

$ crontab -e

#insira o cron job abaixo na crontab substituindo pelos caminhos corretos:


* * * * * PATH=$PATH:/usr/local/bin && /bin/bash -l -c 'cd /CAMINHO/COMPLETO/ONDE/VOCE/CLONOU/O/banco_talentos && /CAMINHO/COMPLETO/ONDE/ESTA/INSTALADO/O/PACOTE/bundle exec rails runner -e production 'AdminUser.where(tipo: 3).where(status: 1).where('updated_at < ?', 1.year.ago).update_all(status: 0)' >> /ONDE/VOCE/CRIOU/O/ARQUIVO/DE/TEXTO/crontab_errors.txt 2>&1
```

O cronjob acima deverá desativar recrutadores de empresas após um ano da última atualização do seu perfil, independente de estarem ou não trabalhando ainda na empresa (caso ainda estejam, deverão solicitar ao administrador do sistema para que reative manualmente seu perfil permitindo novamente seu acesso).

# Uso

O administrador do sistema, normalmente uma equipe relacionada com a mobilização e serviço militar, (Circunscrições de Serviço Militar), realizará o cadastro dos S1 e Ch/Cmt/Dir de cada OM de sua região, e das empresas que possuírem parceria com a respectiva região militar.

Os S1 serão os militares cadastradores de suas OMs, e inserirão os perfis profissionais dos militares temporários que quiserem fazer parte do programa de recolocação no mercado de trabalho.

Uma vez criado um perfil profissional de um militar pelo S1, este **ainda não encontrar-se-á visível à empresas recrutadoras**. Após a criação de seu perfil, o próprio militar receberá via email as políticas de privacidade e compartilhamento de seus dados pessoais e deverá informar, mediante clique em link de email, que tem interesse em fazer parte da plataforma e concorda com o compartilhamento de seu perfil no Banco de Talentos da Região Militar. Caso não seja possível o "ok" das políticas de privacidade via email, a mesma poderá ser feita mediante upload de cópia digital das políticas de privacidade assinadas de próprio punho pelo militar no sistema.

Somente aí o Ch/Cmt/Dir da OM autorizará que o perfil do militar seja disponibilizado para empresas interessadas em recrutar ex-militares, e informará ainda se o militar é ou não "recomendado pela OM", emitindo então um "selo de qualidade da OM", aos moldes da antiga "Carta de Recomendação". Tal prática viabiliza que todos os militares temporários tenham oportunidade de participar da plataforma, ainda que não possuam boa reputação no Exército, e permitirá ainda que as OMs informem se **recomendam ou não** aquele militar, garantindo que o Exército recomende apenas os militares que julgar merecedores.

As empresas recrutadoras poderão finalmente visualizar todos os perfis disponibilizados e realizar as mais diveras buscas usando as múltiplas formas de filtragem disponíveis na plataforma. Poderão também criar processos de recrutamento, onde poderão organizar seus próprios processos seletivos.

Por fim, sempre que contratarem alguém, as empresas deverão informar aos administradores do sistema, de forma que aquele perfil profissional seja removido da base de dados (evitando a existência de um volume enorme de perfis antigos na plataforma).

# Suporte

Caso tenha problemas e dificuldades com alguma funcionalidade, tratar com brunoramoscampana@gmail.com ou crie uma "issue" no GitLab.

# Futuro

Vislumbra-se principalmente as seguintes funcionalidades no futuro:
- Inclusão de "Bootstrap" no front-end do web app, melhorando a estética do web app e a experiência do usuário.

# Contribuição

Caso integrantes do EB, em especial desenvolvedores de softwares lotados nos Comandos das Regiões Militares queiram tornar-se contribuidores oficiais deste software open source, favor entrar em contato via email em brunoramoscampana@gmail.com ou em meu linkedin: [https://www.linkedin.com/in/engbrunocampana/](https://www.linkedin.com/in/engbrunocampana/) .

# Autor e Reconhecimentos

Esse software open source foi desenvolvido por Bruno Campana, engenheiro militar de computação do Exército, entre agosto e dezembro de 2019, quando o mesmo era capitão e servia no 4º CTA, Manaus. Maiores informações do desenvolvedor podem ser obtidas em seu website pessoal [https://brunocampana.engineer/](https://brunocampana.engineer/).

Colaboraram com o desenvolvimento desta ferramenta os tenentes do 5º ano do IME Moore, Flávio Rodrigues e Oliveira, por ocasião de sua Operação Ricardo Franco em 2019.

# Licença

Open Source, conforme licença MIT no projeto.

# Status do Projeto

O projeto segue sendo mantido pelo desenvolvedor.
