class FirstStepComponent < Clapton::Component
  def render
    c(:box, { class: "w-full flex flex-col gap-4" })
      .add(
        c(:h, 2, { class: "text-2xl font-bold" })
        .add(c(:text, "Getting Started"))
      )
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "First, let's create the related model."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-bash">rails generate model Task title:string is_done:boolean</code></pre>
        HTML
      ))
      .add(
        c(:embed, <<~HTML
<pre><code class="language-bash">rails db:migrate</code></pre>
        HTML
      ))
      .add(
        c(:embed, <<~HTML
<pre><code class="language-bash">rails console
> Task.create(title: "Task 1", is_done: false)
> Task.create(title: "Task 2", is_done: false)
> Task.create(title: "Task 3", is_done: true)
</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "Next, let's create a component using the rails generator."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-bash">rails generate clapton TaskList
rails generate clapton TaskItem</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "First, define the State. The State defines the data used in the component and the actions executed on the server side in response to events that occur in the component. Here, we will first define only the data."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/states/task_list_state.rb
class TaskListState < Clapton::State
  attribute :tasks
end</code></pre>
        HTML
      ))
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/states/task_item_state.rb
class TaskItemState < Clapton::State
  attribute :id
  attribute :title
  attribute :is_done
end</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "Next, describe the contents of the component."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/components/task_item_component.rb
class TaskItemComponent < Clapton::Component
  def render
    box = c(:box)
    btn = c(:button)
    btn.add(c(:text, @state.is_done ? "✅" : "🟩"))
    btn.add_action(:click, :TaskListState, :toggle_done)

    tf = c(:input, @state, :title)
    tf.add_action(:input, :TaskListState, :update_title)

    box.add(btn).add(tf)
    box
  end
end
</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "Here, the following part specifies the event to be monitored and the corresponding State action."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby">tf.add_action(:input, :TaskListState, :update_title)</code></pre>
        HTML
      ))
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/components/task_list_component.rb
class TaskListComponent < Clapton::Component
  def render
    box = c(:box)
    @state.tasks.each do |task|
      box.add(TaskItemComponent.new(id: task[:id], title: task[:title], is_done: task[:is_done]))
    end
    add_button = c(:button)
    add_button.add(c(:text, "Add Task"))
    add_button.add_action(:click, :TaskListState, :add_task)
    box.add(add_button)
    box.add_action(:render, :TaskListState, :add_empty_task, debounce: 600)
  end
end
</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "Return to the State again and define the actions."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/states/task_list_state.rb
class TaskListState < Clapton::State
  attribute :tasks

  def add_task(params)
    task = Task.create(title: "New Task", is_done: false)
    self.tasks << { id: task.id, title: task.title, is_done: task.is_done }
  end

  def toggle_done(params)
    task = Task.find(params[:id])
    task.update(is_done: !params[:is_done])
    self.tasks.find { |t| t[:id] == params[:id] }[:is_done] = task.is_done
  end

  def update_title(params)
    task = Task.find_or_create_by(id: params[:id])
    if params[:id].nil?
      self.tasks.find { |t| !t[:id] }[:id] = task.id
    end
    task.update(title: params[:title])
    self.tasks.find { |t| t[:id] == task.id }[:title] = task.title
  end

  def add_empty_task(params)
    self.tasks << { id: nil, title: "", is_done: false }
  end
end
</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "Finally, describe the component you want to render in the controller."))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-bash">rails generate controller Tasks index</code></pre>
        HTML
      ))
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"># app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @components = [
      [
        :TaskList,
        {
          tasks: @tasks.map do |task|
            { id: task.id, title: task.title, is_done: task.is_done }
          end
        }
      ],
    ]
  end
end</code></pre>
        HTML
      ))
      .add(
        c(:p, { class: "w-full" })
        .add(c(:text, "In the template, you only need to write one Clapton tag!"))
      )
      .add(
        c(:embed, <<~HTML
<pre><code class="language-ruby"><%# app/views/tasks/index.html.erb %&gt;
&lt;%= clapton_tag %&gt;</code></pre>
        HTML
      ))
  end
end
