pacakge="git"
if ! [ -x "$(command -v $pacakge)" ]; then
  echo "Info: Installing $pacakge." >&2
  sudo apt-get install $pacakge
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="curl"
if ! [ -x "$(command -v $pacakge)" ]; then
  echo "Info: Installing $pacakge." >&2
  sudo apt-get install $pacakge
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="dotfiles"
cd ~
if [ -d "dotfiles" ]; then
  echo "Info: $pacakge is already installed." >&2
else
  echo "Info: Installing $pacakge." >&2
  git clone https://github.com/mathiasbynens/dotfiles.git && cd dotfiles && set -- -f; source bootstrap.sh
fi

pacakge="nvm"
cd ~
if [ -d ".nvm" ]; then
 echo "Info: $pacakge is already installed." >&2
  else
    echo "Info: Installing $pacakge." >&2
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  echo 'export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion"' >> ~/.bash_profile
  source ~/.bash_profile  
fi

pacakge="node"
if ! [ -x "$(command -v $pacakge)" ]; then
  echo "Info: Installing $pacakge." >&2
  nvm install v10.16.0
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="code"
if ! [ -x "$(command -v $pacakge)" ]; then
  echo "Info: Installing $pacakge." >&2
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt-get install $pacakge
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="create-react-app"
if ! [ -x "$(command -v $pacakge)" ]; then
  echo "Info: Installing $pacakge." >&2
  npm install -g  $pacakge
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="react-native-cli"
if ! [ -x "$(command -v react-native)" ]; then
  echo "Info: Installing $pacakge." >&2
  npm install -g  $pacakge
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="mongodb-org"
pcommand="mongod"
if ! [ -x "$(command -v $pcommand)" ]; then
  echo "Info: Installing $pacakge." >&2
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  sudo apt-get install gnupg
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  sudo apt-get update
  sudo apt-get install -y $pacakge
  sudo service $pcommand start
  else
 echo "Info: $pacakge is already installed." >&2
fi

pacakge="redis-server"
pcommand="redis-server"
if ! [ -x "$(command -v $pcommand)" ]; then
  echo "Info: Installing $pacakge." >&2
  sudo apt-get update
  sudo apt-get install -y $pacakge
  sudo service $pcommand start
  else
 echo "Info: $pacakge is already installed." >&2
fi