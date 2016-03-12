defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([head|tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(list) do
    handle(list, [], fn(item, reversed) -> [item|reversed] end)
  end

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []
  def map(l, f) do
    for el <- l, do: f.(el)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []
  def filter(l, f) do
    for el <- l, f.(el), do: el
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], list), do: list
  def append(list, []), do: list
  def append(a, b) do
    a
    |> reverse
    |> handle(b, fn(item, list) -> [item|list] end)
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head|tail]) do
    append(head, concat(tail))
  end

  # This function is a copy of following code
  # http://exercism.io/submissions/bdd66424ce964056b6cd5129f44e4e1f
  @spec handle([], any, (any -> any)) :: any
  defp handle([], acc, _func) do
    acc
  end

  @spec handle(list, any, (any -> any)) :: any
  defp handle([head | tail], acc, func) do
    handle(tail, func.(head, acc), func)
  end
end
