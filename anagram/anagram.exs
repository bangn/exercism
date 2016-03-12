defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    for candidate <- candidates, anagram_of?(base, candidate), do: candidate
  end

  defp anagram_of?(base, candidate) do
    base = String.downcase base
    candidate = String.downcase candidate

    cond do
      base === candidate -> false
      true -> Enum.sort(String.to_char_list(base)) === Enum.sort(String.to_char_list(candidate))
    end
  end
end
