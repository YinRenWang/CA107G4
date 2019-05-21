--------------------------------------------------------------------------------------------------------
alter session set deferred_segment_creation=false;

DROP TABLE GoodsReport;
DROP SEQUENCE GoodsReport_seq;

DROP TABLE GoodsMessage;
DROP SEQUENCE GoodsMessage_seq;

DROP TABLE GoodsLike;

DROP TABLE GoodsDetails;

DROP TABLE GoodsOrder;
DROP SEQUENCE GoodsOrder_seq;

DROP TABLE Goods;
DROP SEQUENCE Goods_seq;

--

DROP TABLE WITHDRAWALRECORD;
DROP SEQUENCE WITHDRAWALRECORD_seq;

DROP TABLE FRIENDNEXUS;

DROP TABLE FriendChatHistory;

DROP TABLE JOINGROUP;

DROP TABLE SCORPIONCHATRECORD;
DROP SEQUENCE SCORPIONCHATRECORD_seq;

--

DROP TABLE LiveStream;
DROP SEQUENCE LiveStream_seq;

DROP TABLE CourseTransferComment;
DROP SEQUENCE CourseTransferComment_seq;

DROP TABLE CourseTransfer;
DROP SEQUENCE CourseTransfer_seq;

DROP TABLE CourseReservation;
DROP SEQUENCE CourseReservation_seq;

DROP TABLE Team;
DROP SEQUENCE Team_seq;

DROP TABLE Advertisement;                     
DROP SEQUENCE Advertisement_seq;

DROP TABLE MemberCoupon;       

DROP TABLE Coupon;                      

DROP TABLE CourseReport;                    
DROP SEQUENCE CourseReport_seq;

DROP TABLE CourseLike;                   

DROP TABLE CourseComment;                 
DROP SEQUENCE CourseComment_seq;

DROP TABLE InsCourseTime;
DROP SEQUENCE InsCourseTime_seq;

DROP TABLE InsCourse;                      
DROP SEQUENCE InsCourse_seq;

DROP TABLE Teacher;                      
DROP SEQUENCE Teacher_seq;           

DROP TABLE Member;                    

DROP TABLE Course;                           
DROP SEQUENCE Course_seq;

DROP TABLE CourseType;                 
DROP SEQUENCE CourseType_seq;             

DROP TABLE Administrator;             

--管理員--

CREATE TABLE Administrator (
admId            VARCHAR2(10) NOT NULL,
admPsw           VARCHAR2(10) NOT NULL,
admStatus        NUMBER(1) NOT NULL,
CONSTRAINT admId_PRIMARY_KEY PRIMARY KEY (admId));

COMMENT ON COLUMN Administrator.admStatus IS '0=在職,1=離職';

INSERT INTO Administrator VALUES ('root','root','0');
INSERT INTO Administrator VALUES ('founder','founder','1');

--課程大類--

CREATE TABLE CourseType (
courseTypeId              NUMBER(2) NOT NULL,
courseTypeName            VARCHAR2(20) NOT NULL,
CONSTRAINT CourseType_PRIMARY_KEY PRIMARY KEY (courseTypeId));
	 
CREATE SEQUENCE CourseType_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'音樂');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'語言');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'運動');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'藝術');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'設計');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'人文');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'行銷');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'程式語言');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'投資理財');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'職場技能');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'手作');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'烹飪');

--課程種類--

CREATE TABLE Course (
courseId            VARCHAR2(4) NOT NULL,
courseTypeId        NUMBER(2) NOT NULL,
courseName          VARCHAR2(20) NOT NULL,


CONSTRAINT Course_courseId_FK FOREIGN KEY (courseTypeId) REFERENCES CourseType (courseTypeId),
CONSTRAINT Course_courseId_PK PRIMARY KEY (courseId));
 
CREATE SEQUENCE Course_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','貝斯');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','吉他');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','英文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','中文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Java');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Andriod');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','SQL');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','甜品');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','烘焙');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','鋼琴');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','唱歌');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','喇叭');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','日文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','韓文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','法文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','泰文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','越南文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','印度文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','義大利文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','西班牙文');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','籃球');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','拳擊');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','跑步');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','體操');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','高爾夫球');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','芭雷舞');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','魔術表演');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','演戲');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','舞蹈');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','演說');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','網頁設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','應用設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','平面設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','室內設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','設計理論');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'06','文學');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'06','社會科學');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','C++');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','C');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Ruby');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Python');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','jQuery');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','亞洲料理');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','蛋糕裝飾');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','烹調');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','法國料理');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Servlet');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','笑話');


--會員--

CREATE TABLE Member (
memId        VarChar2(20) NOT NULL, 
memSkill     VarChar2(4) ,
memWantSkill VarChar2(4) ,
memPair	     VarChar2(20), 
memIdCard    VARCHAR2(10) NOT NULL UNIQUE,
memPsw       VARCHAR2(20) NOT NULL,
memPswHint   VARCHAR2(20) NOT NULL,
memName      VARCHAR2(20) NOT NULL,
memSex       NUMBER(1) NOT NULL, 
memImage     BLOB,
memEmail     VARCHAR2(50) NOT NULL,
memPhone     VARCHAR2(10) NOT NULL,
memBirth     DATE ,
memAdd       VARCHAR2(100) NOT NULL,
memText      CLOB ,
memBank      VARCHAR2(20) ,
memBalance   NUMBER(10) NOT NULL,
memBlock     NUMBER(10) NOT NULL,
memStatus    NUMBER(1) NOT NULL,


CONSTRAINT Member_memSkill_FK FOREIGN KEY (memSkill) REFERENCES Course (courseId),
CONSTRAINT Member_memWantSkill_FK FOREIGN KEY (memWantSkill) REFERENCES Course (courseId),
CONSTRAINT Member_memPair_FK FOREIGN KEY (memPair) REFERENCES Member (memId),
CONSTRAINT Member_memId_PK PRIMARY KEY (memId));

