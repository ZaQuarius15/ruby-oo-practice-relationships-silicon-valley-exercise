require_relative '../config/environment.rb'
# require_relative '../tools/funding_round.rb'
# require_relative '../tools/startup.rb'
# require_relative '../tools/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console






startup1 = Startup.new("Plan Z", "Z", "plan.z")
startup2 = Startup.new("Plan S", "Sanja", "plan.s")
startup3 = Startup.new("Yo-Yo VR", "Steve", "yoyo.vr")

cap1 = VentureCapitalist.new("Big Time", 2000000000)
cap2 = VentureCapitalist.new("Regular Time", 10000000)
cap3 = VentureCapitalist.new("Gyllenhal & Sons", 300000000)
cap4 = VentureCapitalist.new("Turkey, Koala, Ostrich & Katz", 30000000000)

round1 = startup1.sign_contract(cap1, "Angel", 100000)
round2 = startup2.sign_contract(cap1, "Angel", 200000)
round3 = startup3.sign_contract(cap1, "Angel", 50000)

round4 = startup1.sign_contract(cap2, "Class 1", 1500000)
round5 = cap2.offer_contract(startup2, "Class 2", 1200000)

round6 = cap3.offer_contract(startup1, "Class 3", 1000000)
round7 = startup3.sign_contract(cap3, "Class 2", 3000000)

round8 = cap4.offer_contract(startup1, "Class 2", 1000000)
round9 = cap4.offer_contract(startup2, "Class 1", 2000000)
round0 = cap4.offer_contract(startup3, "Angel", 50000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line