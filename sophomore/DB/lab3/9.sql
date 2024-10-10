use library;
create trigger borrow_max on borrow
before insert
as
Begin
    Declare @num int
    Declare @cno char(10)
    select @cno = cno from inserted
    select @num=count(*) from borrow where cno=@cno
    If(@num=2)
    begin
      Print('一位同学一个学期不可以借三本书！')
      Rollback
    End
End