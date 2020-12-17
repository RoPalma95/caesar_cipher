class CaesarCipher

  def caesar_cipher(message, shift)
    character_codes = message.codepoints   # get array of UTF-8 codes for each character

    new_codes = character_codes.map do |code|
      if (code >= 65 && code <= 90) || (code >= 97 && code <= 122)  # if codes are capital or lowecase letters, shift them 
        code += shift
      else
        code
      end
    end

    new_characters = correct_overshooting(new_codes, shift) 

    new_characters.pack("U*")   # returns a string with the codes converted into their corresponding characters
  end

  private

  def correct_overshooting(codes, shift)  # fixes codes when they go over the codes for Z or z
    codes.map do |code|
      if code > 90 && code - shift <= 90  # if code goes beyond Z and was initially a capital letter
        code = 64 + (code - 90)
      elsif code > 122 && code - shift <= 122  # if code goes beyond z and was initially lowercase letter
        code = 96 + (code - 122)
      elsif code < 65 && code - shift >= 65 # for decoding of uppercase letters
        code = 91 - (65 - code)
      elsif code < 97 && code - shift >= 97 # for decoding of lowercase letters
        code = 123 - (97 - code)
      else
        code
      end
    end
  end

end