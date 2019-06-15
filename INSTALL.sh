### Metasploit Framework on Pi 0 W

  # Dependencies
   sudo apt-get update && sudo apt-get upgrade;
   sudo apt-get -y install screen build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev locate libreadline6-dev libcurl4-openssl-dev git-core libssl-dev libyaml-dev openssl autoconf libtool ncurses-dev bison curl wget postgresql postgresql-contrib libpq-dev libapr1 libaprutil1 libsvn1 libpcap-dev dirmngr gpg gnupg2;
  
  # RVM
   command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
   curl -L https://get.rvm.io | bash -s stable --ruby
   source /home/pi/.rvm/scripts/rvm
   rvm use --create --default 3.6.1@msf
  
  # Files
   mkdir ~/metasploit && git clone --recursive https://github.com:rapid7/metasploit-framework ~/metasploit/
  
  # Database
   sudo /etc/init.d/postgresql start
   sudo su postgres
   createuser msf -P
   createdb --owner=msf msfdb
   exit
  
  # Gem-Shit
   cd ~/metasploit
   gem install bundler rake Ascii85 concurrent-ruby i18n minitest thread_safe tzinfo activesupport
   bundle install
   yard config --gem-install-yri
  
  # Start
   ruby ./msfconsole -L
   db_connect msf:msf@localhost/msfdb
   db_status
