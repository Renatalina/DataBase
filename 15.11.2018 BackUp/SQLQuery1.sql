--- ������ ��������� ����������� ���� ������
exec sp_addumpdevice 'disk', 'MyBackUp', 'D:\mybackup.bak'    --����, ��� �����, ����� ���� ���������
-- ������� ������ �����
exec sp_dropdevice MyBackup; --������� �����


--- � ������ ��������� ������ 
BACKUP DATABASE library  TO MyBackUp  WITH INIT   --INIT ��� ������������ ������ 
                                                  ---ONINIT ��� ���������� ������ � ��� ���������    

BACKUP DATABASE library TO disk ='D:\Backit.bak' WITH INIT 

BACKUP LOG library WITH INIT--  �� �������� 

RESTORE VERIFYONLY FROM MyBackUp-- �������������� �� ���������� ����������� 


RESTORE DATABASE library FROM MyBackUp WITH MOVE 'library_dat' TO 'd:\lib.mdf'--������������ ���� ������ � ������ 
-- 'library_dat'  ��� ���������� ���, 'd:\lib.mdf' ���� �������� ����������� ��� 