COMMENT ON COLUMN Member.memSex IS '0=男性,1=女性';
COMMENT ON COLUMN Member.memStatus IS '0=待驗證,1=已驗證';

INSERT INTO MEMBER VALUES ('we01', '0005', '0008', NULL, 'S143766692', '1234', 'memPswHint', '肥嘟嘟左衛門', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1995-11-23', 'YYYY-MM-DD'), '桃園市中壢區中大路300號15樓', '你回來了', '004116004056492', '1000', '0', '1');
INSERT INTO MEMBER VALUES ('we02', '0008', '0005', NULL,'Q252488683', '1234', 'memPswHint', '野原美冴', '1', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1985-04-30', 'YYYY-MM-DD'), '台北市信義區信義路四段415號6樓', '今年32歲平胸', '00731350235011', '5000', '0', '1');
INSERT INTO MEMBER VALUES ('we03', '0004', '0009', NULL,'B287381891', '1234', 'memPswHint', '野原廣志', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1989-06-15', 'YYYY-MM-DD'), '台北市松山區八德路四段520號', '我家的的房子還有32年的貸款', '08545080687111', '15000', '0', '1');
INSERT INTO MEMBER VALUES ('we04', '0006', '0005', NULL,'A167464958', '1234', 'memPswHint', '野原向日葵', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1987-07-12', 'YYYY-MM-DD'), '台北市大安區復興南路一段390號', '我是頭上有閃電', '80885744387461', '1000', '0', '1');
INSERT INTO MEMBER VALUES ('we05', '0001', '0004',NULL, 'A227604096', '1234', 'memPswHint', '野原小白', '1', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1999-12-23', 'YYYY-MM-DD'), '台北市萬華區中華路一段152號3樓 2,3,15樓', '旺旺', '00314637967473', '5000', '20000', '1');
INSERT INTO MEMBER VALUES ('we06', '0002', '0003',NULL,'A278318487', '1234', 'memPswHint', '風間徹', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1989-06-30', 'YYYY-MM-DD'), '桃園市中壢區元化路306號', '呀呀', '007467579675323', '10000', '0', '1');
INSERT INTO MEMBER VALUES ('we07', '0006', '0043',NULL,'A110133151', '1234', 'memPswHint', '櫻田妮妮', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1995-05-23', 'YYYY-MM-DD'), '新北市汐止區新台五路一段162號', '想被兔兔揍嗎', '0074634679675323', '100500', '0', '1');
INSERT INTO MEMBER VALUES ('we08', '0006', '0042',NULL,'A171253918', '1234', 'memPswHint', '佐藤正男', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1970-04-21', 'YYYY-MM-DD'), '台北市士林區中山北路六段77號', '哦....我不要', '00814587102364', '59170000', '0', '1');
INSERT INTO MEMBER VALUES ('we09', '0005', '0008', NULL, 'A160539050','1234', 'memPswHint', '阿呆', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1995-11-23', 'YYYY-MM-DD'), '桃園市中壢區中大路300號15樓', '呆~', '004116004056492', '10000', '20000', '1');
INSERT INTO MEMBER VALUES ('we10', '0042', '0031',NULL,'A208165369', '1234', 'memPswHint', '園長先生', '0', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1970-04-21', 'YYYY-MM-DD'), '桃園市中壢區元化路357號', '燒殺擄掠......這樣了不了解??', '80012587430149', '10000', '0', '1');
INSERT INTO MEMBER VALUES ('we11', '0046', '0004',NULL,'A284110068', '1234', 'memPswHint', '吉永老師', '1', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1970-04-21', 'YYYY-MM-DD'), '台積電先進封測三廠(龍潭廠) 桃園市龍潭區龍園六路101號', '我已故的奶奶都可以做得比你好:)', '00814587102364', '5000', '0', '1');
INSERT INTO MEMBER VALUES ('we12', '0021', '0012',NULL,'J299315564', '1234', 'memPswHint', '松坂老師', '1', null, 'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1985-06-15', 'YYYY-MM-DD'), '台北市信義區信義路五段7號台北101大樓', '姆斯什麼都會...教練也會', '00765891234751', '594740', '0', '1');
INSERT INTO MEMBER VALUES ('we13', '0008', '0027',NULL,'J219495269', '1234', 'memPswHint', '動感超人', '0', null,'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1966-06-15', 'YYYY-MM-DD'), '台北市士林區中大路300號', '動感光波~', '00785641239874', '0', '0', '1');
INSERT INTO MEMBER VALUES ('david', '0011', '0002',NULL,'J219495268', '1234', 'memPswHint', '風間大衛', '0', null,'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1966-06-15', 'YYYY-MM-DD'), '台北市汐止區中大路300號', '同學可以參考一下', '00785643239874', '0', '0', '1');
INSERT INTO MEMBER VALUES ('peter', '0022', '0042',NULL,'J219495267', '1234', 'memPswHint', '野原大吳', '0', null,'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1966-06-15', 'YYYY-MM-DD'), '桃園市中壢區中大路300號', 'Hibernate是簡單的，講清楚都不難', '00785641239974', '0', '0', '1');
INSERT INTO MEMBER VALUES ('west', '0011', '0002',NULL,'J219495266', '1234', 'memPswHint', '野原偉斯特', '0', null,'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1966-06-15', 'YYYY-MM-DD'), '桃園市中壢區中大路300號', '感恩SeaFood讚嘆SeaFood', '00785655239874', '1000000', '0', '1');
INSERT INTO MEMBER VALUES ('gods', '0011', '0002',NULL,'J219495265', '1234', 'memPswHint', '松坂仲儀', '0', null,'n1036434@ntub.edu.tw', '0970313604', TO_DATE('1966-06-15', 'YYYY-MM-DD'), '桃園市中壢區中大路300號', '藤正可不可以搞清楚狀況', '00788841239874', '0', '0', '1');
CREATE TABLE Teacher (
teacherId       VARCHAR2(7) NOT NULL,
memId           VARCHAR2(20) NOT NULL, 
teacherStatus   NUMBER(1) NOT NULL,
teacherCity     VARCHAR2(100) NOT NULL,
teacherEDU      VARCHAR2(50) NOT NULL,
diplomaImg      BLOB,
teacherText     CLOB,

CONSTRAINT Teacher_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT Teacher_teacherId_PK PRIMARY KEY (teacherId));

COMMENT ON COLUMN Teacher.teacherStatus IS '0=待審核,1=已審核,2=停權中';
 
CREATE SEQUENCE Teacher_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'we10','1','桃園市中壢區','國立臺北商業大學資管系',null,'我黑道ㄟ，想怎樣?');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'we11','1','桃園市龍潭區','國立中央大學‎資訊工程學系',null,'老師人很好的');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'we12','1','台北市信義區','Tibame桃園中壢資策會',null,'感恩SeaFood讚嘆SeaFood');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'we02','1','台北市士林區','Tibame桃園中壢資策會',null,'萬般皆物件');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'david','1','桃園市中壢區','Tibame桃園中壢資策會',null,'我是海鮮，一個自由的海鮮');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'peter','1','桃園市中壢區','Tibame桃園中壢資策會',null,'紙上得來終覺淺，絕知此事必躬行');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'west','1','桃園市中壢區','北一女中',null,'JavaScript，阿不就是先宣告String');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'gods','1','桃園市中壢區','美國普林斯頓',null,'神愛世人');

