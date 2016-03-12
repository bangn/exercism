defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count([], nucleotide) do
    cond do
      Enum.member?(@nucleotides, nucleotide) -> 0
      true -> raise ArgumentError
    end
  end
  def count(strand, nucleotide) do
    cond do
      Enum.member?(@nucleotides, nucleotide) ->
        Enum.reduce(strand, 0, fn el, acc ->
          if Enum.member?(@nucleotides, el) do
            if el === nucleotide, do: acc + 1, else: acc
          else
            raise ArgumentError
          end
        end)
      true ->
        raise ArgumentError
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    Enum.reduce @nucleotides, %{}, fn nucleotide, acc ->
      Map.update(acc, nucleotide, count(strand, nucleotide), &(&1))
    end
  end
end
