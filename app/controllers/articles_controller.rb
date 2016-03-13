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

	#POST /articles
	def create
		@article = Article.new(title: params[:article][:title],
								body: params[:article][:body])
		
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
	end


end