class MainVisualComponent < Clapton::Component
  def render
    c(:box)
      .add(c(:h, 1, { class: "w-full font-bold text-4xl p-8 text-center" }).add(c(:text, "Clapton")))
      .add(c(:p, { class: "w-full text-center" }).add(c(:text, "No JavaScript, No HTML, Just Ruby")))
  end
end
