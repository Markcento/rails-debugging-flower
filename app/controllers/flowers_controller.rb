class FlowersController < ApplicationController
  def index
    @flowers = Flower.all
  end

  def new
    @families = Family.all
    @flower = Flower.new
  end

  def create

    @flower = Flower.create(flower_params)
    @families = Family.all
    if @flower.valid? == false ||  @flower.name.include?("!") || @flower.name.include?("#") || @flower.name.include?("$") ||  @flower.name.include?("@") || @flower.name.include?("%") || @flower.name.include?("^") || @flower.name.include?("&") ||  @flower.name.include?("*") || @flower.name.include?("1") || @flower.name.include?("2") || @flower.name.include?("3") ||  @flower.name.include?("4") || @flower.name.include?("5") || @flower.name.include?("6") ||  @flower.name.include?("7") ||  @flower.name.include?("8") || @flower.name.include?("9") || @flower.name.include?("0") || @flower.color.include?("!") || @flower.color.include?("#") || @flower.color.include?("$") ||  @flower.color.include?("@") || @flower.color.include?("%") || @flower.color.include?("^") || @flower.color.include?("&") ||  @flower.color.include?("*") || @flower.color.include?("1") || @flower.color.include?("2") || @flower.color.include?("3") ||  @flower.color.include?("4") || @flower.color.include?("5") || @flower.color.include?("6") ||  @flower.color.include?("7") ||  @flower.color.include?("8") || @flower.color.include?("9") || @flower.color.include?("0")  
      flash.now[:notice] = "Unable to create flower"
      @flower.destroy
      render :new
    else
      redirect_to flowers_path
      flash[:notice] = "Flower was successfully created."
    end
  end

  private
  def flower_params
    params.require(:flower).permit([:edible, :color, :name, :family_id])
  end
end
