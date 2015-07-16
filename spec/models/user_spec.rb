require 'spec_helper'

describe User do

  it { should have_db_column(:email).of_type(:string) }
end