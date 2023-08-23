service 'memcached' do
  user 'root'
  action [:enable, :start]
end
