


Tables(Schema):
primary keys are underlined. With each column, Datatype, not null, isUnique, and meaning.

user(uid, uname, email, hometown, password)
Column
Datatype
NN
UQ
Note
uid
varchar(40)
√


Unique identifier for each user in backend
uname
varchar(40)
√
√
Unique login name for each user
email
varchar(45)
√
√
Unique login email for each user
hometown
varchar(45)




Default null. User choice to implement profile
password
varchar(45)
√


Encrypted for each user

project(pid, pname, description, sample, category, tag, startdate, enddate, deadline, minfund, maxfund, currentfund, issuccess, iscomplete, updatetime)
Column
Datatype
NN
Note
pid
varchar(40)
√
Unique identifier for each project in backend
pname
varchar(45)
√
A user can't create projects with same name
description
varchar(45)
 
Default null
sample
varchar(45)
 
Some simple previous work related.
category
varchar(45)


Four available: music, art, film and literature
startdate
datetime
√
The time user set to start funding. Same as project create time. Cannot change once set
enddate
datetime
√
The time user set to end funding. Cannot change once set.
deadline
datetime
√
The time user set to complete the project
minfund
decimal(10,2)
√
The minimum amount of money to start this project. Checked at enddate. Cannot change
maxfund
decimal(10,2)
√
The maximum amount of money to start this project. Enables the project. Cannot change.
currentfund
decimal(10,2)
√
Keeps track of current raised money
isseccess
boolean
√
Indicate whether the project is released
iscomplete
boolean
√
Indicate whether the project is completed. Can only set to true by the owner.
updatetime
datetime
√
Most recent time that the project is modified, including added material.

material(mid, createtime, content)
Column
Datatype
NN
Note
mid
varchar(40)
√
Unique global identifier for each material.
createtime
datetime
√
Time stamp for this material
content
longblob
√
For multimedia materials.

Creditcard(uid, CCN, adddate)
Column
Datatype
NN
Note
CCN
varchar(40)
√
Credit card number. The bank is included.
adddate
datetime
√
Timestamp for this credit card ownership
uid
varchar(40)
√
User who owns this credit card
uid references uid from User

Tag(tid, content)
Column
Datatype
NN
UQ
Note
tid
varchar(40)
√
 
Unique global identifier for each tag
content
varchar(140)
√
√
Tags have to be unique

(following are relationships)
follow(follower, followee) user-user
Column
Datatype
NN
Note
follower
varchar(40)
√
follower references uid from User
followee references uid from User
followee
varchar(40)
√

post(uid, pid) user-project
Column
Datatype
NN
Note
uid
varchar(40)
√
A project must have an owner.
uid references uid from User
pid references pid from Project
pid
varchar(40)
√


like(uid, pid, liketime) user-project
Column
Datatype
NN
Note
uid
varchar(40)
√
Liketime is the most recent time a user like this project
uid references uid from User
pid references pid from Project
pid
varchar(40)
√
liketime
datetime
√


comment(uid, pid, content, commenttime) user-project
Column
Datatype
NN
Note
uid
varchar(40)
√
A user can comment in the same project with same words.
uid references uid from User
pid references pid from Project
pid
varchar(40)
√
commenttime
datetime
√
content
varchar(140)
√

rate(uid, pid, level, ratetime) user(sponsor only!)-project
Column
Datatype
NN
Note
uid
varchar(40)
√
Only sponsors will be able to rate a project. Level of the rate is an integer range from 0 to 5.
uid references uid from User
pid references pid from Project
 
pid
varchar(40)
√
level
tinyint
√
ratetime
datetime
√


pledge(uid, pid, amount, pledgetime, chargetime, CCN, charged) user-project
Column
Datatype
NN
Note
uid
varchar(40)
√
A pledge is referred to a third party once created. And the
uid references uid from User
pid references pid from Project
(uid, CCN) references (uid, CCN) from CreditCard
pid
varchar(40)
√
amount
decimal(10,2)
√
pledgetime
datetime
√
CCN
varchar(40)
√

contains(pid, mid) project-material
Column
Datatype
NN
Note
pid
varchar(40)
√
Contains tells us which project has what materials. pid references pid for Project,
mid references mid for Material.
mid
varchar(40)
√


TagItem(pid, tagid)
Column
Datatype
NN
Note
pid
varchar(40)
√
 Tagitem indicate which project has what tags. pid references pif for Project, tagid references tagid for Tag
 
tagid
varchar(40)
√


sample data:
Alice: A user loves art and literature. She usually looks for projects with such tags and donate money to them. She is also an active on social things such as making friends, rating projects and  adding comments. She also posts some projects with some chance of getting funded.
BobInBrooklyn: Bob wants to make a film but he failed. He also views a wide range of projects regarding movies.
Charlie: A somewhat successful poet on this platform. He’s earned quite amount of money on this site.
David: A user who seldom logs in since registered.
Jesse: A mystery donator. 

user:name

project:

material: 
charge:
creditcard:
follow: 
post:
like:
comment:
rate:
pledge:
contains:

queries and the result on sample data:
1. create a record for a new user account.
insert into User value ('004', 'Jesse', 'cjesse@nyu.edu','Huanggang', '09876544331');
 
2. List all projects contains keyword “jazz” currently looking for funds with descending order.
select pid, pname
from Project
where pname like '%jazz%' and iscomplete=false
order by startdate desc;
 
3. List all users who have given money to jazz projects in the past with sorted total amount.
select uid, uname, sum(amount)
from crowdfunding1.User natural join Charge natural join Project
where pid in (select pid
   	        from Itemtag natural join Tag
   	        where title='jazz')
or pid in (select pid
   	 	from Project
            where category='jazz')
group by uid
order by sum(amount) desc;
 
4. List users completed at least 3 projects that all received over 4 starts average.
select uname
from Post natural join crowdfunding1.User
where pid not in (select pid
          	 	from Rate as T1
                  group by pid
                  having avg(T1.level) < 4)
group by uname
having count(pid) > 2;
 
5. List comments by users followed by “BobInBrooklyn”.
select content
from Comment
where uid in (select followee
   	        from Follow
               where follower='BobInBrooklyn');
 
 
6. Insert a new project.
INSERT INTO Project
(`pid`, `pname`, `description`, `category`, `tag`, `startdate`, `enddate`, `deadline`, `minfund`, `maxfund`, `issuccess`, `iscomplete`, `updatetime`)
VALUES ('0004', 'painting club', 'it is a painting club', 'painting', 'painting, club', '2017-04-18 12:00:00', '2017-05-30 12:00:00', '2017-05-16 12:00:00', '300', '700', '0', '0', '2017-04-18 18:09:00');
 
 
7. Insert a pledge.
insert into Pledge
values ('004', '0001', 50, NOW(), '112');
 
 
8. Write trigger
delimiter $$
create trigger fullyfund before update on Project
for each row
   	begin
          	if currentfund >= minfund and issuccess = 0 then
                  	set new.issuccess = 1;
                  	update Pledge set charged=true where pid=new.pid;
          	end if ;
   	end$$
delimiter ;
 
delimiter $$
 
create event timecheck
on schedule every 1 day starts '2017-04-21 00:00:00'
do begin
   	update Project
   set iscomplete=1, updatetime=now()
   where iscomplete=0 and endtime=now();
   end $$
delimiter ;



procedures:

