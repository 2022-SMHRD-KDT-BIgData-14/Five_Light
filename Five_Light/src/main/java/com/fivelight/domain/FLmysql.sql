--create table kakaoUser(
--email VARCHAR(1000) NOT NULL,
--name VARCHAR(1000) NOT NULL,
--nickname VARCHAR(20),
--gender VARCHAR(20)
--);


select * from userinfo
select * from ranking
select * from feedback
select * from exercise


select * from feedback where nickname='admin'


--INSERT INTO feedback (nickname, ex_name, accuracy, Feed_con) VALUE ('test', 'test', 00.00, 'test')
--
--select nickname, ex_name, (sum(rank_acc)/7)as rank_acc from ranking where ex_name = '랫 풀 다운' group by nickname order by rank_acc desc
--
--INSERT INTO feedback (nickname, ex_name, accuracy, feed_date, Feed_con) values ('admin', '랫 풀 다운', 00.00, date_add(sysdate(), INTERVAL 1 DAY), 'test')
--select * from feedback where nickname='User000001'

--UPDATE userinfo SET  weight_start = 98.0, weight_now = 85.5, weight_target=78.0 WHERE nickname = 'User000006'

--select * from userinfo where access is null
--select * from kakaoUser where email != 'cln9654@naver.com'

-- USERINFO, RANK, FEEDBACK, EXERCISE
