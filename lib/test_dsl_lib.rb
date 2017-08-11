module TestDslLib

  VeggieCurry = Struct.new(:onion, :curry_leaves, :salt, :pepper, :veggie, :toppings)

  class CurryMaker
    attr_accessor :onion, :curry_leaves, :salt, :pepper, :veggie, :toppings


    def onion(v=true)
      @onion = v
    end

    def salt(v=true)
      @salt = v
    end

    def pepper(v= true)
      @pepper=v
    end

    def curry_leaves(v= true)
      @curry_leaves = v
    end


    def veggie(v = 'tomatoes')
      @veggie = v
    end


    def make_curry
      VeggieCurry.new(@onion, @salt, @curry_leaves, @pepper, @veggie||self.veggie, @toppings)
    end

    def make_custom_curry
      cc = OpenStruct.new
      cc.onion = @onion
      cc.salt = @salt
      cc.veggie = @veggie || self.veggie
      cc.curry_leaves = @curry_leaves
      cc.toppings = @toppings
      cc

    end

    def respond_to_missing?(method_name, include_private = false)
      method_name[-1] == '?'
    end

    def method_missing(meth, *args, &block)
      puts "you are trying to call #{meth} with args #{args}"
    end
  end


  class MathSolver
    attr_accessor :operator, :numbers

    def initialize(operator, numbers =[])
      @operator = operator
      @numbers = numbers
      @math = OpenStruct.new
    end

    def number1(v = 0)
      @numbers << v
    end

    def number2(v = 0)
      @numbers << v
    end


    def result
      @math.result = @numbers.inject(&@operator)
      @math
    end
  end

  class Numbers

    private

    def respond_to_missing?(method_name, include_private = false)
      puts 'bla respond to miss'
      method_name.to_s.include?('number')
    end

    def method_missing(method_name, value)
      if(method_name.to_s.include?('number') && !self.instance_variables.include?(method_name))
        instance_var = method_name.to_s
        self.define_singleton_method(method_name) do |val = value|
          self.class.send(:attr_accessor, instance_var)
          self.instance_variable_set "@#{instance_var}", val
        end
      else
        super
      end
    end

  end

  def veggie_curry(&block)
    Docile.dsl_eval(CurryMaker.new, &block).make_curry
  end

  def custom_curry(&block)
    Docile.dsl_eval(CurryMaker.new, &block).make_custom_curry
  end

  def numbers(operator, &block)
    Docile.dsl_eval(MathSolver.new(operator), &block).result
  end

  def with_immutable_object(obj, &block)
    raise Exception, 'Object not frozen' if !obj.frozen?
    Docile.dsl_eval_immutable(obj, &block)
  end

  def with_mutable_object(obj, &block)
    Docile.dsl_eval(obj, &block)
  end

  def create_numbers(&block)
    Docile.dsl_eval(Numbers.new, &block)
  end
end