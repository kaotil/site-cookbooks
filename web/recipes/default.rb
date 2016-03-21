packages = %w{git nginx php56 php56-fpm}

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

#package "nginx" do
#  action :install
#end

service "nginx" do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template "kaotil.com.conf" do
  path '/etc/nginx/conf.d/kaotil.com.conf'
  source 'kaotil.com.conf.erb'
  owner "root"
  group "root"
  mode 0644

  notifies :reload, "service[nginx]"
end

#%w{php-fpm nginx}.each do |service_name|
#    service service_name do
#      action [:start, :restart]
#    end
#end

template "www.conf" do
  path '/etc/php-fpm.d/www.conf'
  source 'www.conf.erb'
  owner "root"
  group "root"
  mode 0644

  notifies :restart, "service[php-fpm]"
end

service "php-fpm" do
  action [:start]
end

service "php-fpm-5.6" do
  action [:enable]
end
