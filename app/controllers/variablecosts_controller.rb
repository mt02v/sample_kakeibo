class VariablecostsController < ApplicationController
  def index
    @variablecosts = Variablecost.order(created_at: :asc)
  end
  
  def show
    @variablecost = Variablecost.find(params[:id])
  end
  
  def new
    @variablecost = Variablecost.new(params[:variablecost])
    if @variablecost.save
       ridirect_to @variablecost, notice: "変動費科目を登録しました"
    else
       render "new"
    end
  end
  
  def destroy
    @variablecost = Variablecost.find(params[:id])
    @variablecost.destroy
    redirect_to :variablecosts, notice: "科目を削除しました。"
  end
  
end