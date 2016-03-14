class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:index,:new,:create]
	#Get /articles
	def index
		#Todos los Registros
		@articles = Article.all
	end
	#Get article/:id
	def show
		@article.update_visits_count
	end

	#Get /articles/new
	def new
		@article = Article.new;
	end
	#GET /articles/:id/edit
	def edit
	end

	#POST /articles
	def create
		@article = current_user.articles.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new
		end		
	end

	def destroy
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end

	#Get /articles/:id/update
	def update
		if(@article.update(article_params))
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def set_article
		@article = Article.find(params[:id])

	end

	def article_params
		params.require(:article).permit(:title,:body,:visits_count)
	end

end