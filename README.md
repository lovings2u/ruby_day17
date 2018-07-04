# 20180704_Day17

### Javascript & jQuery

```javascript
// 버튼(요소)에 마우스를 오버(이벤트) 했더니(이벤트 리스너)
// 그 위에있던 글자(요소)들이 갑자기 이상한 글자로 변해버린다(이벤트 핸들러).
// var index = 1;
// var text = document.getElementsByClassName("card-title")[index].innerText;
// var btn = document.getElementsByClassName("btn")[index];

// btn.addEventListener("mouseover", function() {
//   var title = document.getElementsByClassName("card-title")[index];
//   console.dir(title);
//   title.innerText = "Don't Touch me..";
// });

// btn.addEventListener("mouseout", function() {
//   var title = document.getElementsByClassName("card-title")[index];
//   title.innerText = text;
// })
// 익명함수

// 버튼(요소)에 마우스를 올리면(이벤트, 이벤트 리스너)
// 해당 버튼(요소)의 class가 btn btn-danger로 변함(이벤트 핸들러)
var btn = document.getElementsByClassName("btn")[0];
btn.addEventListener("mouseover", function() {
  btn.setAttribute("class", "btn btn-danger");
})

btn.addEventListener("mouseout", function() {
  btn.setAttribute("class", "btn btn-primary");
})
```

- 코드를 구성할 때 해결하고자 하는 문제를 한번에 해결하는 것이 아니라 단계적 구성이 필요하다. 문제를 세분화하고 해당 문제를 해결하기까지 어떤 과정이 있을지 고민하는 것이 더 나은 코드를 위한 시발점이 될 것 같다. 문제 상황이 주어지면 먼저 키보드부터 누르는 것이 아니라 해당 문제의 시발점과 도착점을 찾고 시발점에서 도착점까지 나아가기 위한 과정을 나열하다보면 그 나열된 항목들이 모두 코드를 짜는 기초가 될 것이다. 만약 나열된 과정조차 어렵다면 그 문제를 더 세분화 해보길 바란다.



### jQuery

- jQuery(요소 선택자, 이벤트 리스너)

```javascript
// $('.btn').이벤트명(이벤트핸들러)
$('.btn').mouseover(function() {
    alert("건드리지마 ㅠㅠ 아프니까 ㅠㅠ");
})
```

- **마우스가 버튼위에 올라갔을때, 버튼에 있는 btn-primary 클래스를 삭제하고 btn-danger 클래스를 준다. 버튼에서 마우스가 내려왔을 때 다시 btn-danger 클래스를 삭제하고 btn-primary클래스를 추가한다.**
- 여러개의 이벤트 등록하기.
- 요소에 class를 넣고 빼는 jQuery function을 찾기.



#### 간단과제

- 텍스트 변환기(오타치는 사람 놀리기)

*index.html*

```html
<textarea id="input" placeholder="변환할 텍스트를 입력해주세요."></textarea>
<button class="translate">바꿔줘</button>
<h3></h3>
```

- input에 들어있는 텍스트 중에서 '관리' -> '고나리', '확인' -> '호가인', '훤하다' -> '허누하다' 의 방식으로 텍스트를 오타로 바꾸는 이벤트 핸들러 작성하기
- https://github.com/e-/Hangul.js 에서 라이브러리를 받아서 자음과 모음을 분리하고, 다시 단어로 합치는 기능 살펴보기
- `String.split('')` : `''`안에 있는 것을 기준으로 문자열을 잘라준다(return type: 배열)
- `Array.join('')` : 배열에 들어있는 내용들을 `''`안에 있는 내용을 기준으로 합쳐줌
- `Array.map(function(el){})` : 배열을 순회하면서 하나의 요소마다 function을 실행시킴(el: 순회하는 각 요소, return type: 새로운 배열)



>1. textarea에 있는 내용물을 가지고 오는 코드
>2. 버튼에 이벤트 리스너(click)를 달아주고, 핸들러에는 1번에서 작성한 코드를 넣는다.
>3. 1번 코드의 결과물을 한글자씩 분해해서 배열로 만들어준다.(split(''))
>4. 3번의 결과 배열에 4번째 요소가 있고 2,3번째 요소가 모음일 경우
>5. 3번째 모음과 4번째 자음을 바꿔준다.
>6. 결과물로 나온 배열을 문자열로 이어준다.('join')
>7. 결과물을 출력해줄 요소를 찾는다.
>8. 요소에 결과물을 출력한다.



#### this 와 $(this)

- 이벤트 핸들러 내에서의 this는 이벤트가 발생하고 있는 바로 그 요소를 나타낸다. javscript를 사용할 때 이 this에 어떤 값이 담기는 가는 매우 중요하다. 반드시 확인하고 넘어가길 바란다.

```javascript
$('.btn').on('mouseover', function() {
    $(this).toggleClass('btn-primary btn-danger');
})
```



###  ajax(Asynchronous JavaScript and XML )

- 에이젝스라고 부르기도 하고, 아약스라고도 불리기도 한다. jQuery를 사용하면 이 ajax를 매우 쉽게 사용할 수 있다. 자바스크립트 ajax에 대해서는 다음 문서를 참고한다.
- [참고1](https://developer.mozilla.org/ko/docs/Web/Guide/AJAX/Getting_Started), [참고2](https://opentutorials.org/course/1375/6843)
- 레일즈에서 ajax를 구성하는 순서는 다음과 같다.

> 1. view.html.erb에서 ajax요청을 만든다.
> 2. ajax요청을 받기 위한 route를 설정한다
> 3. route에서 설정한 컨트롤러#액션을 선언한다.
> 4. 해당 액션의 로직을 수행한 후 응답으로 보낼 js.erb파일을 생성한다. 여기서 js파일명은 액션명과 일치하는 것을 원칙으로 한다.

*app/views/movies/show.html.erb*

```erb
...
<button class="btn btn-info like">좋아요</button>
<script>
$(document).on('ready', function() {
    $('.like').on('click', function() {
        console.log("like!!!");
        $.ajax({
           url: '/likes/<%= @movie.id %>' 
        });
    })
});
</script>
```

*config/routes.rb*

```ruby
...
    get '/likes/:movie_id' => 'movies#like_movie'
...
```

*app/controllers/movies_controller.rb*

```ruby
...
  def like_movie
    p params
    # 현재 유저와 params에 담긴 movie간의 
    # 좋아요 관계를 설정한다. 끗
    @like = Like.where(user_id: current_user.id, movie_id: params[:movie_id]).first
    if @like.nil?
      @like = Like.create(user_id: current_user.id, movie_id: params[:movie_id])
    else
      @like.destroy
    end
    # 만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    # 해당 Like 인스턴스 삭제
    # 새로 누른 경우
    # 좋아요 관계 설정
  end
...
```

*app/views/movies/like_movie.js.erb*

```erb
alert("좋아요 설정됐쩡");
$('.like').text("좋아요 취소").toggleClass("btn-warning btn-info text-white");
// 해당 부분은 과제임
if(<%= @like.frozen? %>) {
// 좋아요가 취소된 경우
// 좋아요 취소버튼 -> 좋아요 버튼
} else {
// 좋아요가 새로 눌린 경우
// 좋아요 버튼 -> 좋아요 취소
}
```

