class NodesController < ApplicationController

  def index
    @nodes = Node.all.page(params[:page])
  end

  def show
  end

  def new
  end

  def create
    @node = current_user.nodes.build(node_params)
    if @node.save
      flash[:success] = 'ノードを登録しました。'
      redirect_to root_url
    else
      @node = current_user.nodes.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'ノードの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def node_params
    params.require(:node).permit(:name, :kind, :ipaddress, :hostname)
  end
end
