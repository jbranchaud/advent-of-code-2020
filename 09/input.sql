drop table if exists xmas_data;

create table xmas_data (id serial primary key, value bigint not null);

insert into xmas_data (value) values
(10),
(17),
(27),
(3),
(14),
(30),
(50),
(23),
(9),
(43),
(18),
(47),
(11),
(19),
(37),
(41),
(2),
(21),
(40),
(36),
(15),
(8),
(7),
(13),
(49),
(5),
(22),
(48),
(28),
(10),
(12),
(14),
(27),
(16),
(9),
(24),
(17),
(18),
(20),
(11),
(19),
(23),
(25),
(21),
(26),
(29),
(30),
(31),
(15),
(32),
(33),
(34),
(22),
(36),
(37),
(28),
(64),
(35),
(41),
(27),
(38),
(63),
(40),
(56),
(45),
(47),
(52),
(42),
(43),
(57),
(44),
(46),
(48),
(49),
(54),
(50),
(70),
(58),
(62),
(55),
(66),
(82),
(85),
(120),
(94),
(78),
(98),
(83),
(89),
(164),
(87),
(97),
(86),
(110),
(168),
(96),
(116),
(99),
(186),
(264),
(160),
(141),
(144),
(253),
(121),
(149),
(167),
(181),
(161),
(170),
(165),
(169),
(172),
(197),
(251),
(185),
(182),
(333),
(363),
(257),
(195),
(215),
(220),
(354),
(326),
(332),
(308),
(303),
(270),
(548),
(437),
(328),
(521),
(330),
(334),
(337),
(578),
(357),
(367),
(377),
(415),
(397),
(662),
(435),
(498),
(410),
(691),
(787),
(573),
(693),
(602),
(600),
(740),
(598),
(658),
(664),
(665),
(667),
(937),
(671),
(988),
(724),
(734),
(744),
(1137),
(807),
(845),
(1333),
(908),
(1237),
(1012),
(1173),
(1200),
(1171),
(1472),
(1198),
(1322),
(2484),
(1256),
(1325),
(1329),
(1332),
(1391),
(2585),
(1468),
(1857),
(1458),
(1478),
(2410),
(1652),
(2523),
(1753),
(2183),
(1920),
(2344),
(2185),
(2369),
(2670),
(2496),
(2454),
(3378),
(2588),
(2581),
(2647),
(2661),
(2807),
(2723),
(2946),
(2926),
(4129),
(3802),
(2936),
(3231),
(3405),
(3673),
(5143),
(3938),
(5270),
(5228),
(5596),
(5295),
(8827),
(5157),
(4950),
(5042),
(5235),
(5169),
(5242),
(7917),
(5384),
(10185),
(5649),
(5862),
(6157),
(8548),
(8273),
(6167),
(6636),
(7078),
(7611),
(9095),
(10192),
(9992),
(10107),
(10211),
(10452),
(10119),
(10199),
(10891),
(10553),
(10404),
(14689),
(11104),
(11033),
(11246),
(11511),
(14705),
(14430),
(15884),
(13714),
(12803),
(16359),
(14247),
(16706),
(17603),
(20203),
(20099),
(20111),
(20226),
(23925),
(36458),
(20318),
(20603),
(35995),
(20957),
(21508),
(34931),
(60383),
(23836),
(44024),
(25941),
(40521),
(26517),
(30953),
(27050),
(33121),
(41607),
(40542),
(34309),
(37702),
(40210),
(80609),
(40429),
(60294),
(77145),
(40921),
(47120),
(42465),
(67971),
(63643),
(45344),
(71382),
(71874),
(49777),
(60826),
(52458),
(53567),
(57470),
(64752),
(60171),
(67430),
(94488),
(72011),
(74519),
(77912),
(80639),
(82894),
(81350),
(154905),
(83386),
(120997),
(95121),
(87809),
(128395),
(102814),
(110603),
(109928),
(106025),
(173455),
(114393),
(111037),
(113738),
(159240),
(127601),
(132182),
(223811),
(146530),
(149923),
(176471),
(158551),
(208951),
(164244),
(178507),
(248598),
(308474),
(220418),
(182930),
(190623),
(208839),
(212742),
(215953),
(217062),
(277524),
(224775),
(241994),
(291422),
(274131),
(368191),
(259783),
(432682),
(337058),
(341481),
(354867),
(322795),
(387458),
(389019),
(342751),
(596297),
(415398),
(391769),
(373553),
(395672),
(582578),
(421581),
(441837),
(433015),
(547570),
(567526),
(466769),
(762572),
(533914),
(596841),
(774496),
(602534),
(659853),
(884628),
(976087),
(764632),
(665546),
(716304),
(1029312),
(1011695),
(765322),
(769225),
(813350),
(1417924),
(817253),
(854596),
(1213116),
(2189203),
(2067712),
(1136448),
(1034295),
(1418542),
(1130755),
(1199460),
(1199375),
(1371759),
(1262387),
(1964782),
(1381850),
(2296682),
(1430178),
(1694858),
(1481626),
(1534547),
(1578672),
(1582575),
(1968600),
(1851548),
(3346632),
(1671849),
(1888891),
(2170743),
(2330130),
(2393142),
(2233670),
(2406054),
(2954334),
(2753609),
(2734007),
(2461762),
(3043608),
(2744013),
(4265282),
(4336184),
(3991540),
(3176484),
(3016173),
(3060298),
(3113219),
(3161247),
(4626183),
(3523397),
(7325580),
(3560740),
(3842592),
(4924352),
(5064137),
(4563800),
(4867816),
(4639724),
(5769782),
(5195769),
(5505370),
(5804311),
(9203524),
(6221545),
(5760186),
(6173517),
(6076471),
(6576913),
(7677019),
(6129392),
(11889380),
(6274466),
(10100310),
(7084137),
(7403332),
(10701139),
(12872788),
(9627937),
(11417314),
(9431616),
(9507540),
(9835493),
(11574093),
(12205863),
(12082283),
(11977828),
(12798458),
(11836657),
(11889578),
(23395142),
(12249988),
(14761156),
(17777329),
(12403858),
(13213529),
(13358603),
(21035622),
(14487469),
(16515753),
(21268273),
(18939156),
(26011987),
(21485368),
(19267109),
(21005709),
(27165014),
(23410750),
(23463671),
(23726235),
(31021439),
(23814485),
(27700998),
(24086645),
(34028265),
(26737457),
(24653846),
(25617387),
(35454909),
(29874356),
(26572132),
(27846072),
(31003222),
(45508908),
(35782862),
(38206265),
(50098632),
(45572013),
(48064596),
(40272818),
(44416459),
(50298367),
(46874421),
(47189906),
(47540720),
(47901130),
(81929395),
(54583529),
(48740491),
(67010275),
(57720428),
(50271233),
(52189519),
(76843365),
(54418204),
(76670764),
(58849294),
(82972768),
(82657283),
(89013309),
(78479083),
(88337414),
(84689277),
(87147239),
(87462724),
(91290880),
(95930397),
(128860283),
(95091036),
(125859569),
(96641621),
(155490915),
(181049802),
(99011724),
(102460752),
(104689437),
(129032884),
(169804522),
(113267498),
(131088968),
(135520058),
(137328377),
(170120007),
(167492392),
(175484653),
(163168360),
(200414737),
(171836516),
(190302604),
(178753604),
(186381916),
(194942121),
(191732657),
(203701161),
(195653345),
(292819292),
(234531782),
(280174090),
(274493959),
(266361261),
(217956935),
(242300382),
(437662319),
(394003765),
(266609026),
(272848435),
(300496737),
(363145737),
(358218432),
(468303945),
(335004876),
(532970287),
(350590120),
(374406949),
(370486261),
(378114573),
(390595466),
(387386002),
(399354506),
(413610280),
(650963008),
(661879961),
(515148817),
(490805370),
(694500502),
(1132162821),
(508909408),
(539457461),
(624827458),
(567105763),
(660234437),
(635501613),
(705491137),
(867975163),
(1260329071),
(874462337),
(721076381),
(804205746),
(744893210),
(748600834),
(765500575),
(1057911133),
(896295410),
(812964786),
(904415650),
(999714778),
(1005954187),
(1862116879),
(1030262831),
(1076015171),
(1048366869),
(1106563224),
(1164284919),
(1373428292),
(1356577994),
(1295736050),
(1340992750),
(1661795985),
(1465969591),
(1904725168),
(1469677215),
(1486576956),
(1493494044),
(2938132050),
(1754555021),
(1669916225),
(1709260196),
(3241131977),
(1812679564),
(1504371145),
(3026494219),
(2036217018),
(2078629700),
(2877799437),
(2270848143),
(3195837152),
(2402299274),
(2460020969),
(4661806743),
(5008516716),
(2636728800),
(3153672314),
(2935646806),
(3548306915),
(2956254171),
(2963171259),
(3833184721),
(2997865189),
(3174287370),
(3213631341),
(3540588163),
(3317050709),
(5319761677),
(5034883871),
(3583000845),
(4971863824),
(4956429137),
(4480928974),
(4673147417),
(6367303655),
(5358553445),
(4862320243),
(7659671932),
(5572375606),
(10043400587),
(5592982971),
(5954119360),
(5891900977),
(7818574414),
(6538453352),
(8036607613),
(6172152559),
(6211496530),
(6387918711),
(7797979683),
(14165283338),
(9818749380),
(11040451072),
(8554864669),
(8063929819),
(13252654903),
(9154076391),
(9343249217),
(9535467660),
(13752099043),
(11846020337),
(10434695849),
(16633434043),
(13370355289),
(19197476978),
(15710650357),
(12383649089),
(23700750998),
(14942783380),
(22805586602),
(14208760172),
(12560071270),
(12599415241),
(14185898394),
(15861909502),
(27937997437),
(27326432469),
(16618794488),
(17218006210),
(17407179036),
(18497325608),
(33269088538),
(18878716877),
(21919116749),
(22280716186),
(41535192641),
(22818344938),
(24943720359),
(30588361499),
(36415483188),
(24983064330),
(25159486511),
(26745969664),
(37543135600),
(26768831442),
(46816714314),
(39925847710),
(46205149346),
(43861781207),
(73585545756),
(62206563896),
(33836800698),
(40778041794),
(34625185246),
(58334599937),
(37376042485),
(40797833626),
(47977831449),
(69023494284),
(57334331163),
(51751895772),
(49926784689),
(50103206870),
(50142550841),
(51729033994),
(51905456175),
(51928317953),
(96831749142),
(70630612649),
(61394016688),
(68461985944),
(71212843183),
(72001227731),
(86354219240),
(83940007568),
(89281498660),
(82603016695),
(101855102642),
(84767736087),
(129547443120),
(92526867620),
(123118299358),
(97904616138),
(100245757711),
(101655818683),
(252665742478),
(100029991559),
(101832240864),
(120773163490),
(134508472870),
(103833774128),
(113322334641),
(132024629337),
(150675515348),
(129856002632),
(152401993512),
(143214070914),
(154604244426),
(166543024263),
(167370752782),
(221018921201),
(202077998575),
(227035340490),
(177294603707),
(190431483758),
(232054620896),
(197934607697),
(247830807511),
(200275749270),
(222605404354),
(201862232423),
(203863765687),
(205666014992),
(217156108769),
(320287486390),
(233689776760),
(298567653600),
(331898848133),
(321147268689),
(273070073546),
(295616064426),
(333645554672),
(356974508021),
(357802236540),
(344665356489),
(437720635888),
(460725117250),
(367726087465),
(550331371481),
(388366091455),
(398210356967),
(818527353790),
(402137981693),
(476933839233),
(405725998110),
(407528247415),
(676564204622),
(594183718026),
(450845885529),
(506759850306),
(686933745055),
(568686137972),
(750391354599),
(594217342235),
(671280430513),
(629261619098),
(678310911161),
(1089071726748),
(763528234650),
(712391443954),
(1365244656216),
(2052178401271),
(756092178920),
(805738604382),
(786576448422),
(1019532023501),
(1399922322408),
(807863979803),
(1071117557259),
(813254245525),
(858374132944),
(957605735835),
(1188401060261),
(1045063227764),
(1441839145811),
(1197947757070),
(1162903480207),
(1223478961333),
(1265497772748),
(2029026007398),
(2588723617549),
(1390702355115),
(1468483622874),
(1850801832146),
(3048749589216),
(1744182184257),
(1877906156445),
(1599830693947),
(1592315052804),
(2116180785023),
(1621118225328),
(2213176567933),
(1666238112747),
(1671628378469),
(2281737868399),
(1815979868779),
(3294523780146),
(2207966707971),
(2243010984834),
(2386382441540),
(3056940467862),
(2428401252955),
(2488976734081),
(2656200127863),
(2859185977989),
(3220948919275),
(2983017407919),
(3068314316821),
(3192145746751),
(4696943442052),
(3800281760775),
(3213433278132),
(3258553165551),
(3263943431273),
(3437098094107),
(3292746603797),
(3337866491216),
(3482217981526),
(3953366246868),
(4097717737178),
(4864166835834),
(5102196962823),
(4450977692805),
(4671412237789),
(4814783694495),
(5713140595725),
(6879378945760),
(5145176861944),
(5842203385908),
(6051331724740),
(6175163154670),
(6601809922489),
(6260460063572),
(6405579024883),
(6471986443683),
(6477376709405),
(6506179881929),
(6820084472742),
(6556690035070),
(6630613095013),
(6774964585323),
(7435584228394),
(8769129974967),
(10577307431559),
(8548695429983),
(9122389930594),
(12472816480921),
(9265761387300),
(9486195932284),
(9959960556439),
(12118719620608),
(10987380247852),
(12732446507255),
(11893535110648),
(12226494879410),
(15029590038539),
(12737836772977),
(13062869916999),
(12877565468566),
(13136792976942),
(12983556591334),
(24050250164851),
(15105385465053),
(13187303130083),
(13405577680336),
(14210548813717),
(18034891362267),
(24787856245276),
(19699697362153),
(17671085360577),
(27273418730716),
(19446156488723),
(18751957319584),
(20473576180136),
(20947340804291),
(27194105405051),
(22880915358500),
(24120029990058),
(27907155507105),
(26592880810419),
(31222194492350),
(27843222238030),
(25861122059900),
(26389134271670),
(27397851943800),
(26170859721417),
(31440469042603),
(28510963145389),
(45942046869372),
(27616126494053),
(53568711665217),
(37117241849300),
(40552000719077),
(38144661540713),
(44060219632247),
(66051817047818),
(38198113808307),
(39225533499720),
(41420916984427),
(43828256162791),
(58416299897401),
(47000945348558),
(52250256331570),
(52031981781317),
(52454002870319),
(52559993993087),
(53258974003700),
(77893103841217),
(53786986215470),
(65760788034766),
(66841659993773),
(56127089639442);