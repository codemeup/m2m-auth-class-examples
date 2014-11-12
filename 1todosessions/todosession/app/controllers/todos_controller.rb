class TodosController < ApplicationController
  def index
    @todos = session[:todos] ||= []
  end
  def create
    # here we'reusing symbols denoted by :thisisasymbol
    if params[:task] == ""
      flash[:alert] = "Please enter something"
      redirect_to todos_path
    else
      session[:todos]<<params[:task]
      #could also be written session[:todos].push(params[:task])
      flash[:notice] = "You have successfully created a task"
      redirect_to todos_path
  end
  def delete_one
    if session[:todos].include? params[:task]
      session[:todos].delete(params[:task])
    end
    redirect_to todos_path, flash: { success: "You've successfully deleted this task" }
  end
end

  def destroy
    session[:todos]=[]
    # session[:todos].delete_at params[@todo]
    #the following are all equivalents but the success ones give a green alert, the others yellow
    # flash[:notice] = "You have successfully deleted everything"
    # redirect_to todos_path, notice: "You have successfully deleted everything."
    redirect_to todos_path, flash: { success: "You've successfully deleted everything!" }
  end
end
