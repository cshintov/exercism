defmodule RomanNumeralsTest do
  use ExUnit.Case

  @tag task_id: 1
  test "1" do
    assert RomanNumerals.numeral(1) == "I"
  end

  @tag task_id: 1
  test "2" do
    assert RomanNumerals.numeral(2) == "II"
  end

  @tag task_id: 1
  test "3" do
    assert RomanNumerals.numeral(3) == "III"
  end

  @tag task_id: 1
  test "4" do
    assert RomanNumerals.numeral(4) == "IV"
  end

  @tag task_id: 1
  test "5" do
    assert RomanNumerals.numeral(5) == "V"
  end

  @tag task_id: 1
  test "6" do
    assert RomanNumerals.numeral(6) == "VI"
  end

  @tag task_id: 1
  test "9" do
    assert RomanNumerals.numeral(9) == "IX"
  end

  @tag task_id: 2
  test "10" do
    assert RomanNumerals.numeral(10) == "X"
  end

  @tag task_id: 2
  test "27" do
    assert RomanNumerals.numeral(27) == "XXVII"
  end

  @tag task_id: 2
  test "48" do
    assert RomanNumerals.numeral(48) == "XLVIII"
  end

  @tag task_id: 2
  test "59" do
    assert RomanNumerals.numeral(59) == "LIX"
  end

  @tag task_id: 2
  test "93" do
    assert RomanNumerals.numeral(93) == "XCIII"
  end

  @tag task_id: 3
  test "141" do
    assert RomanNumerals.numeral(141) == "CXLI"
  end

  @tag task_id: 3
  test "163" do
    assert RomanNumerals.numeral(163) == "CLXIII"
  end

  @tag task_id: 3
  test "402" do
    assert RomanNumerals.numeral(402) == "CDII"
  end

  @tag task_id: 3
  test "575" do
    assert RomanNumerals.numeral(575) == "DLXXV"
  end

  @tag task_id: 3
  test "911" do
    assert RomanNumerals.numeral(911) == "CMXI"
  end

  @tag task_id: 4
  test "1024" do
    assert RomanNumerals.numeral(1024) == "MXXIV"
  end

  @tag task_id: 4
  test "3000" do
    assert RomanNumerals.numeral(3000) == "MMM"
  end

  @tag task_id: 5
  test "16" do
    assert RomanNumerals.numeral(16) == "XVI"
  end

  @tag task_id: 5
  test "66" do
    assert RomanNumerals.numeral(66) == "LXVI"
  end

  @tag task_id: 5
  test "166" do
    assert RomanNumerals.numeral(166) == "CLXVI"
  end

  @tag task_id: 5
  test "444" do
    assert RomanNumerals.numeral(444) == "CDXLIV"
  end

  @tag task_id: 5
  test "666" do
    assert RomanNumerals.numeral(666) == "DCLXVI"
  end

  @tag task_id: 5
  test "1666" do
    assert RomanNumerals.numeral(1666) == "MDCLXVI"
  end

  @tag task_id: 5
  test "3001" do
    assert RomanNumerals.numeral(3001) == "MMMI"
  end

  @tag task_id: 5
  test "3999" do
    assert RomanNumerals.numeral(3999) == "MMMCMXCIX"
  end
end
