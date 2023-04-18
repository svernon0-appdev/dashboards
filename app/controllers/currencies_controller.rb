class CurrenciesController < ApplicationController

  def homepage
    render({ :template => "currency_templates/homepage.html.erb" })
  end

  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({ :template => "currency_templates/step_one.html.erb" })

  end

  def second_currency

    @first_symbol = params.fetch("first_symbol")
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({ :template => "currency_templates/step_two.html.erb" })

  end

  def conversion

    @first_symbol = params.fetch("first_symbol")
    @second_symbol = params.fetch("second_symbol")
    @raw_conversion = open("https://api.exchangerate.host/convert?from=#{@first_symbol}&to=#{@second_symbol}").read
    @parsed_conversion = JSON.parse(@raw_conversion)
    @result = @parsed_conversion.fetch("result")
    render({ :template => "currency_templates/step_three.html.erb" })

  end

end
