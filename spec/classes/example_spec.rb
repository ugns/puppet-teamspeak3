require 'spec_helper'

describe 'teamspeak3' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "teamspeak3 class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('teamspeak3::params') }
        it { should contain_class('teamspeak3::install').that_comes_before('teamspeak3::config') }
        it { should contain_class('teamspeak3::config') }
        it { should contain_class('teamspeak3::service').that_subscribes_to('teamspeak3::config') }

        it { should contain_service('teamspeak3') }
        it { should contain_package('teamspeak3').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'teamspeak3 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('teamspeak3') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
