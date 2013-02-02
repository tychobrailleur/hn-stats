describe Stat do
  it { should have_field(:average).of_type(Float) }
  it { should have_field(:median).of_type(Float) }
  it { should have_field(:mode).of_type(Float) }
  
  it { should be_timestamped_document }

  it { should embed_many(:posts) }
end

