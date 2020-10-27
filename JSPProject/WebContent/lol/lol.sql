drop table lol_tbl_items;
create table lol_tbl_items(
	num number not null primary key,
	name nvarchar2(20) not null,
	gold number(6) not null,
	img varchar2(100),
	consume nvarchar2(500),
	passive nvarchar2(500),	
	active nvarchar2(500),	
	opval nvarchar2(100),
	other nvarchar2(100),
	limitation nvarchar2(100),
	requirements nvarchar2(50),
	recipe nvarchar2(100),	
	build nvarchar2(100));
	
select * from lol_tbl_items;

insert into lol_tbl_items(num, name, gold, img, active, limitation)
values('1','허수아비 (장신구)','0','Scarecrow_Effigy_item.png',
	'사용 시: 충전량을 1회 소모하여 주변을 드러내 주는 허수아비를 설치합니다.  허수아비는 피들스틱의 레벨이 올라갈수록 더 빠르게 충전되고 더 오래 유지됩니다.',
	'피들스틱 챔피언에만 사용할 수 있습니다.');
insert into lol_tbl_items(num, name, gold, img, active, limitation)
values('2','와드 토템 (장신구)','0','Warding_Totem_item.png',
	'사용 시: 충전량을 1회 소모하여 90 ~ 120초 동안 주변을 드러내 주는 보이지 않는 투명 와드를 설치합니다.  매 240 ~ 120초마다 1회 충전되며 최대 2회까지 충전됩니다.  와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.',
	'(플레이어당 맵에 설치할 수 있는 투명 와드는 3개로 제한됩니다.)  이용 불가 맵  칼바람 나라');
insert into lol_tbl_items(num, name, gold, img, active, limitation, requirements)
values('3','망원형 개조','0','Farsight_Alteration_item.png',
	'와드 토템 장신구 업그레이드 시:  + 설치 가능 범위 대폭(+650%) 증가  + 지속시간 제한 없음. 와드 설치 개수 제한에 관계 없음  - 재사용 대기시간 10% 증가  - 누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가  - 와드 시야 범위 45% 감소  - 상점 방문시 충전되지 않음',
	'장신구 소지 개수는 1개로 제한됩니다.','업그레이드하려면 9레벨 이상이 되어야 합니다.');
insert into lol_tbl_items(num, name, gold, img, active, limitation)
values('4','예언자의 렌즈','0','Oracle_Lens_item.png',
	'사용 시: 10초 동안 근처를 수색해 적 유닛이 숨어 있으면 경고를 보내며 주변의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다.(재사용 대기시간 90~60초)',
	'장신구 소지 개수는 1개로 제한됩니다.');
insert into lol_tbl_items(num, name, gold, img, active, limitation)
values('5','칠흑의 창','0','The_Black_Spear_item.png',
	'사용 효과: 아군에게 이 게임 동안 결속되는 계약을 제의합니다. 계약이 수락되면 해당 아군과 가까이 있을 때 둘이 모두 강화됩니다.',
	'칼리스타 챔피언에만 사용할 수 있습니다.');
