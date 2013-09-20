#encoding: utf-8
class Zhiwutong
  class << self
    def qike
      url = "http://www.zhiwutong.com/daohang/genera_pinyin.htm"
      response = Typhoeus::Request.get url
      response.body.scan(/\/latin\/.+\.htm/).each do |url|
        shu url
        break if Rails.env.test?
      end
    end
    def fetch_page url
      response = Typhoeus::Request.get url,:follow_location=>true
      if response.success?
        body = response.body.encode("UTF-8","GBK",:invalid=>:replace,:undef=>:replace,:replace=>'?')
        return Nokogiri::HTML(body)
        else
        raise "ERROR:DrugStores.fetch_page #{url} #{response.inspect}"
      end
    end
    def shu url
      url = "http://www.zhiwutong.com/" + url
      pp url if Rails.env.test?
      doc = fetch_page url
      node = doc.at_css('.content')
      hash = {}
      node.css('b').each do |b|
        next if b.next.name != 'text'
        hash[b.text.gsub(/：/,'')] = b.next.text
      end
      pp hash
      node.css('a').each do |a|
        str = a.attr('href')
        next if str.match(/latin\/.+\/.+\-.+\.htm/).nil?
        zhong str
      end
      
    end
    def zhong url
      url = "http://www.zhiwutong.com/" + url
      pp url if Rails.env.test?
      doc = fetch_page url
      node = doc.at_css('.content')
      hash = {}
      node.css('b').each do |b|
        next if b.next.name != 'text'
        hash[b.text.gsub(/：/,'')] = b.next.text
      end
      pp hash
      data = {}
      {
        name: "种中文名", latin:"种拉丁名",common_names: "种别名",
        men: "门中文名", gang: "纲中文名", ke: "科中文名", shu: "属中文名"
      }.each do |k,v|
        data[k] = hash.delete(v) if hash.has_key?(v)
      end
      pp data
    end
  end
end
