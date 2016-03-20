package "nginx" do
  action :install
end

service "nginx" do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

# ./site_cookbooks/templates/default/nginx.conf.erbを元にして
# nginxの設定ファイルを決まったところに置くよという指示
# Chefの規約にのおかげで置き場所のパスやテンプレートファイルは省略できている
template "kaotil.com.conf" do
  path '/etc/nginx/conf.d/kaotil.com.conf'
  source 'kaotil.com.conf.erb'
  owner "root"
  group "root"
  mode 0644

  notifies :reload, "service[nginx]"
end
