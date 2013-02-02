describe Post do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:url).of_type(String) }
  it { should have_field(:id).of_type(Integer) }
  it { should have_field(:points).of_type(Integer) }

  it { should be_embedded_in(:stat) }
end
