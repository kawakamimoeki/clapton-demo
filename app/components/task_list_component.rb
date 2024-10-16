class TaskListComponent < Clapton::Component
  def render
    box = c(:box, { class: "flex flex-col gap-2" })
    @state.tasks.each do |task|
      box.add(TaskItemComponent.new(id: task[:id], title: task[:title], is_done: task[:is_done]))
    end
    add_button = c(:button, { class: "w-full text-center bg-sky-500 text-white rounded py-2 px-4" })
    add_button.add(c(:text, "Add Task"))
    add_button.add_action(:click, :TaskListState, :add_task)
    box.add(add_button)
  end
end
