require 'net/http'
require 'uri'
require 'yaml'
require 'json'

module ArkLogWatcher
  def self.run(config_path)
    config = YAML.load_file(config_path)

    log_file = config['log_file']
    webhook_url = config['discord_webhook_url']
    keywords = config.dig('filters', 'include') || []

    unless File.exist?(log_file)
      abort "Log file not found: #{log_file}"
    end

    puts "Watching #{log_file}..."
    File.open(log_file, 'r') do |file|
      file.seek(0, IO::SEEK_END)
      loop do
        line = file.gets
        if line
          if keywords.empty? || keywords.any? { |kw| line.include?(kw) }
            puts "[SEND] #{line.strip}"
            send_to_discord(webhook_url, line.strip)
          end
        else
          sleep 0.5
        end
      end
    end
  end

  def self.send_to_discord(webhook_url, message)
    uri = URI.parse(webhook_url)
    header = { 'Content-Type' => 'application/json' }
    payload = { content: message }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = payload
    http.request(request)
  end
end
