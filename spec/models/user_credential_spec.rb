require 'spec_helper'

describe UserCredential do
  describe "validation" do
    it { should validate_uniqueness_of(:credential_name).scoped_to(:user_id) }
    it { should validate_presence_of(:credential_name) }
    it { should validate_presence_of(:credential_value) }
    it { should validate_presence_of(:user_id) }
  end

  describe "mass assignment" do
    it { should allow_mass_assignment_of :credential_name }

    it { should allow_mass_assignment_of :credential_value }

    it { should_not allow_mass_assignment_of :user_id }
  end

  describe "cleaning fields" do
    it "should trim whitespace" do
      user_credential = user_credentials(:bob_aws_key)
      user_credential.credential_name = " new name "
      user_credential.credential_value = " new value "
      user_credential.save!
      user_credential.credential_name.should == "new name"
      user_credential.credential_value.should == "new value"
    end
  end
end
