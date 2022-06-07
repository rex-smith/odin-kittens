class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to kitten_url(@kitten), notice: "Kitten was successfully created." }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @kitten = Kitten.find(params[:id])
  end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to kitten_url(@kitten), notice: "Kitten was successfully updated." }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @kitten.destroy

    respond_to do |format|
      format.html { redirect_to kittens_url, notice: 'Kitten successfully eliminated.'}
      format.json { head :no_content }
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
