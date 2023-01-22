module  Mastermind
    class  << self
        private 
        @@colors_array = ['r', 'g', 'b', 'y', 'o', 'p']
        @@correct_choice = 1
        @@wrong_position = 2
        @@nothing = 3
        @@choice_arr = []
        @@combination_arr = []
        @@position_check_arr = []
        @@win = false
        @@round = 0
        @@round_arr = []
        def newCombination
            @@combination_arr = []
            4.times {@@combination_arr.push(@@colors_array[rand(0..@@colors_array.length - 1)])}
        end
        def choiceInput
            puts `clear`
            p "Choices"
            print @@colors_array
            p ''
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
        def pushRightColor(col, index)
            if @@choice_arr[index] == col
                @@position_check_arr.push(@@correct_choice)
            else
                @@position_check_arr.push(@@wrong_position)
            end
        end
        def winCondition
            @@win = false
            if (@@position_check_arr.all?{|mem| mem == 1})
                @@win = true
                p 'We have a winner'
            end
        end
        def compareInputCombination
            @@combination_arr.each_with_index do 
                |comb_col, comb_index|
                does_it_exist = @@choice_arr.any?{|col| col == comb_col}
                does_it_exist ? pushRightColor(comb_col, comb_index): @@position_check_arr.push(@@nothing)
            end
            @@position_check_arr = @@position_check_arr.sort
        end
        public 
        def playOneRound
            4.times{choiceInput}
            compareInputCombination
            winCondition
        end
        def testMethod
            newCombination
            until @@win
                playOneRound
                tempArr = []
                tempArr.push(@@choice_arr).push(@@position_check_arr)
                @@round_arr.push(tempArr)
                @@round_arr.each do
                    |arr|
                    p arr
                end
                p @@position_check_arr
                unless @@win
                    gets.chomp
                    @@position_check_arr = []
                    @@choice_arr = []
                end
            end
            puts "Good job, you win"
        end
    end
end

Mastermind.testMethod