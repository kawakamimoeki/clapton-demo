class HomeController < ApplicationController
  def index
    @components = [[:HomeComponent, { like_count: Like.count, tasks: [
      { id: 1, title: "Task 1", due_date: Time.now + 1.day, is_done: false },
      { id: 2, title: "Task 2", due_date: Time.now + 2.day, is_done: false },
      { id: 3, title: "Task 3", due_date: Time.now + 3.day, is_done: true },
    ] }]]
  end
end
