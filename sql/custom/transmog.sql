--
-- Table structure for table `transmogrified_items`
--

CREATE TABLE IF NOT EXISTS `transmogrified_items` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Global Identifier of the Item',
  `displayEntry` int(10) unsigned NOT NULL COMMENT 'The entry of the display item',
  `owner` int(10) unsigned NOT NULL COMMENT 'Global Identifier of the player'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='For the transmogrification system';

