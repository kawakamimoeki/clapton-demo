class HelloWorldComponent < Clapton::Component
  def render
    box = c(:box)
    message = c(:text, @state.message)
    input = c(:input, @state, :new_message)
    button = c(:button)
    button.add(c(:text, "Update Message"))
    button.add_action(:click, :HelloWorldState, :update_message)
    box
      .add(message)
      .add(input)
      .add(button)
    box
  end
end
