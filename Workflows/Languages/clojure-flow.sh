
# Install Adoption/Temurin18 for open JavaSDK
BIN_FILE="jdk-18.0.1+10"
TAR_FILE="OpenJDK18U-jdk_aarch64_linux_hotspot_18.0.1_10.tar.gz"
GH_RELEASE="https://github.com/adoptium/temurin18-binaries/releases/download/jdk-18.0.1%2B10/$TAR_FILE"

wget $GH_RELEASE
tar -xvf $TAR_FILE
sudo mv $BIN_FILE /opt/

echo 'export JAVA_HOME=/opt/$BIN_FILE
export PATH=$PATH:$JAVA_HOME/bin' >> $HOME/.bashrc

curl -O https://download.clojure.org/install/linux-install-1.11.1.1145.sh
chmod +x linux-install-1.11.1.1145.sh
sudo ./linux-install-1.11.1.1145.sh
# REFERENCES
# - https://clojure.org/guides/install_clojure

wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod +x lein
mv lein $HOME/.local/bin

curl -O https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install
chmod a+x install
sudo ./install
