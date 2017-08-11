require 'rspec'

describe 'Dsl - Create Dynamic instance variables' do

context 'Mutable instance variables' do

  it 'spec 1  - generate numbers - ' do

    numbers = create_numbers do
      number1 10
      number2 20
      number10 199
      number2000 2000
    end

    expect(numbers.number1).to eq 10
    expect(numbers.number2).to eq 20
    expect(numbers.number10).to eq 199
    expect(numbers.number2000).to eq 2000

  end

 end
end