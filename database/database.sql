-- @SATUAN
create table listsatuan(idsatuan integer not null primary key autoincrement, kodesatuan varchar(8) not null unique);
insert into listsatuan(kodesatuan) values ('-');
create table listparentsatuan(idparentsatuan integer not null primary key autoincrement, idsatuankoli int not null references listsatuan(idsatuan), idsatuanbesar int not null references listsatuan(idsatuan), faktorkolibesar double not null default 1.0);
create unique index idx_parentsatuan on listparentsatuan(idsatuankoli, idsatuanbesar);
create table listparentsatuandetail(idparentsatuandetail integer not null primary key autoincrement, idparentsatuan int not null references listparentsatuan(idparentsatuan),idsatuankecil int not null references listsatuan(idsatuan), faktorbesarkecil double not null default 1.0);
create unique index idx_parentsatuandetail on listparentsatuandetail(idparentsatuan,idsatuankecil);

-- @LOKASI
create table listlokasi(idlokasi integer not null primary key autoincrement, kodelokasi varchar(8) not null unique);
create table listlokasidetail(idlokasi integer not null primary key, namalokasi varchar(64) not null, alamatlokasi varchar(128) not null,  telplokasi varchar(64) not null, ketlokasi varchar(128) not null);
-- @LEVEL 
create table listlevel(idlevel integer not null primary key autoincrement, kelaslevel varchar(32) not null unique);
create table listleveldetail(idleveldetail integer not null primary key autoincrement, idlevel int not null references listlevel(idlevel), kodelevel varchar(8) not null, namalevel varchar(32) not null);
create unique index idx_level on listleveldetail(idlevel,kodelevel);
-- @LEVELLOKASI
create table listlevellokasi(idlevellokasi integer not null primary key autoincrement, idlevel int not null references listlevel(idlevel), idlokasi int not null references listlokasi(idlokasi));
create unique index idx_levellokasi on listlevellokasi(idlevel, idlokasi);
-- @LOGIN
create table listlogin(idlogin integer not null primary key autoincrement, userlogin varchar(64) not null unique, passlogin varchar(128) not null, idlevel int not null references listlevel(idlevel), registerlogin timestamp default 'now');
create table listlogindetail(idlogin integer not null primary key, namalogin varchar(64) not null, 
-- @STOK
create table liststok(idstok integer not null primary key autoincrement, kodestok varchar(24) not null unique, namastok varchar(128) not null);
create table liststoksatuan(idstok integer not null primary key, idparentsatuan int not null references listparentsatuan(idparentsatuan), idsatuankoli int not null references listparensatuan(idparentsatuna)), idsatuanbesar int not null references listparensatuan(idsatuanbesar), faktorkolibesar double not null, idsatuankecil int not null references listparentsatuandetail(idsatuankecil), faktorbesarkecil double not null);
-- @BARCODE
create table listbarcode(idbarcode integer not null primary key autoincrement, kodebarcode varchar(32) not null unique, idstok int not null references liststok(idstok));
