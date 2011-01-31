require 'pathname'
$:.unshift Pathname(__FILE__).dirname.expand_path.to_s
require 'spec_helper.rb'

describe ConfigSet, 'storing values' do

  it 'should set values in a block' do
    config = ConfigSet.for :app do
      username 'test123'
      password 'abba-pass-93j'
    end

    config.username.should.equal 'test123'
  end

  it 'should set values in nested blocks' do
    config = ConfigSet.for :app do
      username 'test123'
      user { name { first 'Jim' } }
    end

    config.user.name.first.should.equal 'Jim'
  end

  it 'should load the same config set twice' do
    ConfigSet.for :app do
      something 'apple'
    end

    ConfigSet.for(:app).something.should.equal 'apple'
  end

  it 'should set a value through its setter' do
    config = ConfigSet.for :app do
      username 'jacob'
    end

    config.username = 'else'
    config.username.should.equal 'else'
  end

  it 'should set a nested value through its setter' do
    config = ConfigSet.for :app do
      user { bacon { name 'jacob' } }
    end

    config.user.bacon.name = 'else'
    config.user.bacon.name.should.equal 'else'
  end

  it 'should use values from parents' do
    config = ConfigSet.for('b'){
      host "codeforpeople.com"

      www {
        port 80
        url "http://#{ host }:#{ port }"
      }
    }
    
    config.host.should == 'codeforpeople.com'
    config.www.port.should == 80
    config.www.url.should == 'http://codeforpeople.com:80'
  end

  it 'should override values from parents' do
    config = ConfigSet.for('b'){
      host "codeforpeople.com"

      www {
        port 80
        friends {
          host "#{host}/people"
          more {
            beans "#{host}/more"
          }
        }
        url "http://#{ host }:#{ port }"
      }
    }
    
    config.www.friends.more.beans.should == 'codeforpeople.com/people/more'
    config.www.url.should == "http://codeforpeople.com:80"
  end

end