insert into lol_tbl_items(num, name, gold, img, active, limitation)
values('6','칠흑의 창','0','The_Black_Spear_item.png',
	'사용 효과: 아군에게 이 게임 동안 결속되는 계약을 제의합니다. 계약이 수락되면 해당 아군과 가까이 있을 때 둘이 모두 강화됩니다.',
	'사일러스 챔피언에만 사용할 수 있습니다.');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('7','얼음 간식','0','Frosted_Snax_item.png',
	'사용 시 - 왕에게 먹이를: 왕이 미사일 다발을 멀리 발사해 중심부에 있는 적에게는 각각 213~775의 마법 피해를, 가장자리에 있는 적에게는 최저 85~310의 피해를 입힙니다.(재사용 대기시간 120초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('8','화르륵 매운맛 간식','0','Super_Spicy_Snax_item.png',
	'사용 시 - 왕에게 먹이를: 왕이 원뿔형으로 불을 내뿜어 4초 동안 적에게 705~1490의 고정 피해를 입힙니다. 포탑에게는 560의 고정피해를 입힙니다.(재사용 대기시간 120초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('9','에스프레소 간식','0','Espresso_Snax_item.png',
	'사용 시 - 왕에게 먹이를: 왕이 공중으로 뛰어올랐다가 두 차례 땅으로 떨어질 때마다 적을 밀어내고 40~190의 물리 피해를 입힙니다. 포로 왕에게는 최대 체력의 20%에 해당하는 보호막이 생기며, 보호막은 4초에 걸쳐 사라집니다.(재사용 대기시간 30초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('10','무지개 간식 파티 세트','0','Rainbow_Snax_Party_Pack_item.png',
	'사용 시 - 왕에게 먹이를: 왕이 적 뒤로 간식을 잔뜩 던져 포로들을 유인한 뒤 다시 자신에게 돌아오게 합니다. 포로와 부딪힌 적 챔피언은 앞으로 밀려나며 230~680의 물리 피해를 입습니다.(재사용 대기시간 120초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('11','빛의 인도자 간식','0','The_light_guide_snax_item.png',
	'사용 시 - 왕에게 먹이를: 포로 왕이 챔피언을 자신의 옆으로 끌어옵니다. 최대 4초 동안 해당 챔피언은 대상으로 지정되지 않으며 공격할 수 없는 상태가 됩니다. 마우스를 클릭하여 지정한 위치로 날아갈 수 있습니다. 적 챔피언에게 부딪히면 멈추며, 좁은 반경 안의 모든 적을 뒤로 밀어냅니다. 충격파는 원뿔형 범위에 230~680의 물리 피해를 입힙니다.(재사용 대기시간 120초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('12','어둠의 인도자 간식','0','The_dark_guide_snax_item.png',
	'사용 시 - 왕에게 먹이를: 포로 왕이 자신의 뒤에 검은 바람을 소환한 후 전방에 나선형으로 발사하여 230~680의 물리 피해를 입히고 적을 공중으로 띄워 올립니다.(재사용 대기시간 120초)',
	'이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, passive, limitation, requirements)
values('13','가차없는 포격','0','Fire_at_Will_item.png',
	'고유 지속 효과: 이제 포탄 세례가 시간이 갈수록 빠르게 발사됩니다.(지속시간 동안 추가 6차례 발사)',
	'갱플랭크 챔피언에만 사용할 수 있습니다.','바다뱀 은화 500닢이 필요합니다.');
insert into lol_tbl_items(num, name, gold, img, passive, limitation, requirements)
values('14','죽음의 여신','0','Deaths_Daughter_item.png',
	'고유 지속 효과: 포탄 세례가 범위 중앙에 추가로 대형 포탄을 하나 발사하여 300%의 고정피해를 입히고 1.5초간 60% 둔화를 적용합니다.',
	'갱플랭크 챔피언에만 사용할 수 있습니다.','바다뱀 은화 500닢이 필요합니다.');
insert into lol_tbl_items(num, name, gold, img, passive, limitation, requirements)
values('15','사기진작','0','Raise_Morale_item.png',
	'고유 지속 효과: 포탄 세례 범위 안의 아군은 이제 2초간 이동 속도가 30% 상승합니다.',
	'갱플랭크 챔피언에만 사용할 수 있습니다.','바다뱀 은화 500닢이 필요합니다.');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('16','체력 물약','50','Health_Potion_item.png',
	'클릭하여 사용: 15초에 걸쳐 150의 체력을 회복합니다.','한 번에 한 종류의 회복 물약만 최대 5개까지 소지할 수 있습니다.');
insert into lol_tbl_items(num, name, gold, img, consume, limitation)
values('17','최후의 결전 체력 물약','50','Health_Potion_item.png',
	'클릭하여 사용: 15초에 걸쳐 150의 체력을 회복합니다.',
	'한 번에 한 종류의 회복 물약만 최대 2개까지 소지할 수 있습니다.  이용 불가 맵:  소환사의 협곡');
insert into lol_tbl_items(num, name, gold, img, consume, passive, limitation, requirements)
values('18','제어 와드','75','Control_Ward_item.png',
	'클릭하여 사용: 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.'
	'플레이어 당 맵에 설치할 수 있는 제어 와드의 개수는 1개로 제한됩니다.',
	'제어 와드는 가방에 2개만 소지할 수 있습니다.  이용 불가 맵:  칼바람 나락');



