class LikeCodeComponent < Clapton::Component
  def render
    box = c(:box, { class: "w-full flex flex-col" })
    code = c(:embed,
      <<~HTML
<pre class="w-full"><code class="language-ruby"># app/components/like_component.rb
class LikeComponent < Clapton::Component
  def render
    button = c(:button)
      .add(c(:text, "Like! \#{@state.count}"))
      .add_action(:click, :LikeState, :countup)

    c(:box).add(button)
  end
end

# app/states/like_state.rb
class LikeState < Clapton::State
  attribute :count

  def countup(params)
    Like.create
    self.count = params[:count] + 1
  end
end
</code></pre>
      HTML
    )
    box.add(code)
  end
end
