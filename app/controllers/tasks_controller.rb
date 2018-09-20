# TASKS = [
#  { id: 1, name: "Complete Weekend Warrior", description: "05 Alouette", completion_date: "2018-09-24" },
#  { id: 2, name: "Update Hotel", description: "Revisit and refactor", completion_date: "2018-10-01" },
#  { id: 47, name: "Read POODR", description: "Chapter 4", completion_date: "2018-10-01" },
#  { id: 0, name: "Watch video", description: "Live Code of Job Board", completion_date: "2018-10-01" },
#  { id: 7, name: "CS Fun", description: "Reverse Sentence", completion_date: "2018-10-01" },
#  { id: 9, name: "CS Fun", description: "Palindrome Check", completion_date: "2018-10-01" },
#  { id: 5, name: "Ada Zoo", description: "Optional", completion_date: "2018-10-01" }
# ]


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
    @task = Task.new(name: params[:task][:name], description: params[:task][:description]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again
    end
  end

  def edit #this method gives the user a form 
    @task = Task.find(params[:id].to_i)
  end

  def update
  end

  def destroy
  end
end
