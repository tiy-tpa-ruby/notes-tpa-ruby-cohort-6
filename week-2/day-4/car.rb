class Car
  attr_accessor :brand, :model, :color

  def description
    "A #{model} from #{brand} that is color: #{color}"
  end
end
