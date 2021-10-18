# JSP SemiProject 'Petmu'

## [최종보고서 링크] <!-- 추후 링크 첨부 -->
* 프로젝트 명 : 펫뮤(Petmu)

* 프로젝트 기간 : 2021-10-05 ~ 2021-10-15

* 직책 : 팀원

* 프로젝트 설명

  - MVC model2(MVC 패턴) 기반으로 한 웹 페이지
  - 반려동물 보호자들이 필요한 정보들을 얻을 수 있고, 공유할 수 있는 이용자 친화적인 커뮤니티 사이트
  - 회원가입, 게시판마다 CRUD 적용
  - AJAX, 외부 API(Kakao map API, Daum Postcode API)등 다양한 기술을 활용한 프로젝트
  
* 구현 기능

  - 인트로, 인덱스
  - 회원가입, 로그인, ID·PW 찾기, 마이페이지, 회원정보 수정, 회원탈퇴
  - 우리동네 동물병원(DB등록과 map API를 이용한 주변 병원 조회)
  - 후기·정보 게시판 / 자유게시판 (게시글 CRUD, 게시글 추천, 댓글 CRUD, 게시판 내 검색, 게시글 정렬)
  - 사진게시판 (게시글 CRUD, 게시글 추천, 댓글 CRUD, 게시판 내 검색, 게시글 정렬, 이미지 슬라이드)
  
* 사용기술 및 개발 환경

  - OS : Windows 10, MacOS
  - Developer-Tool : 
      VSCode / Eclipse / SQLDeveloper
  - Front-End : 
      HTML5 / CSS3 / JavaScript (ES8) / jQuery
  - Back-End :
      Java EE 11 / Oracle DBMS 11G R2(XE) / apache-tomcat 8.5
  - version control tools : 
      Egit (Eclipse Git) / GitHub

* 역할

  - 홈페이지 인트로
  - 자유게시판
  - 사진게시판

## 구현기능 및 기능설명
* 홈페이지 인트로 
![intro](https://user-images.githubusercontent.com/91815909/137675876-0021a8a3-ebbd-4add-b954-ebc6c4e70c26.gif)

* 자유게시판 목록
![freeBoard1](https://user-images.githubusercontent.com/91815909/137676819-22fe0d97-b5b6-4947-a13f-9cc9dac40f96.png)

![cmtCount](https://user-images.githubusercontent.com/91815909/137681486-7b0dd9d8-376f-47f4-b835-2545039f7864.gif)
**제목 옆에 댓글수 표시 <br>
Board 테이블에 댓글수를 담는 컬럼 추가, 해당 게시글의 게시글 번호와 댓글이 가진 게시글 번호가 일치하는 댓글의 수를 ccount에 담음. <br><br>
댓글 추가,삭제 시 목록에 표시된 댓글수에 반영 <br>
댓글을 추가하고, 삭제할 때 게시글 번호를 포함해 servlet으로 전달하고, 댓글이 추가되면 ccount가 +1, 삭제되면 -1이 되는 쿼리문을 이용**
```
#게시글 댓글 수 + 1
updateCmtCount = UPDATE BOARD SET CCOUNT = CCOUNT + 1 WHERE BNO = ?

#게시글 댓글 수 - 1
minusCmtCount = UPDATE BOARD SET CCOUNT = CCOUNT - 1 WHERE BNO = ?
```

![freeBoard2](https://user-images.githubusercontent.com/91815909/137678715-12e54557-ecfe-4c06-9036-4498bc3b015d.png)
**게시판 내 검색 기능 <br>
select, option 태그를 이용해서 검색창을 만들고 js를 이용해 검색 option과 input의 value 값을 servlet으로 전달 <br>
제목,아이디,닉네임으로 조회했을 때 맞는 게시글을 조회하는 쿼리문을 이용 <br>
삼항연산자와 selected를 이용해 검색 후 옵션값이 초기화되지않게 함**
```
<select id="searchTarget" name="searchTarget">
	<option ${(param.searchTarget == "title") ? "selected" : " " } value="title">제목</option>
	<option ${(param.searchTarget == "writerId") ? "selected" : " " } value="writerId">아이디</option>
	<option ${(param.searchTarget == "writerNick") ? "selected" : " " } value="writerNick">닉네임</option>
</select> &nbsp; 
	<input id="bsearch" type="text" name="bsearch" value="${param.keyword}"
				placeholder="검색어를 입력해주세요" /> &nbsp; 
	<input id="searchBtn" type="button" value="검색" onclick="search();" />
```
* 자유게시판 CRUD<br>
![게시판crud](https://user-images.githubusercontent.com/91815909/137678379-728906df-f566-4d4d-a617-d0a110021a77.gif)
**게시글 등록 시 파일첨부를 할 수 있도록 multipart form 사용**
```
String root = request.getServletContext().getRealPath("/");
String savePath = root + "resources/boardUploadFiles";
		

MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
String bwriterId = mre.getParameter("bwriterId");
String bwriterNick = mre.getParameter("bwriterNick");
String btitle = mre.getParameter("btitle");
String bcontent = mre.getParameter("bcontent");
		
String filename = mre.getFilesystemName("bfile");
		
freeBoard fb = new freeBoard(bwriterId, bwriterNick, btitle, bcontent, filename);
```
