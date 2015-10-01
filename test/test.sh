# if ! bundle exec vagrant box list | grep digital_ocean 1>/dev/null; then
#     bundle exec vagrant box add digital_ocean box/digital_ocean.box
# fi

cd test

VM=$1
if [ "$VM" = "all" ]; then
	VM="freebsd ubuntu centos"
fi

for V in $VM; do
	bundle exec vagrant up --provider=digital_ocean $V
	bundle exec vagrant up $V
	bundle exec vagrant provision $V
	bundle exec vagrant rebuild $V
	bundle exec vagrant halt $V
	bundle exec vagrant destroy $V
done
cd ..
