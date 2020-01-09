### SSH

A key terraform.pem foi gerada na AWS e copiada para o projeto

````
ssh -i key/terraform.pem ec2-user@xxx.xxx.xxx.xxx
````

### Instalar o Kafka CLI na EC2

````
sudo yum install git -y

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

asdf plugin-add java

sudo yum install jq -y

asdf install java adopt-openjdk-8u232-b09

asdf global java adopt-openjdk-8u232-b09

wget  http://ftp.unicamp.br/pub/apache/kafka/2.4.0/kafka_2.12-2.4.0.tgz

tar -zxvf kafka_2.12-2.4.0.tgz

echo -e '\nPATH=$PATH:$HOME/kafka_2.12-2.4.0/bin' >> ~/.bash_profile
echo -e '\nexport PATH' >> ~/.bash_profile
````
