defmodule Solution do
  def main do
    IO.gets("")
    |> then(&Regex.scan(~r/mul\((\d+),(\d+)\)/, &1))
    |> Enum.map(fn [_head | tail] ->
      [left_operand, right_operand] = tail

      String.to_integer(left_operand) * String.to_integer(right_operand)
    end)
    |> Enum.sum
    |> IO.inspect
  end
end

Solution.main()
