# Improve Solution



## Summary

어제는 채택을 받고 싶은 마음에 문제점을 해결해주고 빠르게 글을 썼다. 

그래서 아쉬운 점이 많아 코드를 조금 더 수정하는 방향으로 글을 써보려고 한다. 

**결국 채택받았다… ㅎㅎ ♥️**



## Title

**parse json in swift 5 I got no data**



## Problem

`JSON`을 파싱하는데 있어서 전반적으로 수정해야 될 사항들을 고쳐보려고 한다. 

1. 구조체 조금더 잘 만들기



## Solution

### 1. 구조체 조금더 잘 만들기 

구조체를 다시 만들어보려고 한다. 어제 의 경우 

**JSON**

```swift
{
    "blocked_list": {
        "total": 2,
        "users": [
            {
                "id": 49,
                "name": "fdewer12faasd",
                "profilePicture": "",
                "followStatus": 0
            }
        ]
    }
}
```

**Struct**

```swift
struct CurrentUserBlockList : Codable  {
    let total : Int?
    let users : [users]
}

struct users : Codable {
    let followStatus : Int?
    let id : Int?
    let name : String?
    let profilePicture : String?
}
```

이랬었다… 



#### 1) 여기서 나는 **`CodingKeys`**를 이용해 보려고 한다. 

`Codingkeys`는 보통 json을 객체로 파싱할 때 key값을 매칭해주려고 사용되기도 한다. ( 이외에도 다양한 프로콜을 이용해서 여러 가지 신기한 일들을 할 수 있다. 나중에 시간이 되면 따로 정리하도록 하자. )

이전에 있었던 문제는 `blocked_list`라는 key를 만들지 않았기 때문에 발생했다. 

문제를 해결하기 위해서 

```swift
struct SolutionObject: Codable {
  let blocked_list: CurrentUserBlockList
}

struct CurrentUserBlockList : Codable  {
    let total : Int?
    let users : [users]
}

struct users : Codable {
    let followStatus : Int?
    let id : Int?
    let name : String?
    let profilePicture : String?
}
```

이렇게 가장 상위의 `Struct`를 만들었다. 

그런데 여기서 눈에 띄는 것은 `JSON`의 `key`값이 `Swift` 컨벤션과 어울리지 않는다는 것이다. 

보통 Swift에서는 카멜케이스를 사용한다. 위의 변수를 고쳐보면 

` blocked_list` —> `blockedList`로 고칠 수 있다. 

그런데 `JSON`을 파싱하기 위해서는 변수명을 그대로 사용해야 한다. 하지만,, 나는 `blocked_list`라는 변수명이 사용하기 싫다. 

이럴 때 우리는 **`Codingkeys`**를 사용할 수 있다. 

```swift
struct SolutionObject: Codable {
  let blockedList: CurrentUserBlockList
  
  enum Codingkeys: String, Codingkey {
    case blockedList: "blocked_list"
  }
}
```

이렇게 하면 `JSON`을 decode할 때 `blocked_list`를 인식하고 `blockedList`에 `value`를 매칭시켜준다. 

위와 같은 예시에서는 변수가 한 개 밖에 없어서 `enum`이 불필요해 보이지만 보통 `Codingkeys`는 enum으로 선언한다. 



#### 2) 변수명 잘 쓰기...

그리고 어제 코드를 보면서 가장 불편했던 것은 

```swift
struct CurrentUserBlockList : Codable  {
    let total : Int?
    let users : [users]
}
```

이 코드에서 `users`라는 변수의 타입이 `[users]`라는 것이었다. 

먼저 타입이 소문자로 시작하는 것도 너무 맘에 안들었고, 또한 users라는 배열에 users를 넣는다는 것은 상상도 못할 일이다… 

그래서 간단하게 

```swift
struct CurrentUserBlockList : Codable  {
    let total : Int?
    let users : [User]
}
```

이렇게 고쳐주고 싶었다. 



#### 3) Codable, Encodable, Decodable 구분하기 

`Codable`은 `Encodable`과 `Decodable`이 합쳐진 것이다. 

그런데 위의 `Struct`는 모두 `Codable`로 되어있다. 프로그램을 실행시키는데는 아무런 문제가 없지만, 

**`Codable`**, **`Encodable`**, **`Decodable`** 을 확실히 구분해줄 필요가 있다. 

자신의 코드를 다른 사람이 볼 때 만약 Struct가 Codable을 채택하고 있다면 일반적으로 `Encode`하고 `Decode`할 것을 기대한다. 

하지만 위의 질문자는 분명히 JSON을 객체로 파싱한 후에 해당 객체를 다시 JSON으로 encode하지 않을 것으로 예상된다. 

이럴 때는 `Codable`을 사용할 것이 아니라, `Decodable`을 사용하는 것이 좋다고 생각한다. 

사소하지만 굉장히 중요한 디테일이라고 생각한다. 



## Conclution

내가 지금 짜고 있는 코드는 나중에 남들이 봤을 때도 읽기 좋아야 한다. 이러한 사소한 디테일과 배려가 내 코드를 읽는 다른 사람을 배려하는 하나의 길이라고 생각하자. 

#### 











