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
            @@combination_arr.push(rand(0..@@colors_array.length - 1))
        end
        public 
        def testMethod
            4.times{newCombination}
            p @@combination_arr
        end
    end
end

Mastermind.testMethod