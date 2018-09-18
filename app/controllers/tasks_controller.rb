TASKS = [
 { id: 1, name: "Complete Weekend Warrior", description: "05 Alouette", completion_date: "2018-09-24" },
 { id: 2, name: "Update Hotel", description: "Revisit and refactor", completion_date: "2018-10-01" },
 { id: 47, name: "Read POODR", description: "Chapter 4", completion_date: "2018-10-01" },
 { id: 0, name: "Watch video", description: "Live Code of Job Board", completion_date: "2018-10-01" },
 { id: 7, name: "CS Fun", description: "Reverse Sentence", completion_date: "2018-10-01" },
 { id: 9, name: "CS Fun", description: "Palindrome Check", completion_date: "2018-10-01" },
 { id: 5, name: "Ada Zoo", description: "Optional", completion_date: "2018-10-01" }
]


class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    id = params[:id]
    id = id.to_i  #params is a method inherited from ApplicationController
    @task = TASKS.find do |task|
      task[:id] == id
    end 
  end
end
