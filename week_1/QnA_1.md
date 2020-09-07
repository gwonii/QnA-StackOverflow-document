

## Keyword

`[swift]`



## Title

**parse json in swift 5 I got no data**

> https://stackoverflow.com/questions/63774269/parse-json-in-swift-5-i-got-no-data/63776689#63776689

## Contents

I'm trying to parse a json file in swift. Its body looks like that and I still receive no data! Can any one tell me how the structs should looks like? What am i missing?

**요약**

JSON을 Object로 decode하고 싶다는데, 잘 안된단다….

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



**Parsing Code**

```swift
func parseJSON(_ blockdata: Data) -> CurrentUserBlockListModel? {
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(CurrentUserBlockList.self, from: blockdata)
        let usersArray = decodedData.users
        let count = decodedData.total
        let blockModel = CurrentUserBlockListModel(users: usersArray,total:count)
        return blockModel
        
    } catch {
        print("error")
        return nil
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



## Solution



### Cause

`decoding` 하려는 객체가 잘못 되었다. 

만약에 위의 `Parsing Code`를 이용해서 `decode`하려면 

```swift
{
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
```

처럼 생긴 JSON을 `decode`할 수 있다. 



### Conclusion

그러면 어떻게 고쳐야할까?

먼저 `parsing`하려고 하는 객체를 다시 만들어야 한다. 

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

`blocked_list`라는 이름을 가진 변수를 만들어야 한다. 



그리고 `SolutionObject`로 `decode`를 하면 잘 될 것이다. 



## PS

질문은 그렇다고 치는데 코드 자체가 Swift를 공부하기 시작하신지 얼마 안되신 분 같다. 

코드 리팩토링도 다 해드리면서 답변을 달아드리고 싶었지만,,,, 

답변이 아직 없길래 1등으로 답변을 달고 싶은 마음에 문제만 해결할 수 있도록 답변을 달았다. 

나중에 천천히 리팩토링해서 답변을 달아드려야겠다. 

근데 질문하신 내용의 답변을 보시긴할까?? 



## Reference

> [gwonii blog, encode & decode](https://gwonii.github.io/2020/09/06/Encoding-Decoding.html#decodable)
>
> [gwonii blog, JSON 파헤치기](https://gwonii.github.io/2020/08/31/JSON.html)

을 보면 도움이 많이 될 것 같다. 

**Question**

> https://stackoverflow.com/questions/63774269/parse-json-in-swift-5-i-got-no-data/63776689#63776689











