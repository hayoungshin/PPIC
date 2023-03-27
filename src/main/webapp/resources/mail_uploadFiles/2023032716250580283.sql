select * from mail;
select * from mail_status;

/* 받은메일 */
select
       mail_no
     , sender_mail
     , mail_title
     , to_char(sent_date, 'yyyy.mm.dd hh24:mi') sent_date
     , (
        select important_status
          from mail_status s
         where m.mail_no = s.mail_no
           and recipient_mail = 'user04@ppic.kr'
       ) important_status
     , (
        select count(read_date)
          from mail_status s
         where m.mail_no = s.mail_no
           and recipient_mail = 'user04@ppic.kr'
       ) read_status
     , (
        select mail_type
          from mail_status s
         where m.mail_no = s.mail_no
           and recipient_mail = 'user04@ppic.kr'
       ) mail_type
     , (
        select count(*)
          from mail_attachment at
         where m.mail_no = at.mail_no
       ) attachment_status
  from mail m
 where recipient_mail like '%' || 'user04@ppic.kr' || '%'
    or ref_mail like '%' || 'user04@ppic.kr' || '%'
    or hid_ref_mail like '%' || 'user04@ppic.kr' || '%'
 order
    by mail_no desc;

select * from mail_status where recipient_mail = 'user04@ppic.kr';

select count(*)
  from mail_status
 where recipient_mail = 'user01@ppic.kr'
   and bin_status = 'N';

/* 읽었는지 안읽었는지 체크하려구 */
select count(read_date)
  from mail_status
 where recipient_mail = 'user04@ppic.kr'
   and mail_no = 17;
rollback;


/* 받은메일 상세조회 */
select
       mail_no
     , user_name
     , mail_title
     , (
        select
               user_name
          from mail_status
          join member on (recipient_mail = mail)
         where mail_no = 14
           and mail_type = 1
       ) recipient_mail
     , ref_mail
     , hid_ref_mail
     , mail_content
     , sent_date
  from mail
  join member on (sender = user_no)
 where mail_no = 14;

select
       user_name
  from mail_status
  join member on (recipient_mail = mail)
 where mail_no = 14
   and mail_type = 1;

select
       file_no
     , origin_name
     , change_name
  from mail_attachment
 where mail_no = 34;
 
 
 
 
 
 
 select
       mail_no
     , sender_mail
     , mail_title
     , to_char(sent_date, 'yyyy.mm.dd hh24:mi') sent_date
     , (
        select important_status
          from mail_status s
         where 41 = s.mail_no
           and recipient_mail = 'user05@ppic.kr'
       ) important_status
     , (
        select count(read_date)
          from mail_status s
         where 41 = s.mail_no
           and recipient_mail = 'user05@ppic.kr'
       ) read_status
     , (
        select mail_type
          from mail_status s
         where 41 = s.mail_no
           and recipient_mail = 'user05@ppic.kr'
       ) mail_type
     , (
        select count(*)
          from mail_attachment at
         where m.mail_no = at.mail_no
       ) attachment_status
  from mail m
 where recipient_mail like '%' || 'user05@ppic.kr' || '%'
    or ref_mail like '%' || 'user05@ppic.kr' || '%'
    or hid_ref_mail like '%' || 'user05@ppic.kr' || '%'
 order
    by mail_no desc;

select
       mail_no
     , mail_title
     , recipient_mail
     , ref_mail
     , hid_ref_mail
     , mail_content
     , to_char(sent_date, 'yyyy.mm.dd hh24:mi') sent_date
     , (
        select important_status
          from mail_status s
         where s.mail_no = m.mail_no
           and recipient_mail = 'user01@ppic.kr'
       ) important_status
  from mail m
 where mail_no = 14