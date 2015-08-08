require 'rails_helper'

RSpec.describe School, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  let(:s) {build(:school)}

  it "will match a title" do
  	#s = build(:school)
  	expect(s.title).to eq("Jovina")
  end

  it "will match number of pupils" do
  	#s = build(:school)
  	expect(s.number_of_pupils).to eq(110)
  end

  it "will have a classroom" do
  	c = build(:classroom)
  	expect(c.name).to be_a(String)
  end

end
