import Model from require "lapis.db.model"
import raw from require "lapis.db.base"
import autoload from require "lapis.util"
autoload "models"



class User extends Model
  @table_name: => 'users'
  @relations: {
    { "history", belongs_to:"ArticleHistory" }
  }

class Article extends Model
  @table_name: => 'articles'
  @timestamp: true
  @relations: {
    { "history", has_many:"ArticleHistory" }
  }

class ArticleHistory extends Model
  @timestamp: true
  @primary_key: { "user_id", "article_id", "revision" }
  @relations: {
    { "user", belongs_to:"User" }
    { "article", belongs_to:"Article" }
  }

  @table_name: => "article_history"


{ :User, :Article, :ArticleHistory }
