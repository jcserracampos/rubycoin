require 'digest'
require 'Date'

class Block
    def initialize(index, timestamp, data, previous_hash)
        @index = index
        @timestamp = timestamp
        @data = data
        @previous_hash = previous_hash
        @hash = Digest::SHA256.hexdigest self.hash_block
        p self.hash
        
    end

    def hash_block
        sha = Digest::SHA256.new

        sha << @index.to_s + 
            @timestamp.to_s +
            @data.to_s +
            @previous_hash.to_s

        return sha.hexdigest
    end

    def create_genesis_block
        return Block.new(0, DateTime.now, "Genesis Block", "0")
    end
end

Block.new(0, DateTime.now, "Genesis Block", "0")