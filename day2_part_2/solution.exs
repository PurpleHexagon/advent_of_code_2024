defmodule Solution do
  def main do
    IO.gets("")
    |> get_input([])
    |> solve(0)
    |> IO.inspect(label: "Result")
  end

  defp solve([], count), do: count
  defp solve([head | tail], count) do
    if within_threshold(head, nil) or within_threshold_with_dampening(head) do
      solve(tail, count + 1)
    else
      solve(tail, count)
    end
  end

  defp within_threshold_with_dampening(report) do
    Enum.any?(0..(length(report) - 1), fn i ->
      within_threshold(List.delete_at(report, i), nil)
    end)
  end

  defp within_threshold([], _direction), do: true
  defp within_threshold([_], _direction), do: true
  defp within_threshold([head, next | tail], direction) do
    diff = abs(head - next)
    new_direction = if next > head, do: :asc, else: :desc

    cond do
      diff < 1 or diff > 3 or diff == 0 ->
        false
      (direction != nil and direction != new_direction) ->
        false
      true ->
        within_threshold([next | tail], new_direction)
    end
  end

  # Collects input until EOF, then returns a reversed list of parsed integers
  defp get_input(:eof, input_list), do: Enum.reverse(input_list)
  defp get_input(row, input_list) do
    input =
      row
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    get_input(IO.gets(""), [input | input_list])
  end
end

Solution.main()