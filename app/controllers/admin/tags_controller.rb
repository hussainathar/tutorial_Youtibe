class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags= Tag.all.order(id: :desc)
  end

  def create
    tag_perams[:name].split(',').map do|n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was successfully created'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag= Tag.find(params[:id])
    if @tag.update tag_perams
      redirect_to new_admin_tag_url, notice: 'Successfully updated Tag'
    else
      flash[:alert]='There was a problem updating Tag'
      render :edit
    end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to :back, notice: 'Successfully deleted Tag'
  end

  private 
  def tag_perams
    params.require(:tag).permit(:id,:name)
  end
end
