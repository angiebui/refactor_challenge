class TodosController < ApplicationController

  def index
    @lists = List.all

  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create

    list_name = List.sanitize params[:todo][:list_id]
    list_name = List.find_or_create_by_name list_name 
    params[:todo][:list_id] = list_name.id

    @todo = Todo.new params[:todo]
    @todo.update_status(params[:todo][:status])

    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
    list_name = List.find(@todo.list_id).name
    @status = Todo.translate_status(@todo.status)
    @todo.list_id = list_name
    
  end

  def update
    @todo = Todo.find params[:id]

    list_name = List.sanitize(params[:todo][:list_id])
    list_name = List.find_or_create_by_name(list_name)
    params[:todo][:list_id] = list_name.id

    if @todo.update_attributes params[:todo]
      redirect_to root_path
    else
      render :edit
    end
  end

end
