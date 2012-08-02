require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Breed < ClassyEnum::Base; end
class Breed::GoldenRetriever < Breed; end
class Breed::Snoop < Breed; end
class Breed::Husky < Breed; end

class Dog
  include Mongoid::Document
  field :breed, type: String
  classy_enum_attr :breed
end

class AllowBlankBreedDog
  include Mongoid::Document
  field :breed, type: String
  classy_enum_attr :breed, :allow_blank => true
end

class AllowNilBreedDog
  include Mongoid::Document
  field :breed, type: String
  classy_enum_attr :breed, :allow_nil => true
end

class OtherDog
  include Mongoid::Document
  field :other_breed, type: String
  classy_enum_attr :other_breed, :enum => 'Breed'
end

describe Dog do
  specify { Dog.new(:breed => nil).should_not be_valid }
  specify { Dog.new(:breed => '').should_not be_valid }

  context "with valid breed options" do
    subject { Dog.new(:breed => :golden_retriever) }
    it { should be_valid }
    its(:breed) { should be_a(Breed::GoldenRetriever) }
    its('breed.allow_blank') { should be_false }
  end

  context "with invalid breed options" do
    subject { Dog.new(:breed => :fake_breed) }
    it { should_not be_valid }
    it { should have(1).error_on(:breed) }
  end
end

describe "A ClassyEnum that allows blanks" do
  specify { AllowBlankBreedDog.new(:breed => nil).should be_valid }
  specify { AllowBlankBreedDog.new(:breed => '').should be_valid }

  context "with valid breed options" do
    subject { AllowBlankBreedDog.new(:breed => :golden_retriever) }
    it { should be_valid }
    its('breed.allow_blank') { should be_true }
  end

  context "with invalid breed options" do
    subject { AllowBlankBreedDog.new(:breed => :fake_breed) }
    it { should_not be_valid }
    it { should have(1).error_on(:breed) }
  end
end

describe "A ClassyEnum that allows nils" do
  specify { AllowNilBreedDog.new(:breed => nil).should be_valid }
  specify { AllowNilBreedDog.new(:breed => '').should_not be_valid }

  context "with valid breed options" do
    subject { AllowNilBreedDog.new(:breed => :golden_retriever) }
    it { should be_valid }
    its('breed.allow_blank') { should be_true }
  end

  context "with invalid breed options" do
    subject { AllowNilBreedDog.new(:breed => :fake_breed) }
    it { should_not be_valid }
    it { should have(1).error_on(:breed) }
  end
end

describe "A ClassyEnum that has a different field name than the enum" do
  subject { OtherDog.new(:other_breed => :snoop) }
  its(:other_breed) { should be_a(Breed::Snoop) }
end
