# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    all_vowel_pairs = []
    words.each_with_index do |word1, i|
        words.each_with_index do |word2, j|
            pair = word1 + " " + word2
            if j > i && all_vowels?(word1, word2)  
                all_vowel_pairs << pair
            end
        end
    end
    all_vowel_pairs
end

def all_vowels?(word1, word2)
    vowels = ["a", "e", "i", "o", "u"]
    pair = word1 + " " + word2

    vowels.each do |vowel|
        if !pair.include?(vowel)
            return false
        end
    end
    true
end



# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#

# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |i| return true if num % i == 0 } 
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select! { |bigram| str.include?(bigram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        if !prc
            self.select {|k,v| k == v } 
        else
            self.select { |k,v| prc.call(k,v) } 
        end
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        
        self.each_char.each_with_index do |char, i| 
            substrings << self[i]
            j = i + 1
            while j < self.length
                substrings << self[i..j]
                j += 1
            end
        end
        return substrings if !length 
        substrings.select { |substring| substring.length == length}

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        ciphered = ""
        self.each_char do |char|
            old_idx = alpha.index(char)
            new_idx = old_idx + num
            ciphered += alpha[new_idx % 26]
        end
        ciphered
    end
end
