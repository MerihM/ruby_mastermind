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
                p "Choices"
                print @@colors_array
                p ''
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
            @@win = true if (@@position_check_arr.all?{|mem| mem == 1})
        end
        def compareInputCombination
            @@combination_arr.each_with_index do 
                |comb_col, comb_index|
                does_it_exist = @@choice_arr.any?{|col| col == comb_col}
                does_it_exist ? pushRightColor(comb_col, comb_index): @@position_check_arr.push(@@nothing)
            end
            @@position_check_arr = @@position_check_arr.sort
        end
        def playOneRound
            4.times{choiceInput}
            compareInputCombination
            winCondition
        end
        def playMultiRonuds
            until @@win || @@round == 10
                playOneRound
                @@round += 1
                tempArr = []
                tempArr.push(@@choice_arr).push(@@position_check_arr)
                @@round_arr.push(tempArr)
                @@round_arr.each { |arr| p arr }
                unless @@win
                    puts 'Press enter to continue'
                    gets.chomp
                    @@position_check_arr = []
                    @@choice_arr = []
                end
            end
        end
        def endMessage
            if @@win
                puts `clear`
                puts "Good job, you win"
            else
                puts `clear`
                puts 'Better luck next time!!'
            end
        end
        public 
        def playGame
            newCombination
            playMultiRonuds
            endMessage
            @@round_arr.each { |arr| p arr }
            puts "Combination was #{@@combination_arr}"
        end
    end
end

Mastermind.playGame