--課程--

CREATE TABLE InsCourse (
inscId          VARCHAR2(7) NOT NULL,
teacherId       VARCHAR2(7) NOT NULL,
courseId        VARCHAR2(4) NOT NULL,
inscLoc         VARCHAR2(100) NOT NULL,
inscType        NUMBER(1) NOT NULL,
inscPeople      NUMBER(2),
inscLang        VARCHAR2(100) NOT NULL,
inscPrice       NUMBER(10) NOT NULL,
inscCourser     CLOB,
inscStatus      NUMBER(1) NOT NULL,


CONSTRAINT InsCourse_teacherId_FK FOREIGN KEY (teacherId) REFERENCES Teacher (teacherId),
CONSTRAINT InsCourse_courseId_FK FOREIGN KEY (courseId) REFERENCES Course (courseId),
CONSTRAINT InsCourse_inscId_PK PRIMARY KEY (inscId));

COMMENT ON COLUMN insCourse.inscType IS '0=個人課程,1=團體課程';
COMMENT ON COLUMN insCourse.inscStatus IS '0=上架,1=下架';
 
CREATE SEQUENCE InsCourse_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00001','0014','桃園市中壢區','0','1','中文','600','안녕하세요.','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00002','0008','桃園市龍潭區','1','4','英文','300','製作抹茶奶凍捲,學習重點 - 難度較高、舒芙蕾般軟嫩的蛋糕體學習 - 抹茶甘納許的製作 - 日式口味的紅豆奶油餡','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00003','0010','台北市信義區','1','23','中文','500','緊來緊來緊來，倒笨叟','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00004','0045','台北市士林區','0','1','法文','1200','普羅旺斯燉菜（Ratatouille）源於尼斯（Nice），完整名稱是尼斯燉菜（Ratatouille niçoise），不過環地中海區皆有類似以當地時蔬燉煮的菜色。這道菜冷熱食皆可（隔夜吃滋味尤佳），當主菜、配菜、做醬或拌義大利麵都得宜，可說是煮婦煮夫的百用料理。','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00005','0006','桃園市中壢區','0','1','中文','600','Android 是簡單的，萬般皆Java','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00006','0047','桃園市中壢區','0','1','中文','3000','宣告，取值，吃500','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00007','0026','桃園市中壢區','0','1','中文','600','旋轉跳躍，我閉著眼','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00008','0043','桃園市中壢區','0','1','中文','900','晚餐不知道要吃什麼嗎？快來試試日本近年正流行的鍋物料理【站高高蔥牛火鍋（スタンディングねぎ鍋）】吧！滿滿的牛肉片與蔬菜襯著高湯在鍋內煮得冒泡，這誘人的畫面不管什麼天氣都讓人食指大動～既然取名叫蔥牛鍋，顧名思義就是要有蔥跟牛肉，把翠綠的蔥段插在鍋子中央，周圍鋪上滿滿的牛肉片固定，之後加入高湯加熱直到肉片變成粉嫩嫩的半熟色澤就可以開動囉！如果擔心吃不過癮，還可以額外放入蔬菜與豆腐等配料，吃起來飽足又健康。','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00001','0042','桃園市中壢區','0','1','中文','600','已學過 JavaScript，想學 jQuery 的開發人員','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00002','0025','桃園市龍潭區','0','1','中文','700','高爾夫，又稱高球，高爾夫球，歌爾夫球，高而富球，俗稱小白球，是一種室外體育運動。個人或團體球員以高爾夫球桿將一顆小球打進球洞，使用杆數較少者獲勝。大部份的比賽有9洞或18洞。','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00003','0013','台北市信義區','0','1','中文','300','逃げるは恥だが役に立つ','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00004','0020','台北市士林區','0','1','中文','400','Cómo se dice ‘I love you’ en español','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00005','0012','桃園市中壢區','1','2','中文','600','叭叭叭叭叭叭叭叭叭叭叭叭','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00006','0005','桃園市中壢區','0','1','中文','100','Java是簡單的，要什麼給什麼，萬物皆物件','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00007','0022','桃園市中壢區','0','1','中文','900','吃我一記，天馬流星拳','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00005','0048','桃園市中壢區','0','1','中文','50','我就是個笑話','0');
--課程時間--

