service 'memcached' do
  user 'root'
  action [:disable, :stop]
end
