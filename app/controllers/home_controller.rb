class HomeController < ApplicationController
  before_action :set_catalog_item, only: [:show]

  # GET /catalog_items
  # GET /catalog_items.json
  def index
    @catalog_items = CatalogItem.all
  end

  # GET /catalog_items/1
  # GET /catalog_items/1.json
  def show
  end

  # GET /catalog_items/new
  def new
    @catalog_item = CatalogItem.new
  end

  # GET /catalog_items/1/edit
  def edit
  end
end
