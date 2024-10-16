class HeaderComponent < Clapton::Component
  def render
    c(:box, { class: "h-16 w-full fixed z-[50] bg-white flex items-center justify-between px-5 border-b" })
      .add(c(:h, 1, { class: "font-bold" }).add(c(:text, "Clapton")))
      .add(c(:a, "https://github.com/kawakamimoeki/clapton", { class: "flex items-center" })
        .add(c(:embed, "<img src=\"/img/github-mark.svg\" alt=\"GitHub\" class=\"w-6 h-6\">")))
  end
end
