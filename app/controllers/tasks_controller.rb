# TASKS = [
#  { id: 1, name: "Complete Weekend Warrior", description: "05 Alouette", completion_date: "2018-09-24" },
#  { id: 2, name: "Update Hotel", description: "Revisit and refactor", completion_date: "2018-10-01" },
#  { id: 47, name: "Read POODR", description: "Chapter 4", completion_date: "2018-10-01" },
#  { id: 0, name: "Watch video", description: "Live Code of Job Board", completion_date: "2018-10-01" },
#  { id: 7, name: "CS Fun", description: "Reverse Sentence", completion_date: "2018-10-01" },
#  { id: 9, name: "CS Fun", description: "Palindrome Check", completion_date: "2018-10-01" },
#  { id: 5, name: "Ada Zoo", description: "Optional", completion_date: "2018-10-01" }
# ]

require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:id)
  end

  def show
    id = params[:id].to_i   #params is a method inherited from ApplicationController
    @task = Task.find_by(id: id)

    if @task == nil
      render :notfound, status: :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again
      #render :new says go to the routes, and get the task route that makes a new book in the routes.rb, render follows the method path like books#new , books#edit,
    end
  end

  def edit #this method gives the user a form
    @task = Task.find(params[:id].to_i)
  end

  def update
    @task = Task.find_by(id: params[:id].to_i)
    @task.update(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])

    redirect_to task_path
  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy #deleted_task only exists when we run destroy it isn't saved in the database , using a instance variable allows us to use it in the erb page , rather than local variable

    redirect_to root_path
  end


  def complete
    @task = Task.find_by(id: params[:id].to_i)
    if @task.completed_at == nil
      new_date = DateTime.now
    else
      new_date = nil
    end

    @task.update(completed_at: new_date)

    redirect_to root_path
  end

  private  #private means it can only be called by methods that are also in this class
  def task_params
    return params.require(:task).permit(:name, :description, :completion_date)  #require(:task) means only using the task subhash   .permit is only letting it access those three keys, it doesn't let it change the :id field which is good
  end



end
