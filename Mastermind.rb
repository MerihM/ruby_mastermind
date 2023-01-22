module  Mastermind
    class  << self
        private 
        @@colors_array = ['r', 'g', 'b', 'y', 'o', 'p']
        @@correct_choice = 'bl'
        @@wrong_position = 'w'
        @@nothing = 'gr'
        @@choice_arr = []
        @@combination_arr = []
        @@position_check_arr = []
        def newCombination
            4.times {@@combination_arr.push(@@colors_array[rand(0..@@colors_array.length - 1)])}
        end
        def choiceInput
            puts `clear`
            p "Select color"
            tempC = gets.chomp
            isItAvailable = @@colors_array.any?{|color| color == tempC.downcase}
            until isItAvailable
                puts `clear`
                p "Wrong choice, select again"
                tempC = gets.chomp
                isItAvailable = @@colors_array.any?{|color| color == tempC.downcase}
            end
            @@choice_arr.push(tempC)
        end
        public 
        def testMethod
            newCombination
           4.times{choiceInput}
           puts "Combination array #{@@combination_arr}"
           puts "Choice array #{@@choice_arr}"
        end
    end
end

Mastermind.testMethod