CREATE TABLE InsCourseTime (
inscTimeId      VARCHAR2(7) NOT NULL,
inscId          VARCHAR2(7) NOT NULL,
inscMFD 		DATE,
inscEXP         DATE,

CONSTRAINT InsCourseTime_InsCourse_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT InsCourseTime_inscTimeId_PK PRIMARY KEY (inscTimeId));

CREATE SEQUENCE InsCourseTime_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'));


Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 16:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 16:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00016',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00006',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00014',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00007',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));
--課程留言--

CREATE TABLE COURSECOMMENT (
ccID      VARCHAR2(7) NOT NULL,
memId     VARCHAR2(20) NOT NULL,
inscId    VARCHAR2(7) NOT NULL,
ccContent CLOB,

CONSTRAINT COURSECOMMENT_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT COURSECOMMENT_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT COURSECOMMENT_ccId_PK PRIMARY KEY (ccId));

CREATE SEQUENCE COURSECOMMENT_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'we02','IC00001','請問Java真的很簡單.....嗎?');
Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'we02','IC00001','上課前我需要準備什麼嗎?');
Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'we03','IC00002','我笨手笨腳的也可以上手嗎?!');


--課程收藏--

CREATE TABLE CourseLike (
memId    VarChar2(20) NOT NULL, 
inscId    VARCHAR2(7) NOT NULL,

CONSTRAINT Courseave_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT Courseave_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
PRIMARY KEY(memId, inscId));

INSERT INTO CourseLike VALUES ('we03', 'IC00001');
INSERT INTO CourseLike VALUES ('we03', 'IC00002');
INSERT INTO CourseLike VALUES ('we04', 'IC00001');
INSERT INTO CourseLike VALUES ('we01', 'IC00002');
INSERT INTO CourseLike VALUES ('we02', 'IC00001');

--課程檢舉--

CREATE TABLE CourseReport (
crID      VarChar2(7) NOT NULL, 
memId     VarChar2(20) NOT NULL, 
inscId    VarChar2(7) NOT NULL,
crContent CLOB,
crStatus  NUMBER(1) NOT NULL,

CONSTRAINT CourseReport_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT CourseReport_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT CourseReport_crID_PK PRIMARY KEY (crID));

COMMENT ON COLUMN CourseReport.crStatus IS '0=待處理,1=通過,2=不通過';

CREATE SEQUENCE CourseReport_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'we03','IC00001','Java是傳記憶體位址','2');
INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'we04','IC00002','老師根本就不是神力女超人騙人的!!!','0');
INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'we04','IC00002','老師根本就沒有神力啊','1');

--折價券資訊--

CREATE TABLE Coupon (
couponId            VARCHAR2(20) NOT NULL,
couponName          VARCHAR2(100) NOT NULL,
couponDollar        NUMBER(10) NOT NULL,
couponBalance       NUMBER(10) NOT NULL,
couponMFD           Date,
couponEXP           Date,
couponStatus        NUMBER(1) NOT NULL,

CONSTRAINT Coupon_PRIMARY_KEY PRIMARY KEY (couponId));

COMMENT ON COLUMN Coupon.couponStatus IS '0=未上架,1=已上架';

INSERT INTO Coupon VALUES ('FIRSTORDER500','首張訂單折扣500','500','1000',TO_DATE('2019-04-01 ', 'YYYY-MM-DD'),TO_DATE('2019-04-20 ', 'YYYY-MM-DD'),'1');
INSERT INTO Coupon VALUES ('HAPPY10OFFYA','訂單滿1000元享9折優惠','500','1000',TO_DATE('2019-04-02 ', 'YYYY-MM-DD'),TO_DATE('2019-04-22 ', 'YYYY-MM-DD'),'1');

--會員折價券--

CREATE TABLE MemberCoupon (
couponId VARCHAR2(20) NOT NULL, 
memId    VARCHAR2(20) NOT NULL,
mcStatus NUMBER(1) NOT NULL,

CONSTRAINT MemberCoupon_couponId_FK FOREIGN KEY (couponId) REFERENCES Coupon (couponId),
CONSTRAINT MemberCoupon_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
PRIMARY KEY(couponId, memId));

COMMENT ON COLUMN MemberCoupon.mcStatus IS '0=未使用,1=已使用';

INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','we01','1');
INSERT INTO MemberCoupon VALUES ('HAPPY10OFFYA','we01','0');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','we02','0');
INSERT INTO MemberCoupon VALUES ('HAPPY10OFFYA','we02','0');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','we03','1');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','we04','0');

--廣告--

CREATE TABLE Advertisement (
adId    	 VarChar2(7) NOT NULL ,
inscId   	 VarChar(7) NOT NULL ,
adStatus 	 NUMBER(1) NOT NULL,
adMFD 		 Date,
adEXP        Date,
adImg        BLOB,

CONSTRAINT Advertisement_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT Advertisement_ADID_PK PRIMARY KEY (ADID));

COMMENT ON COLUMN Advertisement.adStatus IS '0=未上架,1=已上架';

CREATE SEQUENCE Advertisement_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Advertisement VALUES (('AD'||LPAD(to_char(Advertisement_seq.NEXTVAL), 5, '0')),'IC00001','1',TO_DATE('2019-03-22 12:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-25 12:00', 'YYYY-MM-DD HH24:MI'),null);
INSERT INTO Advertisement VALUES (('AD'||LPAD(to_char(Advertisement_seq.NEXTVAL), 5, '0')),'IC00002','1',TO_DATE('2019-03-22 12:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-25 12:00', 'YYYY-MM-DD HH24:MI'),null);

--揪團--

CREATE TABLE Team (
teamId    VarChar2(7) NOT NULL ,
leaderId  VARCHAR2(20) NOT NULL, 
inscId    VARCHAR2(7) NOT NULL ,
teamMFD   DATE ,
teamEXP   DATE ,
teamStatus NUMBER(1),

CONSTRAINT  Team_leaderId_FK FOREIGN KEY (leaderId) REFERENCES MEMBER (memId),
CONSTRAINT  Team_inscId_FK   FOREIGN KEY (inscId)   REFERENCES INSCOURSE (inscId),
CONSTRAINT  Team_PK PRIMARY KEY (teamId));
COMMENT ON COLUMN Team.teamStatus IS '0=待成團 1=已成團';

CREATE SEQUENCE Team_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
Insert INTO TEAM VALUES (('TM'||LPAD(to_char(Team_seq.NEXTVAL), 5, '0')),'we01','IC00002',TO_DATE('2019-04-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-05-23 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),1);

--課程預約訂單--

CREATE TABLE CourseReservation (
crvId          VarChar2(7) NOT NULL,         
teacherId      VarChar2(7) NOT NULL,  
memId          VarChar2(20) NOT NULL,
inscId         VarChar2(7) NOT NULL,  
teamId         VarChar2(7) ,  
crvStatus      NUMBER(1) NOT NULL, 
classStatus    NUMBER(1) NOT NULL, 
tranStatus     NUMBER(1) NOT NULL, 
crvMFD         DATE, 
crvEXP         DATE,
crvLoc         VARCHAR2(50) NOT NULL, 
crvTotalTime   NUMBER(10) NOT NULL, 
crvTotalPrice  NUMBER(10) NOT NULL, 
crvScore       FLOAT(20) , 
crvRate        CLOB, 

CONSTRAINT CourseReservation_teacherId_FK FOREIGN KEY (teacherId) REFERENCES Teacher (teacherId),
CONSTRAINT CourseReservation_memID_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT CourseReservation_inscID_FK FOREIGN KEY (INSCID) REFERENCES InsCourse(INSCID),
CONSTRAINT CourseReservation_teamId_FK FOREIGN KEY (teamId) REFERENCES Team(teamId),
CONSTRAINT CourseReservation_crvId_PK PRIMARY KEY (crvId));

COMMENT ON COLUMN CourseReservation.crvStatus IS '0=訂單取消,1=訂單正常';
COMMENT ON COLUMN CourseReservation.classStatus IS '0=未上課,1=已上課';
COMMENT ON COLUMN CourseReservation.tranStatus IS '0=未轉讓,1=待轉讓,2=已轉讓';

CREATE SEQUENCE CourseReservation_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','we04','IC00001',null,'1','1','2',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市大安區','2','600',5,'Java真的是簡單的!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','we05','IC00001',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市萬華區','2','600',4.5,'建立我正確的Java人生觀!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','we06','IC00001',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'桃園市中壢區','2','600',4.0,'老師跟金城武一樣帥!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00002','we01','IC00002',null,'1','1','2',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'桃園市中壢區','2','600',4,'老師比甜點還要甜>/<');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00002','we03','IC00002',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市松山區','2','600',4,'So Sweet!!');

--課程轉讓--

CREATE TABLE CourseTransfer (
ctId       VarChar2(7) NOT NULL,
ctBuyer    VarChar2(20),
oldCrvId   VarChar2(7) NOT NULL,
newCrvId   VarChar2(7),
ctDate     Date,
ctPrice    NUMBER(10) NOT NULL,

CONSTRAINT CourseTransfer_ctBuyer_FK FOREIGN KEY (ctBuyer) REFERENCES Member (memId),
CONSTRAINT CourseTransfer_oldCrvId_FK FOREIGN KEY (oldCrvId) REFERENCES CourseReservation(CrvId),
CONSTRAINT CourseTransfer_newCrvId_FK FOREIGN KEY (newCrvId) REFERENCES CourseReservation(CrvId),
CONSTRAINT CourseTransfer_ctId_PK PRIMARY KEY (ctId));

CREATE SEQUENCE CourseTransfer_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseTransfer VALUES ('CT'||LPAD(to_char(CourseTransfer_seq.NEXTVAL),5,'0'),'we02','CR00001','CR00002',TO_DATE('2019-03-22 144942', 'YYYY-MM-DD HH24MISS'),'200');

--課程轉讓留言--

CREATE TABLE CourseTransferComment (
ctcId       VARCHAR2(7) NOT NULL,
ctId        VARCHAR2(7) NOT NULL,
memId       VARCHAR2(20) NOT NULL,
ctcContent  CLOB,

CONSTRAINT CourseTransferComment_memId_FK FOREIGN KEY(memId) REFERENCES Member (memId),
CONSTRAINT CourseTransferComment_ctId_FK FOREIGN KEY(ctId) REFERENCES CourseTransfer (ctId),
CONSTRAINT CourseTransferComment_ctcId_PK PRIMARY KEY(ctcId));

CREATE SEQUENCE CourseTransferComment_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseTransferComment VALUES ('CM'||LPAD(to_char(CourseTransferComment_seq.NEXTVAL),5,'0'),'CT00001','we01','請問還有議價空間嗎');
INSERT INTO CourseTransferComment VALUES ('CM'||LPAD(to_char(CourseTransferComment_seq.NEXTVAL),5,'0'),'CT00001','we02','可以再便宜一點ㄇ?我是學生');

--直播課程--
CREATE TABLE LiveStream(
lsId       VARCHAR2(7) NOT NULL,
teacherId  VARCHAR2(7) NOT NULL,
lsDate     Date,
lsViewNum  Number(20) NOT NULL,
lsContent  BLOB,

CONSTRAINT LiveStream_teacherId_FK FOREIGN KEY(teacherId)REFERENCES Teacher (TeacherId),
CONSTRAINT LiveStream_lsId_PK PRIMARY KEY(lsId));

CREATE SEQUENCE LiveStream_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;


INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00001',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),'5180',null);
INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00002',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),'7642',null);
INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00005',TO_DATE('2019-05-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'245205',null);


--交易紀錄--

CREATE TABLE WITHDRAWALRECORD (	
WRNUM   VARCHAR2(7), 
MEMID  VARCHAR2(20), 
WRMONEY NUMBER, 
WRTIME  DATE,

CONSTRAINT WITHDRAWALRECORD_PK PRIMARY KEY (WRNUM),
CONSTRAINT WITHDRAWALRECORD_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID) );

