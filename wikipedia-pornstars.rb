# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'active_record'

=begin

WikipediaからAV女優一覧を取得してDBに保存する

=end

ActiveRecord::Base.establish_connection(
                                        "adapter"   => "sqlite3",
                                        "database"  => "db/pornstar.db"
);

class PornStar < ActiveRecord::Base
end

WIKIPEDIA_URL = "http://ja.wikipedia.org"

uri = open(WIKIPEDIA_URL + "/wiki/AV%E5%A5%B3%E5%84%AA%E4%B8%80%E8%A6%A7");
top = Nokogiri::HTML(uri.read, nil, 'UTF-8')
links = []
top.css('#mw-content-text ul li').each do |node|
  anchor = node.child
  if anchor.text =~ /AV女優一覧/
    links.push(anchor['href'])
  end
end

links.each do |link|
  entry = Nokogiri::HTML(open(WIKIPEDIA_URL +  link).read, nil, 'UTF-8')
  entry.css('h3+ul li').each do |node|
    next unless node['class'].nil? && node['id'].nil?
    porn_star = {}
    porn_star[:name] = node.child.text
    if /(([ぁ-ん]+)\s+([ぁ-ん]+))/ =~ node.text then
      porn_star[:yomi] = $1
      porn_star[:last_name] = $2
      porn_star[:first_name] = $3
    end
    PornStar.create(porn_star)
  end
end
