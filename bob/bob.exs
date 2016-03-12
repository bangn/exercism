defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.strip(input) == "" -> "Fine. Be that way!"
      (String.upcase(input) == input) && contain_at_least_one_uppercase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp contain_at_least_one_uppercase(input) do
    String.match?(input, ~r/\p{Lu}/u)
  end
end
