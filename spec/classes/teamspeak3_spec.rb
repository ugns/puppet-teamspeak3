require 'spec_helper'

describe 'teamspeak3' do
  context 'supported architecture' do
    describe 'staging class without any parameters' do
      let(:params) {{ }}
      let(:facts) {{
        :architecture => 'amd64',
        :kernel       => 'Linux',
        :osfamily     => 'Debian',
      }}

      it { should contain_class('staging::params') }
      it { should contain_class('staging') }

      it { should contain_file('/opt/staging') }
    end

    describe 'teamspeak3 class without any parameters on amd64' do
      let(:params) {{ }}
      let(:facts) {{
        :architecture => 'amd64',
        :kernel       => 'Linux',
        :osfamily     => 'Debian',
      }}

      it { should compile.with_all_deps }

      it { should contain_class('teamspeak3::params') }
      it { should contain_class('teamspeak3::install').that_comes_before('teamspeak3::config') }
      it { should contain_class('teamspeak3::config') }
      it { should contain_class('teamspeak3::service').that_subscribes_to('teamspeak3::config') }
      it { should contain_class('teamspeak3') }

      it { should contain_file('/opt/staging/teamspeak3') }
      it { should contain_staging__deploy("teamspeak3-server_linux-#{facts[:architecture]}-3.0.10.3.tar.gz") }
      it { should contain_staging__file("teamspeak3-server_linux-#{facts[:architecture]}-3.0.10.3.tar.gz") }
      it { should contain_staging__extract("teamspeak3-server_linux-#{facts[:architecture]}-3.0.10.3.tar.gz") }
      it { should contain_exec("/opt/staging/teamspeak3/teamspeak3-server_linux-#{facts[:architecture]}-3.0.10.3.tar.gz") }
      it { should contain_exec("extract teamspeak3-server_linux-#{facts[:architecture]}-3.0.10.3.tar.gz") }

      it { should contain_file('/etc/default/teamspeak3') }
      it { should contain_file('/etc/init.d/teamspeak3') }

      it { should contain_service('teamspeak3') }
    end

    describe 'teamspeak3 class without any parameters on i386' do
      let(:params) {{ }}
      let(:facts) {{
        :architecture => 'i386',
        :kernel       => 'Linux',
        :osfamily     => 'Debian',
      }}

      it { should compile.with_all_deps }

      it { should contain_class('teamspeak3::params') }

      it { should contain_class('teamspeak3::install').that_comes_before('teamspeak3::config') }
      it { should contain_class('teamspeak3::config') }
      it { should contain_class('teamspeak3::service').that_subscribes_to('teamspeak3::config') }
      it { should contain_class('teamspeak3') }

      it { should contain_file('/opt/staging/teamspeak3') }
      it { should contain_staging__deploy('teamspeak3-server_linux-x86-3.0.10.3.tar.gz') }
      it { should contain_staging__file('teamspeak3-server_linux-x86-3.0.10.3.tar.gz') }
      it { should contain_staging__extract('teamspeak3-server_linux-x86-3.0.10.3.tar.gz') }
      it { should contain_exec('/opt/staging/teamspeak3/teamspeak3-server_linux-x86-3.0.10.3.tar.gz') }
      it { should contain_exec('extract teamspeak3-server_linux-x86-3.0.10.3.tar.gz') }

      it { should contain_file('/etc/default/teamspeak3') }
      it { should contain_file('/etc/init.d/teamspeak3') }

      it { should contain_service('teamspeak3') }
    end
  end

  context 'unsupported architecture' do
    describe 'teamspeak3 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :architecture => 'sparc',
        :kernel       => 'sunos',
        :osfamily     => 'Solaris',
      }}

      it { expect { should contain_package('teamspeak3') }.to raise_error(Puppet::Error, /sunos not supported/) }
    end
  end
end
