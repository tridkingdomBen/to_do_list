class ListsController < ApplicationController
  before_action :set_list, :only =>[:show, :edit, :update, :destroy]
  def index
    @lists = List.order(duedate: :asc)
  end

  def complete
    if @List.is_public != true
      @list.update_attributes(:completed_at, Time.now)
      redirect_to lists_url, notice: "任務已完成！"
    end
  end

  def new
    @list=List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List was successfully ctreated !!'
      redirect_to lists_url
    else
      render :action => :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      flash[:notice] = 'List was successfully updated !!'
      redirect_to list_path(@list)
    else
      render :action => :edit
    end
  end

  def destroy
    if DateTime.current < List.find(params[:id]).duedate
      @list.destroy
      flash[:notice] = '刪除成功'
      redirect_to lists_url
    else
      redirect_to lists_url 
      flash[:notice] ='不能刪除，已超過有效期限'
    end
  end

  def is_public
    @list.update(is_public: !(@list.is_public))
  end

  private
  def set_list
    @list=List.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name, :duedate, :note)
  end
end
