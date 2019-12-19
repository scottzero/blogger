describe Tag, type: :model do
    describe "relationships" do
      it {should have_many(:tagings)}
      it {should have_many(:articles).through(:taggings)}
    end
  end
