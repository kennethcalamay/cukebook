Feature: Division

  Scenario Outline: Divide two numbers
    Given the input "<input>"
    When the calculator is run
    Then the output should be "<output>"

    Examples:
      | input | output |
      | 25/5  | 5      |
      | 100/4 | 25     |
