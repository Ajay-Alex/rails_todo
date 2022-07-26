class TodoController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def index
    render json: "Welcome To The Home Page Of Todo App Using Ruby"
  end
  #GET "/todos"
  def show_all
    render :json => Todo.all
  end

  #GET "/todos/:id"
  def show
    begin
      todo=Todo.find(params[:id])
      render json: todo
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def create
    todo=Todo.new(params.permit(:name,:done))
    todo.save
    render json: "Successfully Created"
  end

  def update
    begin
      todo=Todo.find(params[:id])
      todo.update(name: params[:name],done: params[:done])
      render json: "Successfully Updated"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def delete
    begin
      todo=Todo.find(params[:id])
      todo.destroy
      render json: "Successfully Deleted"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end
end
