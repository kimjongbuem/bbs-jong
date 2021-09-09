![6](https://user-images.githubusercontent.com/42004058/132686342-04addd53-5a5d-40fb-b4c6-378a8cef330f.JPG)
![7](https://user-images.githubusercontent.com/42004058/132686350-d466c894-3f73-4f69-8cf6-95eb089742a9.JPG)
![8](https://user-images.githubusercontent.com/42004058/132686353-9bd78567-07e1-4f2f-89fc-5524267c9760.JPG)
#BBS Project.

개발환경)

운영체제                : Window10
통합개발환경            : eclipse (Web-Project jsp)
언어                   : java, html, css, (jsp), javascript
라이브러리 및 프레임워크 : Spring boot, Spring, EgovFramework, jquery, junit, rombok, tiles, gson, bootStrap....
서버                    : tomcat

**********************************************************************************************************************************************

개발내용)

회원가입을 통한 아이디 생성과 로그인을 통해, 게시판을 read, write, delete의 권한을 가질 수 있습니다.
DB에 있는 아이디를 통해 메인 화면에 들어가며, 자신의 게시물이 아닌 다른 사람의 게시물에 좋아요/싫어요를 넣을 수 있습니다.
ajax를 사용해 보다 DB에 유연한 웹을 만들었습니다.


**********************************************************************************************************************************************

설계내용)

기존의 MVC(model, view ,controller) 모델을 채택했고, 간단한 웹사이트이기에 한 컨트롤러에 대부분의 함수를 넣었습니다.
그리고 웹 사이트의 핵심으로 생각하는 타일즈 세팅을 적용하여 상,중,하단의 구분을 확실히 했습니다.

% javascipt의 jquery를 써보기 위해, 애니메이트 과정또한 함수로 만들어 추가 해봤습니다.
% mybatis를 통해 유연한 sql문을 작성할 수 있습니다.


**
DB 설정이나 경로 설정)


