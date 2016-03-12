defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s|-]/)
    |> Enum.map_join( fn(word) -> pick_first_and_upcase_letter(word) end)
    |> String.upcase
  end

  defp pick_first_and_upcase_letter(string) do
    Regex.scan(~r/^\w|[A-Z]/, string)
    |> List.flatten
  end
end
