defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  @mapper %{G: 'C', C: 'G', T: 'A', A: 'U'}

  def to_rna(dna) do
    dna
    |> Enum.map( fn char -> replace(IO.chardata_to_string([char])) end )
    |> Enum.join
    |> to_char_list
  end

  defp replace(char) do
    {:ok, result} = Map.fetch(@mapper, String.to_atom(char))

    result
  end
end
