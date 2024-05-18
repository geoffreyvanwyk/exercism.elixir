defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(rational, rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(rational, rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(rational, rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(rational, rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, b1 * a2}
    |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
    |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(rational, integer) :: rational
  def pow_rational({a, b}, exponent) when exponent < 0 do
    {b ** Kernel.abs(exponent), a ** Kernel.abs(exponent)}
    |> reduce
  end

  @spec pow_rational(rational, integer) :: rational
  def pow_rational({a, b}, exponent) when exponent >= 0 do
    {a ** exponent, b ** exponent}
    |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(integer, rational) :: float
  def pow_real(x, {a, b}) do
    :math.pow(x ** a, 1 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(rational) :: rational
  def reduce({a, b}) when b < 0 do
    {-a, -b}
    |> reduce
  end

  @spec reduce(rational) :: rational
  def reduce({a, b}) when b > 0 do
    gcd = Integer.gcd(a, b)
    {a / gcd, b / gcd}
  end
end
