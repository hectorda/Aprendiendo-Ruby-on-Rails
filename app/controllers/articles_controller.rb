class ArticlesController < ApplicationController
	#Get /articles
	def index
		@articles = Article.all
	end
	#Get article/:id
	def show
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
		@article.save
		redirect_to @article
	end

end