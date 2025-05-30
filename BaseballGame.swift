class BaseballGame {
    
    func start() {
        let logic = GameLogic()
        let recordManager = RecordManager()  // 기록 관리자 인스턴스 생성
        var isRunning = true

        while isRunning {
            print("\n환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")

            let input = readLine() ?? ""
            
            switch input {
            case "1":
                print("\n< 게임을 시작합니다 >")
                let answer = logic.makeAnswer()
                print("정답이 생성되었습니다! (디버깅용): \(answer)")

                var trialCount = 0

                while true {
                    print("\n숫자를 입력하세요:")
                    let input = readLine() ?? ""
                    let digits = input.compactMap { Int(String($0)) }
                    
                    let isValid = input.count == 3 &&
                                  digits.count == 3 &&
                                  !digits.contains(0) &&
                                  Set(digits).count == 3
                    
                    if !isValid {
                        print("올바르지 않은 입력값입니다")
                        continue
                    }

                    trialCount += 1
                    let result = logic.compare(guess: digits, answer: answer)

                    if result.strike == 3 {
                        print("정답입니다!")
                        recordManager.add(trialCount: trialCount)  // 기록 추가
                        break
                    } else if result.strike == 0 && result.ball == 0 {
                        print("Nothing")
                    } else {
                        print("\(result.strike)스트라이크 \(result.ball)볼")
                    }
                }

            case "2":
                recordManager.showRecords()  // 기록 출력

            case "3":
                print("게임을 종료합니다. 감사합니다!")
                isRunning = false

            default:
                print("잘못된 입력입니다. 1, 2, 3 중에서 선택해주세요.")
            }
        }
    }
}
