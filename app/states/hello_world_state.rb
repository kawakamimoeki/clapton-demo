class HelloWorldState < Clapton::State
  attribute :message

  def update_message(params)
    1.upto(10) do |i|
      self.message = "This is a message from action. #{i}"
      yield
      sleep 1
    end
  end
end
