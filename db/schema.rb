# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20110928081430) do

  create_table "articles", force: :cascade do |t|
    t.string   "head",           limit: 255
    t.text     "lead",           limit: 65535
    t.text     "body",           limit: 65535
    t.integer  "author_id",      limit: 4,     default: 7, null: false
    t.integer  "articletype_id", limit: 4,     default: 0, null: false
    t.datetime "created_at",                               null: false
    t.string   "chapeau",        limit: 255
    t.integer  "onhomepage",     limit: 1,     default: 1, null: false
  end

  add_index "articles", ["articletype_id"], name: "ARTICLE_TypeId", using: :btree
  add_index "articles", ["author_id"], name: "author_id", using: :btree
  add_index "articles", ["onhomepage"], name: "ARTICLE_OnHomePage", using: :btree

  create_table "articletypes", force: :cascade do |t|
    t.string  "description", limit: 64,    default: "", null: false
    t.integer "italics",     limit: 1,     default: 0,  null: false
    t.integer "hideauthor",  limit: 1,     default: 0,  null: false
    t.integer "visible",     limit: 1,     default: 1,  null: false
    t.text    "intro",       limit: 65535,              null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "alias_to",   limit: 4
    t.string   "labels",     limit: 128
    t.datetime "updated_at"
    t.string   "myspace",    limit: 255
    t.string   "discog",     limit: 255
    t.integer  "fan_count",  limit: 4,     default: 0, null: false
    t.text     "biography",  limit: 65535
  end

  add_index "artists", ["alias_to"], name: "DJ_AliasTo", using: :btree
  add_index "artists", ["name"], name: "name", unique: true, using: :btree

  create_table "artists_parties", id: false, force: :cascade do |t|
    t.integer "artist_id", limit: 4, default: 0, null: false
    t.integer "party_id",  limit: 4, default: 0, null: false
  end

  add_index "artists_parties", ["party_id"], name: "PARTY_Id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string  "name",           limit: 71, default: "", null: false
    t.string  "email",          limit: 64, default: "", null: false
    t.string  "login",          limit: 16
    t.string  "password",       limit: 64
    t.integer "articles_count", limit: 4,  default: 0
  end

  add_index "authors", ["login"], name: "AUTHOR_Login", unique: true, using: :btree

  create_table "blogs", force: :cascade do |t|
    t.integer "artist_id", limit: 4
    t.string  "url",       limit: 255
  end

  add_index "blogs", ["artist_id"], name: "artist_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",          limit: 65535
    t.integer  "subscriber_id", limit: 4,     default: 0,  null: false
    t.datetime "created_at",                               null: false
    t.string   "parent_url",    limit: 255,   default: "", null: false
    t.integer  "visible",       limit: 1,     default: 1,  null: false
  end

  add_index "comments", ["parent_url"], name: "parent_url", using: :btree
  add_index "comments", ["subscriber_id"], name: "subscriber_id", using: :btree

  create_table "contestants", force: :cascade do |t|
    t.string  "email",      limit: 255, default: "", null: false
    t.integer "contest_id", limit: 4,   default: 0,  null: false
    t.string  "naam",       limit: 64,  default: "", null: false
    t.string  "adres",      limit: 64
    t.string  "postcode",   limit: 12
    t.string  "plaats",     limit: 64
    t.integer "won",        limit: 1
  end

  add_index "contestants", ["contest_id"], name: "contest_id", using: :btree
  add_index "contestants", ["email", "contest_id"], name: "CANTS_Email", unique: true, using: :btree
  add_index "contestants", ["won"], name: "won", using: :btree

  create_table "contests", force: :cascade do |t|
    t.date    "datefrom"
    t.date    "dateto"
    t.string  "token",       limit: 16, default: "", null: false
    t.string  "email",       limit: 64, default: "", null: false
    t.integer "confirmed",   limit: 1,  default: 0,  null: false
    t.integer "num_winners", limit: 2,  default: 0,  null: false
    t.integer "addr_req",    limit: 1,  default: 0,  null: false
    t.integer "venue_id",    limit: 4
  end

  add_index "contests", ["confirmed"], name: "confirmed", using: :btree
  add_index "contests", ["dateto"], name: "dateto", using: :btree
  add_index "contests", ["token"], name: "CONTEST_Token", unique: true, using: :btree
  add_index "contests", ["venue_id"], name: "venue_id", using: :btree

  create_table "favourites", id: false, force: :cascade do |t|
    t.integer "subscriber_id", limit: 4, default: 0, null: false
    t.integer "artist_id",     limit: 4, default: 0, null: false
  end

  add_index "favourites", ["artist_id"], name: "artist_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file",                limit: 255,   default: "", null: false
    t.text     "caption",             limit: 65535
    t.integer  "visual_id",           limit: 4,     default: 0,  null: false
    t.string   "visual_type",         limit: 255,   default: "", null: false
    t.string   "author",              limit: 255
    t.string   "upload_file_name",    limit: 255
    t.string   "upload_content_type", limit: 255
    t.integer  "upload_file_size",    limit: 4
    t.datetime "upload_updated_at"
  end

  add_index "images", ["visual_id"], name: "images_visual_id_index", using: :btree

  create_table "livesets", force: :cascade do |t|
    t.integer  "artist_id",     limit: 4
    t.datetime "created_at"
    t.string   "url",           limit: 255
    t.string   "name",          limit: 255
    t.integer  "subscriber_id", limit: 4
    t.text     "description",   limit: 65535
  end

  add_index "livesets", ["artist_id"], name: "artist_id", using: :btree
  add_index "livesets", ["created_at"], name: "created_at", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string  "title",       limit: 64,    default: "", null: false
    t.date    "partydate"
    t.integer "venue_id",    limit: 4,     default: 0,  null: false
    t.float   "price",       limit: 53
    t.text    "description", limit: 65535
    t.integer "bethere",     limit: 1,     default: 0,  null: false
    t.integer "visible",     limit: 1,     default: 1,  null: false
    t.date    "updated_on"
    t.text    "capsule",     limit: 65535
  end

  add_index "parties", ["bethere"], name: "bethere", using: :btree
  add_index "parties", ["partydate"], name: "PARTY_Date", using: :btree
  add_index "parties", ["venue_id"], name: "PARTY_VenueId", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255,   default: "", null: false
    t.text     "description",  limit: 65535,              null: false
    t.string   "url",          limit: 255,   default: "", null: false
    t.integer  "blog_id",      limit: 4,     default: 0,  null: false
    t.datetime "published_at",                            null: false
  end

  add_index "posts", ["blog_id"], name: "blog_id", using: :btree
  add_index "posts", ["url"], name: "url", unique: true, using: :btree

  create_table "prizes", force: :cascade do |t|
    t.string  "description",     limit: 255,   default: "", null: false
    t.text    "longdescription", limit: 65535
    t.integer "contest_id",      limit: 4,     default: 0,  null: false
  end

  add_index "prizes", ["contest_id"], name: "contest_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string  "email",            limit: 64, default: "", null: false
    t.string  "password",         limit: 64, default: "", null: false
    t.integer "mailformat",       limit: 1,  default: 1
    t.string  "address",          limit: 64
    t.string  "city",             limit: 64
    t.string  "postcode",         limit: 16
    t.integer "country_id",       limit: 4,  default: 0,  null: false
    t.string  "name",             limit: 64, default: "", null: false
    t.string  "alias",            limit: 64
    t.string  "company",          limit: 64
    t.integer "active",           limit: 1,  default: 1,  null: false
    t.date    "created_on"
    t.integer "bpm",              limit: 4,  default: 50, null: false
    t.integer "bounces",          limit: 4,  default: 0,  null: false
    t.integer "balance",          limit: 4,  default: 0,  null: false
    t.integer "artist_updates",   limit: 1,  default: 2,  null: false
    t.date    "elite"
    t.date    "last_nieuwsbrief"
  end

  add_index "subscribers", ["email"], name: "EMAIL", unique: true, using: :btree

  create_table "torrents", force: :cascade do |t|
    t.string   "scrape_url", limit: 255,   default: "", null: false
    t.string   "filename",   limit: 255,   default: "", null: false
    t.integer  "seeders",    limit: 2,     default: 0,  null: false
    t.integer  "leechers",   limit: 2,     default: 0,  null: false
    t.datetime "expires_at",                            null: false
    t.integer  "length",     limit: 4,     default: 0,  null: false
    t.datetime "created_at"
    t.string   "info_hash",  limit: 255,   default: "", null: false
    t.string   "get_url",    limit: 255,   default: "", null: false
    t.text     "comment",    limit: 65535
  end

  add_index "torrents", ["get_url"], name: "get_url", unique: true, using: :btree
  add_index "torrents", ["info_hash"], name: "sha1", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string "name",      limit: 64,  default: "",   null: false
    t.string "place",     limit: 64,  default: "",   null: false
    t.string "country",   limit: 2,   default: "NL", null: false
    t.string "address",   limit: 64
    t.string "postcode",  limit: 10
    t.string "telephone", limit: 12
    t.string "fax",       limit: 12
    t.string "url",       limit: 255
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",        limit: 255, default: "", null: false
    t.string   "src",          limit: 255, default: "", null: false
    t.string   "url",          limit: 255, default: "", null: false
    t.datetime "published_at"
    t.integer  "artist_id",    limit: 4
    t.integer  "visible",      limit: 1,   default: 1,  null: false
    t.integer  "length",       limit: 4
  end

  add_index "videos", ["artist_id"], name: "artist_id", using: :btree
  add_index "videos", ["src"], name: "src", unique: true, using: :btree
  add_index "videos", ["visible"], name: "visible", using: :btree

  create_table "votes", force: :cascade do |t|
    t.boolean  "vote",                      default: false, null: false
    t.datetime "created_at",                                null: false
    t.string   "voteable_type", limit: 255, default: "",    null: false
    t.integer  "voteable_id",   limit: 4,   default: 0,     null: false
    t.integer  "subscriber_id", limit: 4,   default: 0,     null: false
  end

  add_index "votes", ["subscriber_id"], name: "votes_subscriber_id_index", using: :btree
  add_index "votes", ["voteable_id"], name: "votes_voteable_id_index", using: :btree

  add_foreign_key "articles", "articletypes", name: "articles_ibfk_1"
  add_foreign_key "articles", "authors", name: "articles_ibfk_2"
  add_foreign_key "artists_parties", "artists", name: "artists_parties_ibfk_1"
  add_foreign_key "artists_parties", "parties", name: "artists_parties_ibfk_2"
  add_foreign_key "blogs", "artists", name: "blogs_ibfk_1"
  add_foreign_key "comments", "subscribers", name: "comments_ibfk_1"
  add_foreign_key "contestants", "contests", name: "contestants_ibfk_1"
  add_foreign_key "contests", "venues", name: "contests_ibfk_1"
  add_foreign_key "favourites", "artists", name: "favourites_ibfk_2"
  add_foreign_key "favourites", "subscribers", name: "favourites_ibfk_1"
  add_foreign_key "livesets", "artists", name: "livesets_ibfk_1"
  add_foreign_key "parties", "venues", name: "parties_ibfk_1"
  add_foreign_key "prizes", "contests", name: "prizes_ibfk_1"
  add_foreign_key "videos", "artists", name: "videos_ibfk_1"
  add_foreign_key "votes", "subscribers", name: "votes_ibfk_1"
end
