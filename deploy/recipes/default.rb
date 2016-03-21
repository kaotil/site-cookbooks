directory "/usr/share/www" do
  owner "nginx"
  group "nginx"
  action :create
end

git "/usr/share/www" do
  repository "https://github.com/kaotil/kaotil.com.git"
  revision "master"
  user "nginx"
  group "nginx"
  action :sync
end
