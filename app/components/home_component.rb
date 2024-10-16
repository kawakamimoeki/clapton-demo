class HomeComponent < Clapton::Component
  def render
    c(:box, { class: "h-screen w-full" })
      .add(HeaderComponent.new)
      .add(MainComponent.new(like_count: @state.like_count, tasks: @state.tasks))
  end
end
