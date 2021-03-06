module Newebpay
  class Mpg
    attr_accessor :info

    def initialize(params)
      @key = "MS1602307763"
      @iv = "3E3ET7ixgo1lmWy0i8pb3y8Wi8W1K5YT"
      @merchant_id = "PAMnfThUPDB9qcKC"
      @info = {}  # 使用 attr_accessor 讓 info 方便存取
      set_info(params)
    end

    def form_info
      {
        MerchantID: @merchant_id
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: "1.6"
      }
    end

    private

    def trade_info
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      sha256_encode(@key, @iv, trade_info)
    end

    def set_info(order)  
      info[:MerchantID] = @merchant_id
      info[:MerchantOrderNo] = order.slug
      info[:Amt] = order.price
      info[:ItemDesc] = order.name 
      info[:Email] = "test123@gmail.com"
      info[:TimeStamp] = Time.now.to_i 
      info[:RespondType] = "JSON"
      info[:Version] = "1.6"
      info[:ReturnURL] = books_path
      info[:NotifyURL] = checkout_order_path
      info[:LoginType] = 0 
      info[:CREDIT] =  1,
      info[:VACC] = 1
    end

    def url_encoded_query_string
      URI.encode_www_form(info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack('H*').first
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
    
  end
end