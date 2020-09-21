class VentureCapitalist

    @@all = []

    attr_accessor :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end


    def self.all
        @@all
    end


    def self.tres_commas_club
        @@all.each_with_object([]) do |ven, final|
           if ven.total_worth >= 1000000000
                final << ven
           end
        end
    end
    
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        funding_rounds = []
        FundingRound.all.each do |fund|
            if fund.venture_capitalist == self
                funding_rounds << fund
            end
        end
        funding_rounds
    end 

    def portfolio
        startups = []
        self.funding_rounds.each do |fund|
            startups << fund.startup
        end
        startups.uniq
    end 

    def biggest_investment
        biggest_investment = nil
        self.funding_rounds.each do |fund|
            if biggest_investment == nil
                biggest_investment = fund
            elsif fund.investment > biggest_investment.investment
                biggest_investment = fund
            end
        end
        biggest_investment
    end

    def invested(domain)
        total_invested = 0
        self.funding_rounds.each do |fund|
            if fund.startup.domain == domain
                total_invested += fund.investment
            end
        end
        total_invested
    end

end