CREATE SEQUENCE WITHDRAWALRECORD_SEQ  
INCREMENT BY 1				   
START WITH 1				  
NOMAXVALUE					   
NOCYCLE                       
NOCACHE;                       
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'we01','1000',to_date('25-3月-19','DD-MON-RR'));
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'we02','5000',to_date('26-5月-19','DD-MON-RR'));
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'we03','15000',to_date('26-5月-19','DD-MON-RR'));
--好友關係--

CREATE TABLE FRIENDNEXUS ( 
MEMID VARCHAR2(20 BYTE) NOT NULL,         
FRIENDACC VARCHAR2(20 BYTE) NOT NULL, 
FRIENDSTATUS Number(1),
    
CONSTRAINT FRIENDNEXUS_PK PRIMARY KEY (MEMID , FRIENDACC ),
CONSTRAINT FRIENDNEXUS_FRIENDACC_FK FOREIGN KEY(MEMID )REFERENCES MEMBER(MEMID ),
CONSTRAINT FRIENDNEXUS_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID));
COMMENT ON COLUMN FRIENDNEXUS.FRIENDSTATUS IS '0=申請中 1=已成為好友';
Insert into FRIENDNEXUS values ('we01','we02',1);
Insert into FRIENDNEXUS values ('we02','we01',1);
Insert into FRIENDNEXUS values ('we01','we03',1);
Insert into FRIENDNEXUS values ('we03','we01',1);
Insert into FRIENDNEXUS values ('we01','we04',1);
Insert into FRIENDNEXUS values ('we04','we01',1);

Insert into FRIENDNEXUS values ('we03','we04',1);
Insert into FRIENDNEXUS values ('we04','we03',1);

Insert into FRIENDNEXUS values ('david','peter',1);
Insert into FRIENDNEXUS values ('peter','david',1);
Insert into FRIENDNEXUS values ('david','west',1);
Insert into FRIENDNEXUS values ('west','david',1);
--好友聊天紀錄--

CREATE TABLE FriendChatHistory ( 
FRIENDACC VARCHAR2(20 BYTE) NOT NULL, --好友帳號--
MEMID     VARCHAR2(20 BYTE) NOT NULL, --會員帳號--
CHATRECORD     CLOB ,            --聊天內容--
CONSTRAINT FriendChatHistory_PK PRIMARY KEY (FRIENDACC , MEMID ),
CONSTRAINT FRIENDCHATHISTORY_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID),
CONSTRAINT FriendChatHistory_accNo_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID ));



--參加揪團--

CREATE TABLE JOINGROUP (	
MEMID VARCHAR2(20)  NOT NULL,           --會員帳號--
teamId  VARCHAR2(7) NOT NULL,           --揪團帳號--
CONSTRAINT JOINGROUP_PK PRIMARY KEY (MEMID , teamId ),
CONSTRAINT JOINGROUP_teamId_FK FOREIGN KEY(MEMID , teamId )REFERENCES JOINGROUP(MEMID , teamId ),
CONSTRAINT JOINGROUP_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID));

Insert into JOINGROUP values ('we01','TM00001');
Insert into JOINGROUP values ('we03','TM00001');

--揪團聊天紀錄--


