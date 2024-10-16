class FooterComponent < Clapton::Component
  def render
    c(:box, { class: "flex flex-col gap-2 w-full" })
      .add(c(:h, 2, { class: "text-center w-full opacity-50 text-sm" }).add(c(:embed, "&copy; 2024 Kawakami Moeki")))
  end
end
