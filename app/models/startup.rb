class Startup

    @@all = []

    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        count = 0
        FundingRound.all.each do |fund|
            if fund.startup == self
                count += 1
            end
        end
        count
    end

    def total_funds
        total = 0
        FundingRound.all.each do |fund|
            if fund.startup == self
                total += fund.investment
            end
        end
        total
    end

    def investors
        investors = []
        FundingRound.all.each do |fund|
            if fund.startup == self
                investors << fund.venture_capitalist
            end
        end
        investors.uniq
    end 

    def big_investors
        big_investors = []
        FundingRound.all.each do |fund|
            if VentureCapitalist.tres_commas_club.include?(fund.venture_capitalist)
                if fund.startup == self
                    big_investors << fund.venture_capitalist
                end
            end
        end
        big_investors.uniq
    end


    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        all.each_with_object([]) do |startup, final|
            final << startup.domain
        end
    end

end
