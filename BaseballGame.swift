//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 이서린 on 5/27/25.
//

import Foundation

class BaseballGame {
    
    func start() {
        let answer = makeAnswer()
        print("< 게임을 시작합니다 >")
        print("정답이 생성되었습니다! (디버깅용): \(answer)")
        
        while true {
            print("\n숫자를 입력하세요:")
            let input = readLine() ?? ""
            
            // 입력이 숫자 3자리인지 확인
            if input.count != 3 {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            // 2. 문자열을 Int로 변환, 실패 시(nil 포함) 반복문 처음으로
            let digits = input.compactMap { Int(String($0)) }
            if digits.count != 3 {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            // 3. 0이 포함되어 있거나 중복된 숫자가 있을 경우
            if digits.contains(0) || Set(digits).count != 3 {
                print("올바르지 않은 입력값입니다")
                continue
            }
            // 4. 정답과 유저의 입력값을 비교
            let result = compare(guess: digits, answer: answer)
            
            if result.strike == 3 {
                print("정답입니다!")
                break
            } else if result.strike == 0 && result.ball == 0 {
                print("Nothing")
            } else {
                print("\(result.strike)스트라이크 \(result.ball)볼")
            }
        }
        
        func makeAnswer() -> [Int] {
            var numbers = Array(0...9)  // 0부터 9까지 숫자 배열 생성
            
            numbers.shuffle()           // 섞기
            
            // 만약 첫 번째 숫자가 0이면, 0이 아닌 숫자와 자리 바꿈
            if numbers[0] == 0 {
                for i in 1..<numbers.count {
                    if numbers[i] != 0 {
                        numbers.swapAt(0, i)
                        break
                    }
                }
            }
            
            let answer = Array(numbers.prefix(3))  // 앞에서 3개 숫자 뽑기
            return answer                         // [Int] 배열 반환
        }
        // 정답과 입력값 비교 함수
           func compare(guess: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
               var strike = 0
               var ball = 0
               
               for i in 0..<3 {
                   if guess[i] == answer[i] {
                       strike += 1
                   } else if answer.contains(guess[i]) {
                       ball += 1
                   }
               }
               
               return (strike, ball)
           }
    }
    
}
