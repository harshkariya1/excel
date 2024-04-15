-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2024 at 07:12 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xcel`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `productname` varchar(255) NOT NULL,
  `productid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sku` varchar(50) NOT NULL,
  `variantid` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discounted_percentage` decimal(5,2) DEFAULT '0.00',
  `description` text,
  `categoryid` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`productname`, `productid`, `sku`, `variantid`, `price`, `discounted_percentage`, `description`, `categoryid`, `category`) VALUES
('camera', '1', 'PRESID', '1001', 816.60, 8.00, 'Financial little hold day challenge by. Woman approach model travel sometimes public class. Conference senior sure.', 1, NULL),
('Persevering grid-enabled Graphical User Interface', '2', 'NEARLY', '1002', 810.32, 11.00, 'Agent detail debate rise member. Thing herself alone stand field of. Alone coach bring party language top.', 4, NULL),
('tablet', '3', 'DEFENS', '1003', 467.65, 9.00, 'Challenge lay wall president company program.', 1, NULL),
('watch', '4', 'ATTACK', '1004', 135.29, 16.00, 'By positive some candidate increase keep here. Themselves support likely star meeting.', 3, NULL),
('laptop', '5', 'FORWAR', '1005', 92.73, 25.00, 'Only when quickly chance maybe close. Growth child series as hand assume under.', 1, NULL),
('Cloned global project', '6', 'THEN', '1006', 145.47, 30.00, 'Weight wide student hotel fly. Agent until long sport budget.', 4, NULL),
('bracelet', '7', 'VOICE', '1007', 273.19, 11.00, 'Rule his operation. Station feeling process cup church.', 3, NULL),
('smartphone', '8', 'LIGHT', '1008', 203.61, 18.00, 'Avoid difficult hotel walk whom certain most class. City at already car speech particularly near. Republican buy at range popular.', 1, NULL),
('tablet', '9', 'SUFFER', '1009', 44.61, 13.00, 'Play provide physical never. Knowledge west mention debate old serious decade.', 1, NULL),
('laptop', '10', 'TOWARD', '1010', 49.68, 27.00, 'Deep visit many participant. Traditional focus common entire apply.', 1, NULL),
('shoes', '11', 'TREAT', '1011', 781.92, 10.00, 'Coach finish them.', 2, NULL),
('Programmable needs-based matrix', '12', 'LIVE', '1012', 546.92, 20.00, 'Fine talk executive main himself do. Affect their finish whatever first large music send. Happy quite weight you prevent church situation.', 4, NULL),
('shirt', '13', 'PART', '1013', 529.01, 26.00, 'Order these either magazine certainly local always.', 2, NULL),
('Centralized discrete initiative', '14', 'WEAR', '1014', 872.82, 12.00, 'Worry base structure mouth pull a certainly any. Public question like guy.', 4, NULL),
('jacket', '15', 'ITSELF', '1015', 772.79, 9.00, 'Age full there. Enter southern participant fall service with necessary.', 2, NULL),
('pants', '16', 'CHURCH', '1016', 298.43, 30.00, 'Analysis draw fly line occur total.', 2, NULL),
('De-engineered leadingedge analyzer', '17', 'REPORT', '1017', 709.30, 28.00, 'Expert senior talk senior. General rich police rule respond fund catch. Own five these election.', 4, NULL),
('jacket', '18', 'DO', '1018', 419.23, 15.00, 'Program upon lay mean mean but likely.', 2, NULL),
('pants', '19', 'DRIVE', '1019', 952.15, 7.00, 'Ground could art we test international.', 2, NULL),
('dress', '20', 'BOY', '1020', 343.43, 18.00, 'By piece soldier summer.', 2, NULL),
('dress', '21', 'RADIO', '1021', 945.39, 17.00, 'Note treat church anything cover.', 2, NULL),
('headphones', '22', 'BROTHE', '1022', 338.45, 11.00, 'Skill from own second far something under. Find successful west budget institution land.', 1, NULL),
('bracelet', '23', 'MOVEME', '1023', 179.12, 30.00, 'Approach society include. Life always reflect speech program could activity manager.', 3, NULL),
('Optimized full-range policy', '24', 'WORKER', '1024', 361.62, 14.00, 'All live foot water PM third short. Will month dark nature believe tend bag chance. Tax they foot country.', 4, NULL),
('wallet', '25', 'OFTEN', '1025', 708.37, 21.00, 'Same until inside someone.', 3, NULL),
('smartphone', '26', 'ENERGY', '1026', 430.11, 20.00, 'White whose picture before option. Himself right resource pull design. Stop land least speak black.', 1, NULL),
('tablet', '27', 'CLASS', '1027', 673.94, 7.00, 'Paper bar sea.', 1, NULL),
('Streamlined intermediate knowledgebase', '28', 'APPLY', '1028', 34.62, 25.00, 'Dream nothing senior inside international away woman. Garden man score president admit cultural one. Start white add always. Offer effect none magazine tree.', 4, NULL),
('headphones', '29', 'AVOID', '1029', 453.44, 15.00, 'Political option beat ball despite score program. Course this seven put exist. On significant range now arrive it.', 1, NULL),
('Exclusive system-worthy attitude', '30', 'HERSEL', '1030', 950.37, 11.00, 'Own decade father only step within few. Down various budget put song among report win. Find cold maintain single than organization cultural.', 4, NULL),
('pants', '31', 'RECOGN', '1031', 34.22, 5.00, 'Style pattern dark sure keep born.', 2, NULL),
('sunglasses', '32', 'IN', '1032', 826.64, 12.00, 'Fire tend though test us either bad. Today appear every affect treat benefit.', 3, NULL),
('Intuitive fault-tolerant alliance', '33', 'HOUR', '1033', 204.33, 20.00, 'Reveal general sell fill return few. Center my read want message water. Keep language best skill season.', 4, NULL),
('Visionary context-sensitive standardization', '34', 'RECEIV', '1034', 657.15, 23.00, 'Once notice conference learn budget grow. Foot today no forward simply management. Major guess too soldier over yeah.', 4, NULL),
('smartphone', '35', 'SUCH', '1035', 158.38, 5.00, 'Me task not admit position fish. The let common budget child already. Notice stock result management ability.', 1, NULL),
('Multi-tiered radical interface', '36', 'OR', '1036', 350.17, 21.00, 'College religious list record reveal wish action. Special test evidence evidence Congress phone late. Beyond assume land blue. Blue project nor during probably executive.', 4, NULL),
('smartphone', '37', 'WEIGHT', '1037', 738.86, 16.00, 'Seek subject notice find note decide. Your able grow remember claim. Writer suggest simple front relationship.', 1, NULL),
('bag', '38', 'MINUTE', '1038', 929.09, 5.00, 'Newspaper another sure hard skin pull magazine.', 3, NULL),
('wallet', '39', 'MEETIN', '1039', 407.02, 26.00, 'Late war six listen one address plant year.', 3, NULL),
('pants', '40', 'TEST', '1040', 345.38, 16.00, 'Rather moment perhaps.', 2, NULL),
('wallet', '41', 'HIS', '1041', 209.66, 9.00, 'Adult somebody else themselves vote.', 3, NULL),
('tablet', '42', 'TV', '1042', 682.07, 29.00, 'Start list serious seek mouth computer involve. What power either early.', 1, NULL),
('Public-key bandwidth-monitored alliance', '43', 'WAY', '1043', 817.25, 12.00, 'Senior especially expert. Value hour good know price question. Likely trade conference role.', 4, NULL),
('sunglasses', '44', 'FINISH', '1044', 468.40, 23.00, 'Laugh another yard from identify. Ago too experience more act large.', 3, NULL),
('shirt', '45', 'YEAR', '1045', 300.29, 22.00, 'Support son law break ability while while.', 2, NULL),
('Synergistic holistic open system', '46', 'REDUCE', '1046', 265.52, 18.00, 'Term after number beyond.', 4, NULL),
('Persevering bottom-line moderator', '47', 'REPUBL', '1047', 139.14, 17.00, 'College indeed sure turn. Author debate address. Check recognize material investment into six.', 4, NULL),
('tablet', '48', 'ROLE', '1048', 601.46, 11.00, 'When effort newspaper fact culture series. Director our with.', 1, NULL),
('wallet', '49', 'DIFFER', '1049', 50.48, 10.00, 'Early task really word two will source.', 3, NULL),
('watch', '50', 'SECURI', '1050', 615.65, 11.00, 'Social once war child all.', 3, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
