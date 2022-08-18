DROP DATABASE IF EXISTS sb_c_2022_2nd;
CREATE DATABASE sb_c_2022_2nd;
USE sb_c_2022_2nd;

CREATE TABLE article (
id INT (10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
title CHAR(100) NOT NULL,
`body` TEXT NOT NULL
);

INSERT INTO article SET 
regDate = NOW(),
updateDate = NOW(),
title = '제목 1',
`body` = '내용 1';

INSERT INTO article SET 
regDate = NOW(),
updateDate = NOW(),
title = '제목 2',
`body` = '내용 2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 3',
`body` = '내용 3';

SELECT * FROM article;

#맴버 테이브 생성
CREATE TABLE `member` (
id INT (10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
loginId CHAR(20) NOT NULL,
loginPw CHAR(60) NOT NULL,
authLevel SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '(3=일반,7==관리자)',
`name` CHAR(20) NOT NULL,
nickname CHAR(20) NOT NULL,
cellphoneNo CHAR(20) NOT NULL,
email CHAR(50) NOT NULL,
delStatus TINYINT (1) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전 ,1=탈퇴)',
delDate DATETIME COMMENT'탈퇴날짜'
);

INSERT INTO `member`
SET 
regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
authLevel = 7,
`name` ='관리자',
nickname ='관리자',
cellphoneNo ='01000000000',
email = 'lhs12002@naver.com';


INSERT INTO `member`
SET 
regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` ='유저1',
nickname ='유저1',
cellphoneNo ='01000000000',
email = 'lhs12002@naver.com';


INSERT INTO `member`
SET 
regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` ='유저2',
nickname ='유저2',
cellphoneNo ='01000000000',
email = 'lhs12002@naver.com';


SELECT * FROM `member`; 

#게시물 테이블에 화원정보 추가

ALTER TABLE article ADD COLUMN memberId INT (10) UNSIGNED NOT NULL AFTER `updateDate`;

DESC article;

# 기존 게시물에 작성자를 2번 호로 지정
UPDATE article 
SET memberId = 2
WHERE memberId = 0;

#게시판 테이블 생성
CREATE TABLE Board(
id INT (10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
`code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice (공지사항),free1(자유게시판1),free2(자유게시판2)..',
`name` CHAR(50) NOT NULL UNIQUE COMMENT '게시판 이름',
delStatus TINYINT (1) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '삭제여부(0=탈퇴전 ,1=탈퇴)',
delDate DATETIME COMMENT'삭제날짜'
);

DESC BOARD;

#게시판 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'notice',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'free1',
`name` = '자유';

# 게시판 테이블에 boardId 칼럼 추가
ALTER TABLE article ADD COLUMN boardId INT (10) UNSIGNED NOT NULL AFTER memberId;


# 게시판에 강제로 게시판 정보 넣기
UPDATE article
SET boardId =1
WHERE id IN (1,2);

UPDATE article
SET boardId =2
WHERE id IN (3);

SELECT * FROM article;

SELECT * FROM board WHERE id = 1;

# 게시물 늘기기
 INSERT INTO article 
 (
 regDate,updateDate,memberId,boardId,title,`body`
 )
 SELECT NOW(),NOW(),FLOOR(RAND() * 2 ) + 1,FLOOR(RAND() * 2 ) + 1,
 CONCAT(#'제목_',RAND()),CONCAT('내용_',RAND()) 
 '제목_',FLOOR(RAND()*100)+ 1),CONCAT('내용_',FLOOR(RAND()*100)+ 1)
 FROM article;

#게시물 테이블 hitCount 칼럼 추가
ALTER TABLE article 
ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0;

DESC article;

SELECT COUNT(*) FROM article;