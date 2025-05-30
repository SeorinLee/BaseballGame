//
//  GameLogic.swift
//  BaseballGame
//
//  Created by 이서린 on 5/29/25.
//

import Foundation

/// 게임 로직을 담당하는 구조체
struct GameLogic {
    
    /// 정답 숫자 3개를 생성 (0으로 시작하지 않음, 중복 없음)
    func makeAnswer() -> [Int] {
        var numbers = Array(0...9)
        numbers.shuffle()
        
        if numbers[0] == 0 {
            for i in 1..<numbers.count {
                if numbers[i] != 0 {
                    numbers.swapAt(0, i)
                    break
                }
            }
        }
        
        return Array(numbers.prefix(3))
    }
    
    /// 사용자 입력과 정답을 비교하여 스트라이크와 볼 개수 계산
    func compare(guess: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        var strike = 0
        var ball = 0
        
        // 각 자리 숫자를 비교
        for i in 0..<3 {
            if guess[i] == answer[i] {
                strike += 1          // 숫자와 위치 모두 일치 → 스트라이크
            } else if answer.contains(guess[i]) {
                ball += 1            // 숫자만 존재하고 위치 다름 → 볼
            }
        }
        
        return (strike, ball)
    }
}
