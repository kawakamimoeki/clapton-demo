class InstallationComponent < Clapton::Component
  def render
    c(:box, { class: "w-full flex flex-col gap-4" })
      .add(c(:h, 2, { class: "font-bold text-2xl mb-2" }).add(c(:text, "Installation")))
      .add(c(:p, { class: "w-full" }).add(c(:text, "
        First, please run `rails new` with Ruby on Rails.
      ")))
      .add(c(:embed, <<~HTML
        <pre><code class="language-bash">rails new myapp</code></pre>
      HTML
      ))
      .add(c(:p, { class: "w-full" }).add(c(:text, "
        Then, please run `bundle add clapton` to add Clapton to your application.
      ")))
      .add(c(:embed, <<~HTML
        <pre><code class="language-bash">bundle add clapton</code></pre>
      HTML
      ))
      .add(c(:p, { class: "w-full" }).add(c(:text, "
        Finally, please add the following code to each file
      ")))
      .add(c(:embed, <<~HTML
        <pre><code class="language-ruby"># app/views/layouts/application.html.erb
        <%= clapton_javascript_tag %>
        </code></pre>
      HTML
      ))
      .add(c(:embed, <<~HTML
        <pre><code class="language-ruby"># config/routes.rb
        Rails.application.routes.draw do
          mount Clapton::Engine => "/clapton"
        end
        </code></pre>
      HTML
      ))
  end
end
