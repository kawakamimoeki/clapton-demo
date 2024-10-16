class ConceptComponent < Clapton::Component
  def render
    c(:box)
      .add(c(:h, 2, { class: "font-bold text-2xl mb-2" }).add(c(:text, "Concept")))
      .add(c(:p).add(c(:text, "
        This project is an experiment to see if we can create a web application using only Ruby with the Rails infrastructure.
        So far, it is working well, as you can see from this site (this site is actually made with Clapton).
      ")))
  end
end
