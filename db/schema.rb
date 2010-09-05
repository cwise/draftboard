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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100905013141) do

  create_table "draft_picks", :force => true do |t|
    t.integer  "round"
    t.integer  "pick"
    t.integer  "poolie_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "team",       :null => false
    t.string   "position",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poolies", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "team_name",   :null => false
    t.integer  "draft_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
