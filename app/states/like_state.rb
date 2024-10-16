class LikeState < Clapton::State
  attribute :count

  def countup(params)
    Like.create
    self.count = params[:count] + 1
  end
end
