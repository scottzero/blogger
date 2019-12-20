class TagsController < AppilcationController

  def show
    @tag = Tag.find(params[:id])
  end

end
