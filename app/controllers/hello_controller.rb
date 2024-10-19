class HelloController < ApplicationController
  def index
    @components = [
      [:HelloWorldComponent, { message: "This is a message from state." }],
    ]
  end
end
