class LikeComponent < Clapton::Component
  def button_class
    "px-8 py-4 text-2xl bg-sky-500 rounded hover:bg-sky-600 text-white"
  end

  def render
    button = c(:button, { class: button_class })
      .add(c(:text, "Like! #{@state.count}"))
      .add_action(:click, :LikeState, :countup)

    c(:box).add(button)
  end
end
