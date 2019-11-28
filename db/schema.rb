# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_28_142115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrateurs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_administrateurs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrateurs_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.string "photo"
    t.string "slug"
    t.bigint "administrateur_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["administrateur_id"], name: "index_articles_on_administrateur_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.integer "administrateur_id"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "nom"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "administrateur_id"
    t.index ["slug"], name: "index_countries_on_slug", unique: true
  end

  create_table "demandes", force: :cascade do |t|
    t.string "nom"
    t.string "telephone"
    t.string "email"
    t.string "objet"
    t.text "contenu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_demandes_on_slug", unique: true
  end

  create_table "diplomes", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_diplomes_on_slug", unique: true
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.string "profil"
    t.string "cover"
    t.string "telephone"
    t.string "email"
    t.string "site"
    t.string "adresse"
    t.string "slug"
    t.bigint "country_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "administrateur_id"
    t.integer "diplome_id"
    t.index ["category_id"], name: "index_etablissements_on_category_id"
    t.index ["country_id"], name: "index_etablissements_on_country_id"
    t.index ["slug"], name: "index_etablissements_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.string "telephone"
    t.string "ville"
    t.text "contenu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_messages_on_slug", unique: true
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nom"
    t.string "ville"
    t.integer "pays_id"
    t.string "formation"
    t.string "bulletin"
    t.string "certificat"
    t.string "carte"
    t.string "pere"
    t.string "mere"
    t.integer "country_id"
    t.string "age"
    t.string "telephone"
    t.index ["email"], name: "index_utilisateurs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_utilisateurs_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "administrateurs"
  add_foreign_key "etablissements", "categories"
  add_foreign_key "etablissements", "countries"
end
