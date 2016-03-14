class ArticlesController < ApplicationController
	#Get /articles
	def index
		#Todos los Registros
		@articles = Article.all
	end
	#Get article/:id
	def show
		#Encontrar un registro por id
		@article = Article.find(params[:id])
	end

	#Get /articles/new
	def new
		@article = Article.new;
	end
	#GET /articles/:id/edit
	def edit
		@article = Article.find(params[:id])
	end

	#POST /articles
	def create
		@article = Article.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new
		end		
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end

	#Get /articles/:id/update
	def update
		# @article.update_attributs({title: 'Nuevo Articulo'})
		@article = Article.find(params[:id])
		if(@article.update(article_params))
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def article_params
		params.require(:article).permit(:title,:body,:visits_count)
	end

end