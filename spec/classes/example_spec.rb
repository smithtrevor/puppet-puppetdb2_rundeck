require 'spec_helper'

describe 'puppetdb2_rundeck' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "puppetdb2_rundeck class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('puppetdb2_rundeck::params') }
          it { is_expected.to contain_class('puppetdb2_rundeck::install').that_comes_before('puppetdb2_rundeck::config') }
          it { is_expected.to contain_class('puppetdb2_rundeck::config') }
          it { is_expected.to contain_class('puppetdb2_rundeck::service').that_subscribes_to('puppetdb2_rundeck::config') }

          it { is_expected.to contain_service('puppetdb2_rundeck') }
          it { is_expected.to contain_package('puppetdb2_rundeck').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'puppetdb2_rundeck class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('puppetdb2_rundeck') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
