# BaseballGame


BaseballGame/
├── main.swift
├── BaseballGame.swift (Game.swift 역할)
├── GameLogic.swift
└── RecordManager.swift

| 파일명                    | 역할                         | 비고                                    |
| ---------------------- | -------------------------- | ------------------------------------- |
| `main.swift`           | 게임 실행 진입점                  | `BaseballGame` 인스턴스 생성 후 `start()` 호출 |
| `BaseballGame.swift`   | 전체 게임 흐름 관리 (메뉴, 반복, 종료 등) | `Game.swift`에서 이름만 바뀐 구조로 사용          |
| `GameLogic.swift`      | 정답 숫자 생성, 스트라이크/볼 판정       | 기존대로 유지                               |
| `RecordManager.swift`  | 게임 기록 저장 및 출력 기능 구현        | 기존대로 유지                               |
| `InputValidator.swift` | 입력값 검증 (없는 상태지만 만들면 좋음)    | ❗ 현재 없음 → 간단하게 추가 가능                  |


| 항목                        | 완료 여부 |
| ------------------------- | ----- |
| Lv1. 랜덤 정답 생성 (0 제외, 중복X) | ✅     |
| Lv2. 사용자 입력 및 스트라이크/볼 판정  | ✅     |
| Lv3. 0\~9 허용하되, 맨 앞 0 제외  | ✅     |
| Lv4. 메뉴 및 다시 시작 로직        | ✅     |
| Lv5. 게임 기록 저장 및 출력        | ✅     |
| Lv6. 종료 및 예외 처리           | ✅     |
