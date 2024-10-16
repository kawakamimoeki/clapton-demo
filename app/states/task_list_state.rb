class TaskListState < Clapton::State
  attribute :tasks

  def add_task(params)
    self.tasks << { id: self.tasks.size + 1, title: "New Task", is_done: false }
  end

  def toggle_done(params)
    self.tasks.find { |t| t[:id] == params[:id] }[:is_done] = !params[:is_done]
  end

  def update_title(params)
    self.tasks.find { |t| t[:id] == params[:id] }[:title] = params[:title]
  end

  def update_due(params)
    self.tasks.find { |t| t[:id] == params[:id] }[:due_date] = params[:due_date]
  end
end

