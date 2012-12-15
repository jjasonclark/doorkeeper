require 'spec_helper_integration'
require 'generators/mongoid/doorkeeper_client_generator'

if Doorkeeper.configuration.orm_name == :mongoid
  describe 'DoorkeeperClientGenerator', 'mongoid' do
    include GeneratorSpec::TestCase

    tests Mongoid::Generators::DoorkeeperClientGenerator
    destination ::File.expand_path("../../../tmp", __FILE__)

    before :each do
      prepare_destination
    end

    it "creates all files" do
      run_generator %w(batman)
      assert_file "app/models/batman.rb", /doorkeeper_client!/, /field :redirect_uri/, /attr_accessible (:[a-z_]+(, )?)+/
    end
  end
end
