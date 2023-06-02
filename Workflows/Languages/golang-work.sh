sudo apt install golang\ngo install golang.org/x/tools/gopls@latest
go install github.com/traefik/yaegi/cmd/yaegi@latst
curl -sfL https://raw.githubusercontent.com/traefik/yaegi/master/install.sh | bash -s -- -b $GOPATH/bin v0.9.0
