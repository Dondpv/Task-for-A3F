

--drop table [dbo].[contacts]
CREATE TABLE [dbo].[contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--drop table [dbo].[ContactFrienship]
CREATE TABLE [dbo].[ContactFrienship](
	
	[ContactFrienshipID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NULL,
	[ContactFriendID] [int] NULL,
 CONSTRAINT [PK_ContactFrienship] PRIMARY KEY CLUSTERED 
(
	[ContactFrienshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


delete from contacts
insert into contacts (contactName)
select 'Fred Wilson'
insert into contacts (contactName)
select 'Lena Markova'
insert into contacts (contactName)
select 'Ivan Ivanov'
insert into contacts (contactName)
select 'Marina Lomonosova'
insert into contacts (contactName)
select 'Rita Popova'
insert into contacts (contactName)
select 'Zarina Kozlova'
insert into contacts (contactName)
select 'Mark Topol'
insert into contacts (contactName)
select 'Anna Kris'


insert into contacts (contactName)
select 'Marina Top'
insert into contacts (contactName)
select 'Nikolay Popov'
insert into contacts (contactName)
select 'Fred Valuev'
insert into contacts (contactName)
select 'Mark Topol'
insert into contacts (contactName)
select 'Anna Karo'



delete from [dbo].[ContactFrienship]
insert into [dbo].[ContactFrienship] ( [ContactID],[ContactFriendID])
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn =1

union all
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn = 2


union all
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn = 3

union all
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn = 4
union all
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn = 5

union all
select contactID,friendID
from contacts c1  
cross apply (select row_number() over( partition by c1.contactID order by c1.contactID) as rn,
contactID as friendID
from contacts c2 where c2.contactID > c1.contactID ) f
where f.rn = 6
order by [ContactID]


-- 1
select c1.contactName, count(distinct c2.contactID) as countOfFriends from [dbo].[ContactFrienship] cf
inner join contacts c1 on c1.contactID = cf.[ContactID]
inner join contacts c2 on c2.contactID = cf.[ContactFriendID]
group by c1.contactName
having count(c2.contactID) > 5
order by c1.contactName


-- 2
select distinct c1.contactName, c2.contactName As friendContactName  from [dbo].[ContactFrienship] cf
inner join contacts c1 on c1.contactID = cf.[ContactID]
inner join contacts c2 on c2.contactID = cf.[ContactFriendID]
order by c1.contactName


