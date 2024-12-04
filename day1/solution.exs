defmodule Solution do
  def main do
    get_input(IO.gets(""), [], [])
    |> then(
      fn [left, right] ->
        Enum.zip(Enum.sort(left), Enum.sort(right))
      end
    )
    |> Enum.reduce(0, fn {left, right}, accum -> abs(left - right) + accum end)
    |> IO.puts
  end

  defp get_input(:eof, l_list, r_list), do: [Enum.reverse(l_list), Enum.reverse(r_list)]
  defp get_input(row, l_list, r_list) do
    [left, right] =  String.split(row) |> Enum.map(&String.to_integer(&1))

    get_input(IO.gets(""), [left | l_list], [right | r_list])
  end
end

Solution.main()  def main do
                          get_input(IO.gets(""), [], [])
                                              |> then(
                                                     fn [left, right] ->
                                                     Enum.zip(Enum.sort(left), Enum.sort(right))
                          end
)
|> Enum.reduce(0, fn {left, right}, accum -> abs(left - right) + accum end)
                                                 |> IO.puts
                                                      end

                                                      defp get_input(:eof, l_list, r_list), do: [Enum.reverse(l_list), Enum.reverse(r_list)]
                                                                                                                                   defp get_input(row, l_list, r_list) do
                                                                                                                                                                       [left, right] =  String.split(row) |> Enum.map(&String.to_integer(&1))

                                                                                                                                                                       get_input(IO.gets(""), [left | l_list], [right | r_list])
                                                                                                                                                                       end
