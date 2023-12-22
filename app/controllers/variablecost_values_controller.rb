class VariablecostValuesController < ApplicationController
  def index
    @variablecosts = Variablecost.oreder(created_at: :asc)
    @variablecost_values = VariablecostValue.order("year_month asc")
  end
  
  def show
    @variablecost_value = VariablecostValue.find(params[:id])
  end
  
  def new
    year_month_day = prams[:year_month] + "-01"
    @year_month = year_month_day.to_date
    
    @variablecosts =Variablecost.order(created_at: :asc)
    @form = Form::VariablecostForm.new
  end
  
  def edit
    @variablecost_value = VariablecostValue.find[:id])
    
