require 'spec_helper'

describe 'teamspeak3' do
  context 'supported architecture' do
    describe "teamspeak3 class without any parameters on amd64" do
      let(:params) {{ }}
      let(:facts) {{
        :architecture => 'amd64',
      }}

      it { should compile.with_all_deps }

      it { should contain_class('teamspeak3::params') }
      it { should contain_class('teamspeak3::install').that_comes_before('teamspeak3::config') }
      it { should contain_class('teamspeak3::config') }
      it { should contain_class('teamspeak3::service').that_subscribes_to('teamspeak3::config') }
      it { should contain_class('teamspeak3') }

      it { should contain_file("/opt/teamspeak3-server_linux-#{:architecture}") }

      it { should contain_service('teamspeak3') }
      it { should contain_package('teamspeak3').with_ensure('present') }
    end

    describe "teamspeak3 class without any parameters on i386" do
      let(:params) {{ }}
      let(:facts) {{
        :architecture => 'i386',
      }}

      it { should compile.with_all_deps }

      it { should contain_class('teamspeak3::params') }

      it { should contain_class('teamspeak3::install').that_comes_before('teamspeak3::config') }
      it { should contain_class('teamspeak3::config') }
      it { should contain_class('teamspeak3::service').that_subscribes_to('teamspeak3::config') }
      it { should contain_class('teamspeak3') }

      it { should contain_file('/opt/teamspeak3-server_linux-x86') }

      it { should contain_service('teamspeak3') }
      it { should contain_package('teamspeak3').with_ensure('present') }
    end
  end

  context 'unsupported architecture' do
    describe 'teamspeak3 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('teamspeak3') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
