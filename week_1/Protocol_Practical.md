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



### 2. 메소드

프로토콜에서 메소드의 요구사항을 알아보자. 

요구사항을 보기전에 간단히 메소드를 나누자면 

- 인스턴스 메소드 
- 타입 메소드

인스턴스는 인스턴스에서 사용될 메소드이고 타입 메소드는 `static` 키워드가 들어간 해당 타입의 메소드라고 생각하면 된다. 



**인스턴스 메소드**

```swift
protocol InstanceMethodProtocol {
	/// Instance Method
  func firstMethod()
  func secondMethod(param: Param)
  func thirdMethod() -> ReturnValue
}
```

위와 같이 

- 매개변수가 없고 Void를 리턴하는 메소드 
- 매개변수가 있는 메소드
- 리턴값이 있는 메소드 

> **주의 사항**
>
> - 프로토콜에 선언하는 메소드는 `Default Value`를 가질 수 없다. 
> - `{ }` 중괄호는 생략한다. 



**프로토콜을 채택해서 사용할 때**

```swift
class InstanceMethodClass: InstanceMethodProtocol {
  func firstMethod() {
    // contents
  }
  func secondMethod(param: Param) {
    // contents
  }
  func thirdMethod() -> ReturnValue {
    // contents
    return ReturnValue
  }
}
```







**타입 메소드**

```swift
protocol TypeMethodProtocol {
  	/// Type Method
  static func firstMethod()
  static func secondMethod(param: Param)
  static func thirdMethod() -> ReturnValue
}
```

인스턴스 메소드를 선언한 것과 마찬가지로 선언하면 된다. 



**프로토콜을 채택해서 사용할 때**

```swift
class TypeMethodClass: TypeMethodProtocol {
  static func firstMethod() {
    // contents
  }
  static func secondMethod(param: Param) {
    // contents
  }
  class func thirdMethod() -> ReturnValue {
    
  }
}
```



> **챙겨볼 것**
>
> 위에서는 다른 타입 메소드와 달리 `class`로 선언한 타입 메소드가 있다. 이 메소드의 경우 `TypeMethodClass`의 서브 클래스에서 `override` 할 수 있다는 의미를 가지고 있다. 



### 3. Mutating Method

프로토콜에서는 `mutating` 키워드도 사용할 수 있다. 

**mutating** 이란

보통 `struct`나 `enum`에서 자신의 프로퍼티를 변경하는 메소드에 사용되는 키워드이다. 





**mutating method**

```swift
protocol MutatingMethodProtocol {
  mutating func firstMethod(_ num: Int) 
}
```





**프로토콜을 채택하는 Struct**

```swift
struct MutatingMethodStruct {
  var property: Int = 0
  mutating func firstMethod(_ num: Int) {
    self.property += num
  }
}
```



> `mutating` 키워드를 사용하는 것은 `struct`와 `enum`은 **value type** 이기 때문이다. 
>
> `class`의 경우에는 **reference type**이기 때문에 protocol에서 `mutating` 키워드를 사용했다고 하여도 생략할 수 있다. 



### 4. Intializer

이번에는 초기화 메소드의 요구사항을 알아보자. 

기본적으로 Protocol 에서도 초기화 메소드를 선언할 수 있다. 



**Initialize Method**

```swift
Protocol InitializeMethodProtocol {
  init(param: Param)
}
```



 

