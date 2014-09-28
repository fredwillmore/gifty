class UserFriend < ActiveRecord::Base
  self.table_name = 'friends_users'

  state_machine :state, :initial => :new do
    state :request_sent
    state :request_received
    state :request_declined
    state :friends
    state :unfriended

    event :send_request do
      transition :new => :request_sent
    end

    event :receive_request do
      transition :request_sent => :friends # I receive a request from someone I've sent a request to
      transition :new => :request_received
    end

    event :approve do
      transition :request_received => :friends
      transition :request_sent => :friends # the request recipient is approving
    end

    event :decline do
      transition :request_received => :request_declined
    end

    event :unfriend do
      transition :friends => :unfriended
    end
  end

end
