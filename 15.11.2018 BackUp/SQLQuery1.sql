--- делаем резервное копирование базы данных
exec sp_addumpdevice 'disk', 'MyBackUp', 'D:\mybackup.bak'    --диск, им€ файла, место куда сохранить
-- сначала делаем бэкап
exec sp_dropdevice MyBackup; --удал€ем бэкјп


--- а теперь выполн€ем бэкапп 
BACKUP DATABASE library  TO MyBackUp  WITH INIT   --INIT это перезаписать данные 
                                                  ---ONINIT это дазаписать данные к уже имеющимс€    

BACKUP DATABASE library TO disk ='D:\Backit.bak' WITH INIT 

BACKUP LOG library WITH INIT--  не работает 

RESTORE VERIFYONLY FROM MyBackUp-- восстановление из резервного копировани€ 


RESTORE DATABASE library FROM MyBackUp WITH MOVE 'library_dat' TO 'd:\lib.mdf'--восстановили базу данных с замено 
-- 'library_dat'  это логическое им€, 'd:\lib.mdf' куда сохранит логического им€ 

