defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[^\w-]|[_]/u, trim: true)
    |> count_words_in_list()
  end

  defp count_words_in_list(words_list) do
    Enum.reduce words_list, %{}, fn(word, acc) ->
      Map.update(acc, word, 1, &(&1 + 1))
    end
  end
end
