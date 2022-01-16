function makeStatistics(numArray)
   arithmeticMean = mean(numArray)
   medNum = median(numArray)
   modeNum = mode(numArray)
   range = max(numArray)-min(numArray)
   standardDeviation = std(numArray)
   variance = var(numArray)
   coefficientOfVariation = standardDeviation/medNum * 100
end