class MainComponent < Clapton::Component
  def render
    c(:box, { class: "pt-16 w-full px-5 pb-5 flex flex-col justify-center items-center gap-8 max-w-2xl mx-auto" })
      .add(MainVisualComponent.new)
      .add(ConceptComponent.new)
      .add(LikeCodeComponent.new)
      .add(c(:img, "/img/arrow.svg", "Arrow", { class: "w-32 h-32 -mt-16 z-[50]" }))
      .add(LikeComponent.new(count: @state.like_count))
      .add(InstallationComponent.new)
      .add(FirstStepComponent.new)
      .add(c(:img, "/img/arrow.svg", "Arrow", { class: "w-32 h-32 z-[50]" }))
      .add(TaskListComponent.new({ tasks: @state.tasks }))
      .add(MoreInformationComponent.new)
      .add(FooterComponent.new)
  end
end
