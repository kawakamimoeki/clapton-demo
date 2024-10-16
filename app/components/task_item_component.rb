class TaskItemComponent < Clapton::Component
  def render
    box = c(:box, { class: "flex flex-row gap-2 items-center" })
    btn = c(:button, { class: "w-8 h-8 text-4xl rounded-full flex items-center justify-center" })
    btn.add(c(:text, @state.is_done ? "✅" : "🟩"))
    btn.add_action(:click, :TaskListState, :toggle_done)

    tf = c(:input, @state, :title)
    tf.add_action(:input, :TaskListState, :update_title)

    box.add(btn).add(tf)
    box
  end
end