CREATE TABLE SCORPIONCHATRECORD (	
teamcNo VarChar2(7) NOT NULL,   
teamId VarChar2(7) NOT NULL,       
GROCHATRECORD CLOB,  
CONSTRAINT SCORPIONCHATRECORD_teamId_FK FOREIGN KEY (teamId) REFERENCES Team(teamId),
CONSTRAINT SCORPIONCHATRECORD_PK PRIMARY KEY (teamcNo));

CREATE SEQUENCE SCORPIONCHATRECORD_SEQ   
INCREMENT BY 1				   
START WITH 1				   
NOMAXVALUE					   
NOCYCLE                        
NOCACHE;  



--教材商品--
CREATE TABLE Goods ( 

goodId VarChar2(7) NOT NULL, 
teacherId VarChar2(7) NOT NULL,
goodName VarChar2(20) NOT NULL,
goodPrice Number(10) NOT NULL,
goodInfo CLOB,
goodImg BLOB,
goodStatus Number(1),

CONSTRAINT Goods_goodId_PK PRIMARY KEY (goodId),
CONSTRAINT Goods_teacherId_FK FOREIGN KEY (teacherId) REFERENCES teacher (teacherId)

);

COMMENT ON COLUMN Goods.goodStatus IS '0=下架,1=上架';

CREATE SEQUENCE Goods_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
-------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','拜託了冰箱','350','◎最好的食材，就在每個人家裡的冰箱◎父母寄來的家鄉菜、親友餽贈的精選食材、便利商店採買的方便料理……即使是家中剩餘的冰存食材，也可以變換出人人誇讚的創意美味！只要懂得巧妙運用烹飪小撇步，就能讓美食變得更好吃、滋味更豐富！',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','一碟蛋糕','550','A Piece Of Cake！ 史上最懶人的甜點烘焙！ 吃不完的海綿蛋糕大變身、速成版的巧克力橙片， 還有在家就能製作超人氣的美味起司布丁蛋糕， 將外表美麗、質感超高的媽媽必備蛋糕技法，一次大公開！ 保證全家大小的味蕾，都被你收服的死心塌地！',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','便當採訪記','420','本書為了讓女兒每天中午享用媽媽的愛心，伊藤正子展開一場超過十年的便當馬拉松， 本書收錄她每天絞盡腦汁為女兒變化的創意菜色，還有許多旅行中遇上的美味便當、每個人都有一個便當記憶，能喚起內心的柔軟與回憶。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','甜點創意教本','360','甜點的製作方式經過長年發展，累積了許多已經成為默契的規則和常識。例如，莓果類適合搭配櫻桃白蘭地；栗子和葡萄乾適合搭配蘭姆酒的定律，這是前人經過各種嘗試後流傳下來的組合。不過，跨越了這些規則和默契後，甜點還有著無限的可能，各種食材還等著和未知的口味相遇。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00003','拉筋伸展','330','105個伸展拉筋操，針對不同族群，搭配不同工具，是日常保健的最佳運動。書中有詳細的內容，可以對肌肉組織有更透徹的瞭解，讓你知道伸展時會運用到哪些肌肉，引導讀者學會所有的伸展運動。也會教大家如何避免運動傷害，對喜愛運動的人來說是一本不可或缺的重要工具書',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','法式甜點','500','打破法式甜點難學、易失敗的魔咒！大家只要按照書中的詳細說明，準備好計算過的配方、徹底了解家中烤箱的特性、隨時掌握烘烤中的食材狀態，相信都能輕鬆完成夢想中的美味甜點！即使是烘焙初學者也可以挑戰嘗試。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00004','深入淺出HTML5','450','在本書中將學會建立網站的真正秘密，視覺元素豐富的格式設計又能幫助大腦運作。使用最新的腦神經學、認知科學與學習理論的研究，本書將把 HTML 與 CSS 載入你的大腦，而且保證記憶深刻。 ',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Java深入淺出','400','本書是根據學習理論所設計的、讓你可以從學習程式語言的基本開始一直到包括執行緒、網路、與分散式程式等項目。最重要的，你會學會如何像個物件導向開發 者一般的思考。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00004','AJax深入淺出','600','本書不只是一本書，更是一段互動式 Web 應用程式編程的完整學習體驗。本書專為你的大腦量身打造，內容涵蓋 JavaScript、XHTML、DOM、以及其他擴展及革新 Web 應用程式所需的一切。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Servlet深入淺出','800','本書不只提供你必須謹記在心的豐富資訊；更將這些寶貴的知識直接烙印在你的大腦裡。藉由大量幫助你快速且深入學習的機制，你將與Servelets和JSP進行最有效率的互動。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00004','jQuery深入淺出','750','本書編寫的目的，市場上JQuery的書籍全部都只寫了基礎的使用，並沒有利用JQuery 開發一套完整的demo 案例，造成新手入門難、熟手不願意看的局面。 本書打破了傳統編寫手法，全部採用真實案例講解，並且保證所有源代碼均能正常運行。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Android深入淺出','480','本書會逐一介紹 Andorid 各組成元件的程式撰寫方法, 包括使用介面、事件處理、多活動 Android 應用程式, 然後帶到資料儲存與檔案交換、資料庫、廣播接收器等。最後使用數十個熱門範例來說明 Android 應用程式的實作技巧。 ',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00004','大喇叭','888','我是一支可愛的小喇叭^0^',NULL,'1');
-------------------------------------------------------------------------------------------------------------------------------------------
--教材商品訂單--
CREATE TABLE GoodsOrder ( 

goodOrderId VarChar2(7) NOT NULL, 
memId VarChar2(20) NOT NULL,
goodTotalPrice Number(10) NOT NULL,
goodDate Date,
buyerName VarChar2(20) NOT NULL,
buyerAddress VarChar2(60) NOT NULL,
buyerPhone VARCHAR2(10) NOT NULL,
goodOrdStatus Number(1),

CONSTRAINT GoodsOrder_goodOrderId_PK PRIMARY KEY (goodOrderId),
CONSTRAINT GoodsOrder_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId)

);

