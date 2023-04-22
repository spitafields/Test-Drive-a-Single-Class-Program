class Gratitudes
  def initialize
    @gratitudes = []
  end

  def add(gratitudes)
    @gratitudes << gratitudes
  end

  def format
    prefix = "Be caruful for: "
    formatted_gratitudes = @gratitudes.join(", ")
    return prefix + formatted_gratitudes
  end
end
