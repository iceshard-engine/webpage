import
  -- Base functions
  types, create_table, drop_table
  -- Update functions
  add_column, rename_column, drop_column
  from require "lapis.db.schema"

-- Database operations
db = require "lapis.db"


{
    [1]: =>
    [2]: =>
    [4]: =>
      create_table "users", {
        { "id", types.serial }
        { "username", types.varchar unique:true }
        { "password", types.varchar }
        "PRIMARY KEY (id)"
      }

      create_table "articles", {
        { "id", types.serial }
        { "created_at", types.time }
        { "updated_at", types.time }
        { "published_revision", types.integer null:true }
        "PRIMARY KEY (id)"
      }

      create_table "article_history", {
        { "user_id", types.foreign_key }
        { "article_id", types.foreign_key }
        { "revision", types.integer default:1 }
        -- Article revision timestamps
        { "created_at", types.time }
        { "updated_at", types.time }
        -- Article revision content
        { "title", types.varchar }
        { "content", types.text }
        "PRIMARY KEY (user_id, article_id, revision)"
      }

    [5]: =>
      add_column "articles", "identifier", types.varchar unique:true, null:true

    [6]: =>
      drop_table "article_history"
      create_table "article_history", {
        { "user_id", types.foreign_key }
        { "article_id", types.foreign_key }
        { "revision", types.integer default:1 }
        -- Article revision timestamps
        { "created_at", types.time }
        { "updated_at", types.time }
        -- Article revision content
        { "title", types.varchar }
        { "content", types.text }
        "PRIMARY KEY (article_id, revision)"
      }
}
