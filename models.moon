import Model from require "lapis.db.model"
import raw from require "lapis.db.base"
import autoload from require "lapis.util"
autoload "models"



class Users extends Model
  @relations: {
    { "history", belongs_to:"ArticleHistory" }
  }

class Articles extends Model
  @timestamp: true
  @relations: {
    { "history", has_many:"ArticleHistory" }
  }

class ArticleHistory extends Model
  @timestamp: true
  @primary_key: { "user_id", "article_id", "revision" }
  @relations: {
    { "user", belongs_to:"Users" }
    { "article", belongs_to:"Articles" }
  }

  @table_name: => "article_history"


{ :Users, :Articles, :ArticleHistory }
