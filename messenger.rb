require 'set'

## 
# This class is a mocked out version of a push notification sender
class Messenger

  ##
  # You must call this before trying to send messages
  # Assume it does some heavy network initialization so it takes a while
  def initialize
    # We do some heavy network initialization
    sleep 5
    @not_registered_tokens = Set.new()
  end

  ##
  # Sends the notification body to the devices with the specified tokens
  #
  # == Parameters:
  # tokens::
  #   A list of tokens to send to. Must be 500 or fewer.
  # notification_body::
  #   A string representing the body of the notification. eg. "Hello world!"
  #
  # == Returns:
  # A hash containing a status code and possibly a list of tokens that are no longer valid
  # If :status_code is 500, there was an error and no messages were sent.
  # If :status_code is 400, there was a request error
  # If :status_code is 200, the hash will also contain :not_registered_tokens
  # Tokens in :not_registered_tokens are no longer valid and those devices will not receive notifications
  # You should *not* repeatedly try to send messages to tokens that are no longer registered or you may be banned
  def send(tokens, notification_body)
    return {status_code: 500} if rand() < 0.02
    return {status_code: 400} if tokens.size > 500
    sleep 1 # Network stuff
    not_registered_tokens = tokens.select do |token|
      @not_registered_tokens.include?(token) || rand() < 0.05
    end
    @not_registered_tokens.merge(not_registered_tokens)
    return {status_code: 200, not_registered_tokens: not_registered_tokens}
  end

  ##
  # Generates a device token
  # Ordinarily this would come from the device itself, but a simple version is provided here for your convenience
  def self.generate_token
    (0...8).map { (65 + rand(26)).chr }.join
  end

end