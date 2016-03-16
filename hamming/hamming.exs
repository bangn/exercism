defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance('', '') do 0 end

  def hamming_distance([], []) do 0 end

  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do nil end

  def hamming_distance(strand1, strand2) when is_number(strand1) do
    if (strand1 - strand2) == 0, do: 0, else: 1
  end

  def hamming_distance([h1|t1], [h2|t2]) do
    hamming_distance(h1, h2) + hamming_distance(t1, t2)
  end
end
