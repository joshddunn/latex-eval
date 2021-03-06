require 'minitest/autorun'
require_relative './../lib/latex_eval.rb'

class TestLatex < Minitest::Test
  def test_that_latex_parser_parses_fractions
    latex = '\frac{1}{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((1)/(2))' 
  end

  def test_that_latex_parser_parses_fractions_recursively
    latex = '\frac{\frac{3}{4}}{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((((3)/(4)))/(2))' 
  end

  def test_that_latex_parser_parses_dfractions
    latex = '\dfrac{1}{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((1)/(2))' 
  end

  def test_that_latex_parser_parses_dfractions_recursively
    latex = '\dfrac{\dfrac{3}{4}}{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((((3)/(4)))/(2))' 
  end

  def test_that_latex_parser_parses_cdot
    latex = '1\cdot2'
    assert_equal LatexEval::Latex.new(latex).equation, '1*2' 
  end

  def test_that_latex_parser_parses_times
    latex = '1\times2'
    assert_equal LatexEval::Latex.new(latex).equation, '1*2' 
  end

  def test_that_latex_parser_parses_powers
    latex = '1^{23}'
    assert_equal LatexEval::Latex.new(latex).equation, '1^(23)' 
  end

  def test_that_latex_parser_parses_variable_names
    latex = '\xi'
    assert_equal LatexEval::Latex.new(latex).equation, 'xi' 
  end

  def test_that_latex_parser_adds_missing_multiplication_before_variable
    latex = '2\xi'
    assert_equal LatexEval::Latex.new(latex).equation, '2*xi' 
  end

  def test_that_latex_parser_adds_missing_multiplication_after_variable
    latex = '\xi2'
    assert_equal LatexEval::Latex.new(latex).equation, 'xi*2' 
  end

  def test_that_latex_parser_adds_missing_multiplication_between_variable
    latex = '\alpha\beta'
    assert_equal LatexEval::Latex.new(latex).equation, 'alpha*beta' 
  end

  def test_that_latex_parser_adds_missing_multiplication_between_brackets
    latex = '(1)(2)'
    assert_equal LatexEval::Latex.new(latex).equation, '(1)*(2)' 
  end

  def test_that_latex_parser_parses_nth_root
    latex = '\sqrt[3]{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((2)^(1/(3)))' 
  end

  def test_that_latex_parser_parses_sqrt
    latex = '\sqrt{2}'
    assert_equal LatexEval::Latex.new(latex).equation, '((2)^(1/2))' 
  end

  def test_works_with_typical_variables
    latex = '\xi x'
    assert_equal LatexEval::Latex.new(latex).equation, 'xi*x' 
  end

  def test_works_with_typical_variable
    latex = '2x'
    assert_equal LatexEval::Latex.new(latex).equation, '2*x' 
  end

  def test_works_with_typical_variable_spaces
    latex = '2 x'
    assert_equal LatexEval::Latex.new(latex).equation, '2*x' 
  end

  def test_works_with_typical_variable_multiple_spaces
    latex = '2     x'
    assert_equal LatexEval::Latex.new(latex).equation, '2*x' 
  end

  def test_works_with_left_and_right
    latex = '\left(x + 2\right)'
    assert_equal LatexEval::Latex.new(latex).equation, '(x+2)' 
  end

  def test_works_with_abs
    latex = '2 % 3'
    assert_equal LatexEval::Latex.new(latex).equation, '2%3' 
  end

  def test_works_with_abs_and_variables
    latex = 'x % y'
    assert_equal LatexEval::Latex.new(latex).equation, 'x%y' 
  end

  def test_works_with_variable_spaces
    latex = 'x     y'
    assert_equal LatexEval::Latex.new(latex).equation, 'x*y' 
  end

  def test_works_with_latex_variables
    latex = '\xix'
    assert_equal LatexEval::Latex.new(latex).equation, 'xi*x' 
  end

  def test_works_with_regular_variables
    latex = 'xyz'
    assert_equal LatexEval::Latex.new(latex).equation, 'x*y*z' 
  end

  def test_works_with_regular_variables_and_weird_numbers
    latex = 'x*2yz'
    assert_equal LatexEval::Latex.new(latex).equation, 'x*2*y*z' 
  end

  def test_works_with_regular_variables_complex
    latex = '\frac{2xy}{3}'
    assert_equal LatexEval::Latex.new(latex).equation, '((2*x*y)/(3))' 
  end
end
