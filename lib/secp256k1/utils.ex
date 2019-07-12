defmodule Secp256k1.Utils do
  @doc """
  calculate rem(a, b) as a%b in python
  """
  def calculate_rem(a, b) do
    a - b * floor_div(a, b)
  end

  def floor_div(a, b) when a >= 0 and b >= 0 do
    Kernel.div(a, b)
  end

  def floor_div(a, b) when a < 0 and b >= 0 do
    case Kernel.rem(a, b) do
      0 ->
        Kernel.div(a, b)

      _ ->
        Kernel.div(a, b) - 1
    end
  end

  def floor_div(a, b) do
    floor_div(-a, -b)
  end
end
