# 20180704_day16

### HTML이 브라우저에 렌더링 되는 과정

- [참고문서](https://d2.naver.com/helloworld/59361)

### Javascript

- HTML과 CSS는 우리가 만든 view를 조금 더 깔끔하게, 직관적으로 만들어주었지만 동적으로 HTML Dom을 추가하거나 수정, 삭제하는 등의 동적인 부분을 표현하기엔 부족했다. HTML과 CSS, 그리고 JS를 통해 완벽해진 view를 만들어보자.
- 자바스크립트는 HTML, CSS와 마찬가지로 무언가를 설치할 필요없이 브라우저에서 바로 동작한다. 브라우저의 콘솔에서 여러가지 자바스크립트 요소에 대해 알아보자.

#### 요소 선택자

- 프론트에서의 기본 자바스크립트는 3가지만 알고 있으면 된다. 요소, 이벤트, 함수. 요소는 특정 HTML 요소를 찾아내는 선택자로 찾을 수 있고, 이벤트는 사용자가 사이트에서 하는 모든 행동을 담을 수 있다. 함수는 개발자가 정의한 특정 로직을 의미한다.

```javascript
// 요소 선택자
// document에는 사용자가 서버로부터 받아온 모든 HTML의 내용이 담겨있다.
document.getElementById('id') // id를 가진 하나의 요소를 찾는다. return 값은 요소 1개
document.getElementsByClassName('class') // class를 가진 요소를 찾는다. return 값은 배열형태
document.getElementsByTagName('tag') // HTML태그를 모두 찾는다. return 값은 배열형태
document.querySelector('css선택자') // css선택자로 요소를 찾는다. return 값은 요소 1개
document.querySelectorAll('css선택자') // css선택자로 요소를 찾는다. return 값은 배열형태
```



#### 변수

- 이렇게 선택한 요소나 기타 내용들을 변수에 담아서 사용할 수 있다. 자바스크립트에서 변수는 형태를 지정하지 않고 `var`를 이용하여 변수를 선언한다(ES5 기준)

```javascript
var a = 10;
var b = "힘내요";
var c = true;
```



#### Console

- 크롬 브라우저의 개발자 도구에 보면 console 탭이 있다. 이 console 탭에서는 많은 메시지를 보고 자바스크립트를 동작시킬 수 있으며, 이 부분은 자바스크립트에서 console 객체로 조작할 수 있다.

```javascript
console.log("done");
console.error("error");
console.dir(abc);
```



#### 이벤트

- 이벤트는 브라우저에서 일어나는 사건 혹은 행위를 의미한다. 사용자의 클릭, 스크롤, 드래그, 마우스 이동 등 다양한 이벤트가 일어난다. 자바스크립트에서는 해당 이벤트를 감지하고 이벤트를 감지했을 때 특정 결과를 만들어내게 끔 할 수 있다.
- 이벤트의 종류는 매우 다양해서 모두 다 살펴볼 순 없지만 주요한 이벤트들만 우선 살펴보자

```javascript
var btn = document.getElementsByTagName('button')[0];
console.dir(btn);
```

- 해당 내용을 콘솔에 출력해보면 많은 속성들을 가진 것을 볼 수 있는데, 그중에서 on이 붙어있는 모든 속성이 이벤트에 해당한다.



#### 이벤트 리스너

- 요소에 이벤트가 발생했을 때, 해당 이벤트가 발생했는지 감지하는 것을 이벤트 리스너라고 한다. 만약 `버튼을 클릭하다.` 라고 했을 때, `버튼`은 요소가 되고 `클릭하다`는 이벤트가 된다. 이벤트 리스너는 `버튼을 클릭했을 때`를 감지한다고 할 수 있겠다.
- 요소에 이벤트 리스너를 추가하는 방법에는 두가지가 있다. 

```javascript
btn.onclick = function() {
    ...
};
btn.addEventListener('click', function() {
    ...
})
```

- 함수에 대해서는 차차 이야기 하겠지만 `function() {}` 부분이 바로 자바스크립트 함수에 해당한다.



#### 함수

- 자바스크립트 함수는 기본적인 블록중에 하나이며, 작업을 수행하거나 값을 계산하는 등의 일종의 절차이다. 다시말해 레일즈에서 활용하던 액션에 해당한다고 보면 편할 것이다. 함수를 사용하려면  함수에서 동작하고자 하는 내용을 적어야 하는데 함수의 정의는 호출하고자 하는 범위 내에서 선언되어 있어야 한다.
- 자바스크립트 함수를 만드는 방법은 다음과 같다.

```javascript
var func1 = function() {
    ...
} // 함수 표현식
function fuc2() {
    ...
} // 함수 선언식
// 이외에 익명함수로도 선언할 수 있다.
```

- 두 선언방식의 차이는 함수 표현식은  선언되기 이전에 사용할 수 없고, 함수 선언식은 선언되기 이전에도 사용할 수 있다. (동작 방식이나, 호이스팅에 대한 설명은 [참고자료](https://developer.mozilla.org/ko/docs/Glossary/Hoisting)로 대체함)
- 함수를 실행할 때에는 다음과 같이 할 수 있다.

```javascript
func1();
func2();
```



#### 이벤트 핸들러

- 이벤트 리스너를 학습하면서 이벤트가 발생했을 경우 동작하는 함수를 지정했다. 이렇게 이벤트가 발생했을 때 해당 이벤트를 처리하는 함수를 이벤트 핸들러라고 한다. 최종적으로 우리가 만들 `버튼을 클릭했을 때 alert 창을 뜨게한다.` 와 같은 내용을 다시 정의해보면 `버튼(요소)을 클릭(이벤트)했을 때(이벤트 리스너), alert 창을 뜨게한다(이벤트 핸들러)` 의 형태로 보면 되겠다.

```javascript
var btn = document.getElementsByTagName('button')[0];
btn.onclick = function() {
    alert("하위~1");
}
btn.addEventListener('click', function() {
    alert("하위~2");
});
```



