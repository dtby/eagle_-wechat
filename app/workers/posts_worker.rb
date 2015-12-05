class PostsWorker
  include Sneakers::Worker

  from_queue 'worker.task', env: nil

  def work(raw_post)
    RecentTasks.push(raw_post)
    ack!  # we need to let queue know that message was received
  end
end
