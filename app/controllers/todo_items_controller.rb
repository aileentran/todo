class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
     respond_to do |format|
       if @todo_item.save
         format.html { redirect_to @todo_list, notice: 'Todo item was successfully created.' }
         format.json { render :show, status: :created, location: @todo_list }
       end
     end
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to @todo_list, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    @todo_item.content = params["post"]["content"]
    @todo_item.save
    respond_to do |format|
      format.html { redirect_to @todo_list, notice: 'Todo item was successfully updated.' }
      format.json { render :show, status: :ok, location: @todo_list }
    end
  end

  def complete
    @todo_item.complete = true
    @todo_item.save
    redirect_to todo_list_path(@todo_list)
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit('content')
  end

end
