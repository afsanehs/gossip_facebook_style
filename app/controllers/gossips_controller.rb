class GossipsController < ApplicationController

  before_action :require_user, only: [:destroy, :edit, :create, :new]
  def index
    @gossips = Gossip.all
  end
  def location 
    @gossips = Gossip.all
    @cities = City.all
  end 
  def show 
    @gossip= Gossip.find(params[:id])
  end
  def author 
    @user= User.find(params[:id])
  end
  def new
    @gossip = Gossip.new 
  end 
  def create
    city = City.find_by_name(params[:gossip][:city])
    @gossip = current_user.gossips.new(title: params[:gossip][:title], content: params[:gossip][:content], city: city)
    @gossip.save!
    flash[:info] = "Potin bien créé !"
    redirect_to '/accueil'

    # @gossip = Gossip.create(gossip_params)
    # @gossip.user = @current_user
    # if @gossip.save
    #   flash[:success] = "Potin bien créé !"
    #   redirect_to root_path
    # else
    #   render :new
    # end

  end
  def update
    # params.delete(:id)
    @gossip = Gossip.find(params[:id])

    if @gossip.update(params.require(:gossip).permit(:title, :content))
      redirect_to @gossip
    else
      render :edit
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
    # @article.update(post_params)
    # redirect_to articles_path
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path 
  end 
  private
  def post_params
    post_params = params.require(:gossips).permit(:title, :content)
  end
end