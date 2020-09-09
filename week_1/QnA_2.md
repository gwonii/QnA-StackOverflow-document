# Keyword

`[swift]` `[lazy]` `[computed property]`



# Title

**Lazy var VS Computed Property**



오늘은 내가 직접 답변을 다는게 아니라 다른 사람의 답변을 보면서 공부하는 시간을 가져보려고 합니다~

# Contents

예전에 `Computed Property`와 `Function`을 비교하는 글을 블로그에 올린적이 있다. 

그런데 오늘 

---

**사수** : `Lazy var ` 말고 `Computed Property`를 쓰는게 어때요? 

**나** : 네…? 왜죠? 무슨 이유로… 크흠 

---

## Lazy var 

#### 정의 

**"A lazy stored property is a property whose initial value is not calculated until the first time it is used"**

직역해 보자면, lazy 변수는 처음으로 사용되기 전까지 연산되지 않는다고 하네요.. 

#### 기본적인 선언 방식 

```swift
private let _sampleProperty: Int = 15
lazy var sampleProperty: Int = {
  return self._sampleProperty
}()
```

#### 특징

* `lazy` 변수 `sampleProperty`는 직접 변수가 사용되기 전까지 연산되지 않는다. 
* 그래서 변수를 선언할 때 `self`를 이용할 수 있다. ( 일반적으로 `property`를 선언할 때 자기 자신 클래스의 `property`를 사용할 수 없다.)
* 반드시 `var`와 함께 쓰여야 한다. 

처음에 클래스가 생성될 때 초기값이 없고 그 이후에 값이 결정되기 때문에 기본적으로 `var`로 선언되어야 한다. 

* `struct`와 `class`에서만 사용할 수 있다. 



## Computed Property

#### 정의 

***" computed properties*, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly "**

직역해보자면, 저장소가 아니라 `getter`를 제공하고 선택적으로 `setter`를 제공하는 변수라고 하네요… 

#### 기본적인 선언방식

```swift
private var _computedProperty: Int = 15
var computedProperty: Int {
  get {
    return self._computedProperty
  }
  set {
    self._computedProperty + newValue 
  }
}
```



```swift
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
```

위의 예시는 공식 document에서 가져왔습니다. 

#### 특징

* `get`은 필수적이지만, `set`은 선택적이다. 

그래서 `Computed Property`를 사용하면 var로 선언해야 하지만, `setter`를 선언하지 않으면, `let`처럼 사용할 수 있다.

* `Computed Property` 자체는 저장소가 아니다.

 그렇기 때문에 해당 변수를 이용해 새롭게 저장할 저장소가 따로 필요하다



## 여담

사수는 구지 property로 사용하지 않아도 되서 연산프로퍼티를 사용하라고 했던 것 같다. 

반드시 `lazy`를 쓰거나 `computed property`를 사용해야 하는 것은 아니다. 

상황에 맞게 필요에 따라 선택해서 사용하도록 하자. 

> [참고자료1 - 이동건의 이유있는 코드 ](https://baked-corn.tistory.com/45)
>
> [참고자료2 - ZeddiOS]()

