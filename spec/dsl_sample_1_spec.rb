require 'rspec'

describe 'Dsl - Structs' do

context 'Dsl Struct Context' do

  before(:all) do
    @default_curry = veggie_curry do
    end
  end

  it 'spec 1  -  default tomatoe curry' do

    expect(@default_curry.veggie).to eq 'tomatoes'
  end

  it 'spec 2 - eggplant curry' do

    curry = veggie_curry do
      onion true
      pepper true
      veggie 'eggplant'
      salt true
     curry_leaves false
    end

    puts curry.inspect

    expect(curry.veggie).to eq 'eggplant'

  end

  it 'change default curry to okra curry' do
    @default_curry.veggie = 'okra'
    expect(@default_curry.veggie).to eq 'okra'
  end


end
end