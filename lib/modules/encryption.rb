require 'digest'

module Encryption

  def generate_salt
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    alphabet.gsub(/[aeiou]/, "").split("").shuffle.join
  end

  def encrypt(text)
    Digest::SHA256.hexdigest(text)
  end

end