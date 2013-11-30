def money_to_coins(amount)
  penny = [50,20,10,5,2,1]
  monets = [2,1]
  monets_penny = amount.split('.')
  @returns=[]
  #i have only coins
  if monets_penny[1] == nil
    monets_penny[0].chomp('p')
    split_amount_of(penny,monets_penny[0].to_i)
  end
  #i have coins and monets
  if monets_penny[1] != nil
    monets_penny[0] = monets_penny[0].gsub("£","")
    split_amount_of(monets,monets_penny[0].to_i)
    @returns << "."
    split_amount_of(penny,monets_penny[1].to_i)
  end
@returns
# print_money(amount)
  
end

def mixed?(amount)
  amount.include?(".")
end

def print_penny(money)
   money.counts

end

def print_money(amount)

    if mixed?(amount)
    print 

    end

   print_penny

    
    

end

def  split_amount_of(money_template,money)
  return if money <= 0
  money_template.each_with_index { |key,value| 
  if money - key >= 0 
     @returns << key
     return split_amount_of(money_template, money - key)
  end
  }
  @returns
end

print money_to_coins("£7.76")
#print money_to_coins("£4.00")
#print money_to_coins("£4.03")