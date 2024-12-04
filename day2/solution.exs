defmodule Solution do
  def main do
    get_input(IO.gets(""), [])
    |> solve(0)
    |> IO.inspect
  end

  defp solve([], count), do: count
  defp solve([head | tail], count) do
    if within_threshold(head, false, nil) == false do
      solve(tail, count)
    else
      solve(tail, count + 1)
    end
  end

  defp within_threshold(_list, true, _direction), do: false
  defp within_threshold([_head | _tail = []], should_short_circuit, _direction), do: !should_short_circuit
  defp within_threshold([head | tail], _short_circuit, direction) do
    tail_head = hd(tail)
    diff = abs(head - tail_head)

    result = if tail_head > head, do: "asc", else: "desc"

    should_short_circuit = if (direction == nil || direction == result) && (diff >= 1 && diff <= 3) do
      false
    else
      true
    end

    within_threshold(tail, should_short_circuit, result)
  end

  defp get_input(:eof, input_list), do: Enum.reverse(input_list)
  defp get_input(row, input_list) do
    input = String.split(row) |> Enum.map(&String.to_integer(&1))

    get_input(IO.gets(""), [input | input_list])
  end
end

Solution.main()
