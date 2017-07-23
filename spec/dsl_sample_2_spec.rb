require 'rspec'

describe 'Dsl - Open-Structs' do

context 'Dsl Struct Context' do


  it 'spec 1 - eggplant curry' do

    curry = custom_curry do
      onion true
      pepper true
      veggie 'eggplant'
      salt true
     curry_leaves false
    end
    expect(curry.veggie).to eq 'eggplant'

  end

  it 'spec 2 -  no defaulting -  tomatoe curry' do
    default_curry = custom_curry do
    end
    p default_curry.inspect
    expect(default_curry.veggie).to eq 'tomatoes'
  end
end
end