COMMENT ON COLUMN GoodsOrder.goodOrdStatus IS '0=訂單取消, 1=未出貨, 2=出貨中, 3=訂單完成';

CREATE SEQUENCE GoodsOrder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we01','3200',TO_DATE('1955-09-09','YYYY-MM-DD'),'肥嘟嘟左衛門','桃園市中壢區中大路300號15樓','0928199890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we02','1850',TO_DATE('1991-08-03','YYYY-MM-DD'),'野原美冴','台北市信義區信義路四段415號6樓','0936167890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we03','2450',TO_DATE('1970-01-01','YYYY-MM-DD'),'野原廣志','台北市松山區八德路四段520號','0916167550','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we04','900',TO_DATE('1911-02-21','YYYY-MM-DD'),'野原向日葵','台北市大安區復興南路一段390號','0956115810','0');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we01','1450',TO_DATE('1955-07-29','YYYY-MM-DD'),'肥嘟嘟左衛門','桃園市中壢區中大路300號15樓','0966199890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'we03','900',TO_DATE('1911-02-21','YYYY-MM-DD'),'野原廣志','台北市松山區八德路四段520號','0926955810','0');
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--教材商品訂單明細 --

CREATE TABLE GoodsDetails ( 

goodOrderId VarChar2(7) NOT NULL, 
goodId VarChar2(7) NOT NULL,
goodAmount Number(10) NOT NULL,
goodScore Float(20),
goodRate CLOB,

CONSTRAINT GoodsDetails_goodOrderId_FK FOREIGN KEY (goodOrderId) REFERENCES GoodsOrder (goodOrderId),
CONSTRAINT GoodsDetails_goodId_FK FOREIGN KEY (goodId) REFERENCES Goods (goodId),
PRIMARY KEY(goodOrderId, goodId)
);

COMMENT ON COLUMN GoodsDetails.goodScore IS '0~5分(間距0.5分)';
--------------------------------------------------------------------------
INSERT INTO GoodsDetails VALUES ('GO00001','GD00003','25','4.5',null);
INSERT INTO GoodsDetails VALUES ('GO00001','GD00002','17','3.0',null);
INSERT INTO GoodsDetails VALUES ('GO00002','GD00006','33','4.5',null);
INSERT INTO GoodsDetails VALUES ('GO00003','GD00004','10','4.0',null);
INSERT INTO GoodsDetails VALUES ('GO00004','GD00001','6','3.0',null);
INSERT INTO GoodsDetails VALUES ('GO00004','GD00007','29','3.0',null);
-----------------------------------------------------------------------------
--教材商品收藏 --

CREATE TABLE GoodsLike( 
goodId VarChar2(7) NOT NULL, 
memId VarChar2(20) NOT NULL,

CONSTRAINT GoodsLike_goodId_FK FOREIGN KEY (goodId) REFERENCES Goods (goodId),
CONSTRAINT GoodsLike_memId_FK FOREIGN KEY (memId) REFERENCES Member  (memId),
PRIMARY KEY(goodId, memId)
);

INSERT INTO GoodsLike VALUES ('GD00003','we01');
INSERT INTO GoodsLike VALUES ('GD00002','we02');
INSERT INTO GoodsLike VALUES ('GD00005','we04');
INSERT INTO GoodsLike VALUES ('GD00003','we02');

--教材留言--

CREATE TABLE GoodsMessage 
(
    goodsMessageID VarChar2(7) NOT NULL, 
    goodId VarChar2(7) NOT NULL, 
    memId VARCHAR2(20) NOT NULL, 
    messageContent CLOB,
    CONSTRAINT GoodsMessage_PK PRIMARY KEY (goodsMessageID ),
    CONSTRAINT GoodsMessage_goodId_FK FOREIGN KEY(goodId)REFERENCES Goods(goodId),
    CONSTRAINT GoodsMessage_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID)
);

CREATE SEQUENCE GoodsMessage_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00001','we01','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00003','we01','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00002','we03','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00005','we04','null');

--教材商品檢舉--

CREATE TABLE GoodsReport 
(
  goodReportID VARCHAR2(7) NOT NULL , 
  MEMID VARCHAR2(20) NOT NULL , 
  goodId VarChar2(7) NOT NULL , 
  goodReportContent CLOB , 
  goodReportStatus NUMBER , 
  CONSTRAINT GoodsReport_PK PRIMARY KEY (goodReportID ),
  CONSTRAINT GoodsReport_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID),
  CONSTRAINT GoodsReport_goodId_FK FOREIGN KEY(goodId)REFERENCES Goods(goodId)
);
COMMENT ON COLUMN GoodsReport.goodReportStatus IS '0=待處理 , 1=通過, 2=不通過';

CREATE SEQUENCE GoodsReport_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'we01','GD00001','null','0');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'we02','GD00003','null','1');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'we03','GD00003','null','1');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'we02','GD00002','null','2');

commit;