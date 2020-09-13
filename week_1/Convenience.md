# Convenience Keyword



## Title

**Convenience Init에 대해 알아보자!!**



## 초기화 메소드 

swift에는 기본적으로 프로퍼티의 초기화를 위해서 `Init` 초기화 메소드를 사용한다. 



### 1. Init

**예시**

```swift
class Person {
  let name: String
  let age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}
```

위와 같이 초기화 되지 않은 프로퍼티에 대해서 초기화를 해주는 역할을 하고 있다. 

> 만약 생성자에 모든 프로퍼티를 초기화하지 않는 경우 에러가 발생한다! 





### 2. Convenience Init

`Convenience Init`은 무엇인가? 

한 마디로 얘기하면 **`보조 이니셜라이저`** 정도로 생각하면 될 것 같다. 



**예시**

```swift
class Person {
  let name: String
  let age: Int
  let gender: String
  
  init(name: String, age: Int, gender: String) {
    self.name = name
    self.age = age
    self.gender = gender
  }
  
  convenience init(name: String, gender: String) {
    self.init(name: name, age: 0, gender: gender)
  }
}
```

`Convenience init`은 위와같이 기본적으로 

- **기본 init 초기화 메소드를 호출한다.**

그래서 보조 이니셜라이저라는 이름을 가지고 있는 것 같다. 



## 번외 

위에서 `Convenience init`을 쓴 경우 다른 방법을 사용할 수도 있다. 

```swift
class Person {
  let name: String
  let age: Int
  let gender: String
  
  init(name: String, age: Int = 0, gender: String) {
    self.name = name
    self.age = age
    self.gender = gender
  }
}
```

위와 같이 매개변수를 받지 않는 경우 `default value`를 설정해줌으로써 해결할 수 있다. 

하지만 그렇다고 `Convenience init`이 필요 없다는 것은 아니다. 



적절한 상황속에서 사용할 수 있도록 하자! 





