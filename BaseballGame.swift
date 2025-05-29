//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 이서린 on 5/27/25.
//

import Foundation

class BaseballGame {
    
    /// 게임 실행 함수
    func start() {
        var isRunning = true
        var gameRecords: [String] = []  // 게임 기록 저장용

        while isRunning {
            // 메인 메뉴 출력
            print("\n환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")

            let input = readLine() ?? ""
            
            switch input {
            case "1":
                // 게임 시작
                print("\n< 게임을 시작합니다 >")
                let answer = GameLogic.makeAnswer()
                print("정답이 생성되었습니다! (디버깅용): \(answer)")  // 디버깅용 출력

                var trialCount = 0  // 시도 횟수 저장

                while true {
                    print("\n숫자를 입력하세요:")
                    let input = readLine() ?? ""
                    
                    // 입력값 유효성 검사
                    if input.count != 3 {
                        print("올바르지 않은 입력값입니다")
                        continue
                    }

                    let digits = input.compactMap { Int(String($0)) }
                    if digits.count != 3 {
                        print("올바르지 않은 입력값입니다")
                        continue
                    }

                    if digits.contains(0) || Set(digits).count != 3 {
                        print("올바르지 않은 입력값입니다")
                        continue
                    }

                    trialCount += 1
                    let result = GameLogic.compare(guess: digits, answer: answer)

                    // 정답 확인
                    if result.strike == 3 {
                        print("정답입니다!")
                        gameRecords.append("\(trialCount)회 만에 정답을 맞혔습니다.")
                        break
                    } else if result.strike == 0 && result.ball == 0 {
                        print("Nothing")  // 아무 것도 맞지 않음
                    } else {
                        print("\(result.strike)스트라이크 \(result.ball)볼")  // 결과 출력
                    }
                }

            case "2":
                // 게임 기록 보기
                print("\n< 게임 기록 보기 >")
                if gameRecords.isEmpty {
                    print("아직 완료된 게임이 없습니다.")
                } else {
                    for record in gameRecords {
                        print(record)
                    }
                }

            case "3":
                // 종료
                print("게임을 종료합니다. 감사합니다!")
                isRunning = false

            default:
                print("잘못된 입력입니다. 1, 2, 3 중에서 선택해주세요.")
            }
        }
    }
}
