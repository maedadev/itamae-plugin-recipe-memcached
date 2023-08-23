memcached_version = ENV['MEMCACHED_VERSION'] || Itamae::Plugin::Recipe::Memcached::MEMCACHED_VERSION

package 'libevent-devel' do
  user 'root'
end

execute "download memcached-#{memcached_version}" do
  cwd '/tmp'
  command <<-EOF
    rm -f memcached-#{memcached_version}.tar.gz
    wget https://memcached.org/files/memcached-#{memcached_version}.tar.gz
  EOF
  not_if "test -e /opt/memcached/#{memcached_version}/INSTALLED || echo #{::File.read(::File.join(::File.dirname(__FILE__), "memcached-#{memcached_version}_sha256.txt")).strip} | sha256sum -c"
end

directory '/opt/memcached' do
  user 'root'
  owner 'root'
  group 'root'
  mode '755'
end

execute "install memcached-#{memcached_version}" do
  cwd '/tmp'
  command <<-EOF
    rm -Rf memcached-#{memcached_version}/
    tar zxf memcached-#{memcached_version}.tar.gz
    sudo rm -Rf /opt/memcached/#{memcached_version}
    cd memcached-#{memcached_version}/
    ./configure --prefix=/opt/memcached/#{memcached_version}
    make
    make test
    sudo make install
    sudo touch /opt/memcached/#{memcached_version}/INSTALLED
  EOF
  not_if "test -e /opt/memcached/#{memcached_version}/INSTALLED"
end

link '/opt/memcached/current' do
  to "/opt/memcached/#{memcached_version}"
  user 'root'
  force true
end
