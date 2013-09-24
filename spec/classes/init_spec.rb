require 'spec_helper'

describe 'teamspeak3', :type => :class do
  ts3_args = ['version', 'voice_port', 'voice_address', 'database', 'clear_database', 'dbconnections']

  context 'on a supported platform' do
    let(:facts) do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :operatingsystemrelease => '6.0',
        :kernel => 'Linux',
        :architecture => 'amd64',
      }
    end

    describe 'when using default values for teamspeak3 class' do
      it { should contain_class('teamspeak3') }
    end
  end

  context 'with invalid arguments on a supported platform' do
    let(:facts) do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :operatingsystemrelease => '6.0',
        :kernel => 'Linux',
        :architecture => 'amd64',
      }
    end

    ts3_args.each do |ts3_arg|
      let(:params) do
        {
          ts3_arg => 'invalid_value'
        }
      end
      it "when using a value that does not match the validation for #{ts3_arg} teamspeak3 class" do
        expect { should contain_class('teamspeak3') }.to raise_error(Puppet::Error)
      end
    end
  end
end
