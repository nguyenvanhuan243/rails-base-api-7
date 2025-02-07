class API::V1::TodosController < API::V1::APIController
  # GET /api/v1/todos
  def index
    todos = Todo.filter(filter_params)
    render json: { todos: }
  end

  # GET /api/v1/todos/:id
  def show
    todo = Todo.find(params[:id])
    render json: { todo: }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Todo not found' }, status: :not_found
  end

  # POST /api/v1/todos
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { todo: }, status: :created
    else
      render json: { error: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/todos/:id
  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: { todo: }
    else
      render json: { error: todo.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Todo not found' }, status: :not_found
  end

  # DELETE /api/v1/todos/:id
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Todo not found' }, status: :not_found
  end

  private

  def filter_params
    params.slice(:status)
  end

  def todo_params
    params.require(:todo).permit(:name, :status)
  end
end
