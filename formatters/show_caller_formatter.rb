require 'rspec/core/formatters/console_codes'
require 'byebug'

class ShowCallerFormatter
  # :exception,
  # :description,
  # :message_lines,
  # :colorized_message_lines,
  # :formatted_backtrace,
  # :colorized_formatted_backtrace,
  # :fully_formatted,
  # :example,

  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :close, :start
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.

  def initialize(output)
    @output = output
  end

  def start(notification)
    #clear screen, move to top
    @output << "\e[2J\e[H\e[0K"
  end

  def example_passed(notification)
    @output << RSpec::Core::Formatters::ConsoleCodes.wrap(".", :success)
  end

  def example_failed(notification)
    @output << RSpec::Core::Formatters::ConsoleCodes.wrap(failure_message(notification), :failure)
  end

  def close(notification)
    @output << "\n"
  end

  private

  def failure_message(notification)
    "\n" + notification.example.location + "\n"
  end
end
