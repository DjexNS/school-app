require 'rails_helper'

RSpec.describe Pupil, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  	let(:p) {build(:pupil)}

    it "will have a valid name" do
  		#p = build(:pupil)
  		expect(p.name).to be_a(String)
  	end

  	it "will have a valid gender" do
  		#p = build(:pupil)
  		expect(p.gender).to end_with("ale")
  	end

  	it "will match pupil belonging to school" do
  		#p = build(:pupil)
  		expect(p).to belong_to(:school)
  	end
end
