class MoreInformationComponent < Clapton::Component
  def render
    c(:box, { class: "flex flex-col gap-2 w-full" })
      .add(c(:h, 2, { class: "font-bold text-2xl mb-2 w-full" }).add(c(:text, "More Information")))
      .add(c(:a, "https://github.com/kawakamimoeki/clapton", { class: "text-blue-500 hover:text-blue-600" }).add(c(:text, "GitHub")))
  end
end
