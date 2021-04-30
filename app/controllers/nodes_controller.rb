class NodesController < ApplicationController
  before_action :set_node, only: %i[show edit update destroy]

  def index
    @nodes = Node.where(deleted: params[:deleted] ? true : false).page(params[:page])
  end

  def show
    @operations = @node.operations.order(updated_at: :desc)
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_params)
    if @node.save
      current_user.create_operation(@node, :create_node)
      flash[:success] = 'ノードを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ノードの登録に失敗しました。'
      render :new
    end
  end

  def edit; end

  def update
    if @node.update(node_params)
      current_user.create_operation(@node, :update_node)
      flash[:success] = 'ノードを更新しました。'
      redirect_to root_url
    else
      @node = Node.new(node_params)
      flash.now[:danger] = 'ノードの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.update(deleted: true)
    current_user.create_operation(@node, :delete_node)
    flash[:success] = 'Node は正常に削除されました'
    redirect_to root_url
  end

  private
  
  def set_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:name, :kind, :ipaddress, :hostname)
  end
end
