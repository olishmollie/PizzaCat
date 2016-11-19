module Encryption
  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
  CYPHER = "HCK9l2J1GhXpj6x0dSLsDoO7VnTfB4FzUArabYkRqivWN38wEyuIMm5ceZtgPQ"
  private_constant :ALPHABET, :CYPHER

  def encrypt(text)
    text.tr(ALPHABET, CYPHER) 
  end

  def decrypt(text)
    text.tr(CYPHER, ALPHABET)
  end
end