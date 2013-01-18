class NewsController < PostsController
  

  def index
    @news = News.published.desc(:date).paginate(per_page: 10)
  end

  def show
    @news = News.find(params[:id])
    @other_news = News.published.not_in(:id => @news.id).desc(:date).paginate(per_page: 10)
  end

end