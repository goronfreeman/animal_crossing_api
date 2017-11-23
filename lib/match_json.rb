require 'open-uri'

require_relative 'lib/nokogiri/nokogiri'
require_relative 'lib/alfred-workflow-ruby/alfred-3_workflow'

require_relative 'matchers/strict_matcher'
require_relative 'matchers/soft_matcher.rb'

require_relative 'list_parsers/art_list_parser'
require_relative 'list_parsers/default_list_parser'
require_relative 'list_parsers/fossil_list_parser'
require_relative 'list_parsers/song_list_parser'
require_relative 'list_parsers/villager_list_parser'

require_relative 'info_parsers/art_info_parser'
require_relative 'info_parsers/creature_info_parser'
require_relative 'info_parsers/deep_sea_info_parser'
require_relative 'info_parsers/fossil_info_parser'
require_relative 'info_parsers/song_info_parser'
require_relative 'info_parsers/villager_info_parser'

class MatchJSON
  attr_reader :workflow, :list, :matches, :info_parser

  def initialize(list_url, list_parser, matcher, info_parser)
    query        = ARGV.join(' ').downcase
    @workflow    = Alfred3::Workflow.new
    @list        = list_parser.parse(list_url)
    @matches     = matcher.match(query, list)
    @info_parser = info_parser
  end

  def find
    if matches
      return find_attributes(matches) if matches.is_a? String
      matches.each { |match| match_json(match) }
    else
      no_match_json
    end
  ensure
    print workflow.output
  end

  private

  def match_json(match)
    url = url(match)

    workflow.result
            .title(match)
            .autocomplete(match)
            .quicklookurl(url)
            .text('copy', url)
            .valid(false)
  end

  def attribute_json(match, attribute, value)
    workflow.result
            .title(attribute)
            .subtitle(value)
            .icon(icon_path(attribute))
            .arg(url(match))
  end

  def no_match_json
    workflow.result
            .title('No matches found!')
            .subtitle('Try something else')
            .valid(false)
  end

  def find_attributes(match)
    attributes = info_parser.parse(url(match))
    attributes.each { |k, v| attribute_json(match, k, v) }
  end

  def url(match)
    base   = 'http://animalcrossing.wikia.com'
    suffix = list[match.downcase][:url]

    "#{base}#{suffix}"
  end

  def icon_path(trait)
    "img/#{trait.split.join('_')}.png"
  end
end
