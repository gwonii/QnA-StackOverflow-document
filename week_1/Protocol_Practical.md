# Protocol 제대로 사용하기 



## 개요 

프로젝트를 진행하면서 내가 자주 사용하는 것들을 쉽게 사용할 수 있도록 나의 private library를 만들고 싶었다. 라이브러리를 만드려고 하니 자연스럽게 `protocol`을 잘 알고 사용하고 싶어졌다. 그래서 오늘은 protocol에 대해 정리를 해보려고 한다. 





## 개념

프로토콜은 한 마디로 정의하면, 

**프로토콜은 추상화된 함수와 프로퍼티의 모음이다.**

일반적으로 java에서는 인터페이스와 유사한 역할을 한다. 여러 차이점들이 있지만, 이것은 나중에 정리할 수 있도록 하자. 





일반적으로 프로토콜은 **클래스, 구조체, 열거형 등**에게 **채택**되어 사용된다. 

그리고 클래스, 구조체, 열거형은 **채택한 프로토콜을 준수한다.**



### 1. 프로퍼티 

먼저 `protocol`에서의 프로퍼티 요구사항을 알아보려고 한다. 

일단 프로퍼티의 종류를 보면, 

- 저장 프로퍼티 
- 연산 프로퍼티
- 타입 프로퍼티 

로 나눠볼 수 있다. 



**하지만 프로토콜에서는 세 프로퍼티를 구분해서 선언하지 않는다.**

```swift
protocol ImageComponent {
  static var ProtocolType: String { get }
  var imageURL: URL { get }
  var height: CGFloat { get set }
  var width: CGFloat { get set }
}
```



위에서 보듯이 프로토콜에서는 **`gettable`, `settable`**만 정의한다. 

그리고 그것을 채택하여 선언할 때, 프로퍼티의 종류가 정해진다. 

```swift
class SettingIcon: ImageComponent {
  static let protocolType: String = "ImageComponent"
  var imageURLString: String
  let imageURL: URL {
    return URL(string: self.imageURLString)
  }
  var height: CGFloat
  var width: CGFloat
  
  init(imageURLString: String, height: CGFloat, width: CGFloat) {
    self.imageURLString = imageURLString
    self.height = height
    self.widht = width
  }
}
```

> - `height`와 `width`는 get, set이 모두 가능하기 때문에 `let`으로 선언될 수 없다. 
> - `imageURL`처럼 연산프로퍼티로 사용될 수 있다. ( get만 있기 때문에 getter만 사용하고 있는 모습 )
> - `static` 키워드를 이용해서 `타입 프로퍼티`를 만들 수 있다. 

