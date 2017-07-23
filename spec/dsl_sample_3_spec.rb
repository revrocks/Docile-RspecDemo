require 'rspec'

describe 'Dsl - Classes and Objects' do

context 'Math Solver' do


  it 'spec 1 - sum of numbers' do

    solver = numbers(:+) do
      number1 1
      number2 2
    end
    expect(solver.result).to eq 3

  end

  it 'spec 2 -  multiply of numbers' do
    solver = numbers(:*) do
      number1 1
      number2 2
    end
    expect(solver.result).to eq 2
  end

  it 'spec3 - division of numbers' do
    solver = numbers(:/) do
      number1 20
      number2 2
    end
    expect(solver.result).to eq 10
  end

  it 'spec4 - modulo of numbers' do
    solver = numbers(:%) do
      number1 20
      number2 2
    end
    expect(solver.result).to eq 0
  end

  it 'spec5 - Subtraction of numbers' do
    solver = numbers(:-) do
      number1 20
      number2 2
    end
    expect(solver.result).to eq 18
  end

end
end