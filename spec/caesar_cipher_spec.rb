require './lib/caesar_cipher'

describe CaesarCipher do
  subject(:cipher) { CaesarCipher.new }

  describe "#caesar_cipher" do
    it "returns characters shifted n spaces" do
      expect(cipher.caesar_cipher('what a string', 5)).to eql('bmfy f xywnsl')
    end

    it "returns shifted characters keeping the same case" do
      expect(cipher.caesar_cipher('What A StriNg', 5)).to eql('Bmfy F XywnSl')
    end

    it "returns shifted characters ignoring non-letter characters" do
      expect(cipher.caesar_cipher('What? A string?!', 5)).to eql('Bmfy? F xywnsl?!')
    end

    it "works properly with negative shift values" do
      expect(cipher.caesar_cipher('Bmfy f Xywnsl!', -5)).to eql('What a String!')
      expect(cipher.caesar_cipher('bmfy f Xywnsl!', -5)).to eql('what a String!')
    end

    it "works for any shift value" do
      expect(cipher.caesar_cipher('What a String!', 10)).to eql('Grkd k Cdbsxq!')
    end
  end
end