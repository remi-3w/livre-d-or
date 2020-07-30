-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wp` DEFAULT CHARACTER SET utf8 ;
USE `wp` ;

-- -----------------------------------------------------
-- Table `wp`.`tp_actionscheduler_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_actionscheduler_actions` (
  `action_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hook` VARCHAR(191) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `scheduled_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` VARCHAR(191) NULL DEFAULT NULL,
  `schedule` LONGTEXT NULL DEFAULT NULL,
  `group_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `attempts` INT(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` VARCHAR(8000) NULL DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  INDEX `hook` (`hook` ASC) VISIBLE,
  INDEX `status` (`status` ASC) VISIBLE,
  INDEX `scheduled_date_gmt` (`scheduled_date_gmt` ASC) VISIBLE,
  INDEX `args` (`args` ASC) VISIBLE,
  INDEX `group_id` (`group_id` ASC) VISIBLE,
  INDEX `last_attempt_gmt` (`last_attempt_gmt` ASC) VISIBLE,
  INDEX `claim_id` (`claim_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_actionscheduler_claims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_actionscheduler_claims` (
  `claim_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_created_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  INDEX `date_created_gmt` (`date_created_gmt` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_actionscheduler_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_actionscheduler_groups` (
  `group_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  INDEX `slug` (`slug`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_actionscheduler_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_actionscheduler_logs` (
  `log_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action_id` BIGINT(20) UNSIGNED NOT NULL,
  `message` TEXT NOT NULL,
  `log_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  INDEX `action_id` (`action_id` ASC) VISIBLE,
  INDEX `log_date_gmt` (`log_date_gmt` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_commentmeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_commentmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  INDEX `comment_id` (`comment_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(191) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_comments` (
  `comment_ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` TINYTEXT NOT NULL,
  `comment_author_email` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_author_url` VARCHAR(200) NOT NULL DEFAULT '',
  `comment_author_IP` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` TEXT NOT NULL,
  `comment_karma` INT(11) NOT NULL DEFAULT '0',
  `comment_approved` VARCHAR(20) NOT NULL DEFAULT '1',
  `comment_agent` VARCHAR(255) NOT NULL DEFAULT '',
  `comment_type` VARCHAR(20) NOT NULL DEFAULT '',
  `comment_parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  INDEX `comment_post_ID` (`comment_post_ID` ASC) VISIBLE,
  INDEX `comment_approved_date_gmt` (`comment_approved` ASC, `comment_date_gmt` ASC) VISIBLE,
  INDEX `comment_date_gmt` (`comment_date_gmt` ASC) VISIBLE,
  INDEX `comment_parent` (`comment_parent` ASC) VISIBLE,
  INDEX `comment_author_email` (`comment_author_email`(10) ASC) VISIBLE,
  INDEX `woo_idx_comment_type` (`comment_type` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_links` (
  `link_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` VARCHAR(255) NOT NULL DEFAULT '',
  `link_name` VARCHAR(255) NOT NULL DEFAULT '',
  `link_image` VARCHAR(255) NOT NULL DEFAULT '',
  `link_target` VARCHAR(25) NOT NULL DEFAULT '',
  `link_description` VARCHAR(255) NOT NULL DEFAULT '',
  `link_visible` VARCHAR(20) NOT NULL DEFAULT 'Y',
  `link_owner` BIGINT(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` INT(11) NOT NULL DEFAULT '0',
  `link_updated` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` VARCHAR(255) NOT NULL DEFAULT '',
  `link_notes` MEDIUMTEXT NOT NULL,
  `link_rss` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  INDEX `link_visible` (`link_visible` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_mailchimp_carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_mailchimp_carts` (
  `id` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `cart` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_mailchimp_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_mailchimp_jobs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `obj_id` TEXT NULL DEFAULT NULL,
  `job` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_options` (
  `option_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` VARCHAR(191) NOT NULL DEFAULT '',
  `option_value` LONGTEXT NOT NULL,
  `autoload` VARCHAR(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE INDEX `option_name` (`option_name` ASC) VISIBLE,
  INDEX `autoload` (`autoload` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1099
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_postmeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_postmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  INDEX `post_id` (`post_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 432
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_posts` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` LONGTEXT NOT NULL,
  `post_title` TEXT NOT NULL,
  `post_excerpt` TEXT NOT NULL,
  `post_status` VARCHAR(20) NOT NULL DEFAULT 'publish',
  `comment_status` VARCHAR(20) NOT NULL DEFAULT 'open',
  `ping_status` VARCHAR(20) NOT NULL DEFAULT 'open',
  `post_password` VARCHAR(255) NOT NULL DEFAULT '',
  `post_name` VARCHAR(200) NOT NULL DEFAULT '',
  `to_ping` TEXT NOT NULL,
  `pinged` TEXT NOT NULL,
  `post_modified` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` LONGTEXT NOT NULL,
  `post_parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` VARCHAR(255) NOT NULL DEFAULT '',
  `menu_order` INT(11) NOT NULL DEFAULT '0',
  `post_type` VARCHAR(20) NOT NULL DEFAULT 'post',
  `post_mime_type` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_count` BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `post_name` (`post_name`(191) ASC) VISIBLE,
  INDEX `type_status_date` (`post_type` ASC, `post_status` ASC, `post_date` ASC, `ID` ASC) VISIBLE,
  INDEX `post_parent` (`post_parent` ASC) VISIBLE,
  INDEX `post_author` (`post_author` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_term_relationships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_term_relationships` (
  `object_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`, `term_taxonomy_id`),
  INDEX `term_taxonomy_id` (`term_taxonomy_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_term_taxonomy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_term_taxonomy` (
  `term_taxonomy_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` VARCHAR(32) NOT NULL DEFAULT '',
  `description` LONGTEXT NOT NULL,
  `parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE INDEX `term_id_taxonomy` (`term_id` ASC, `taxonomy` ASC) VISIBLE,
  INDEX `taxonomy` (`taxonomy` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_termmeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_termmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  INDEX `term_id` (`term_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_terms` (
  `term_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL DEFAULT '',
  `slug` VARCHAR(200) NOT NULL DEFAULT '',
  `term_group` BIGINT(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  INDEX `slug` (`slug`(191) ASC) VISIBLE,
  INDEX `name` (`name`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_usermeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_usermeta` (
  `umeta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 78
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_users` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` VARCHAR(60) NOT NULL DEFAULT '',
  `user_pass` VARCHAR(255) NOT NULL DEFAULT '',
  `user_nicename` VARCHAR(50) NOT NULL DEFAULT '',
  `user_email` VARCHAR(100) NOT NULL DEFAULT '',
  `user_url` VARCHAR(100) NOT NULL DEFAULT '',
  `user_registered` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` VARCHAR(255) NOT NULL DEFAULT '',
  `user_status` INT(11) NOT NULL DEFAULT '0',
  `display_name` VARCHAR(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  INDEX `user_login_key` (`user_login` ASC) VISIBLE,
  INDEX `user_nicename` (`user_nicename` ASC) VISIBLE,
  INDEX `user_email` (`user_email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_admin_note_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_admin_note_actions` (
  `action_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `note_id` BIGINT(20) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `label` VARCHAR(255) NOT NULL,
  `query` LONGTEXT NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `is_primary` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  INDEX `note_id` (`note_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_admin_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_admin_notes` (
  `note_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `locale` VARCHAR(20) NOT NULL,
  `title` LONGTEXT NOT NULL,
  `content` LONGTEXT NOT NULL,
  `icon` VARCHAR(200) NOT NULL,
  `content_data` LONGTEXT NULL DEFAULT NULL,
  `status` VARCHAR(200) NOT NULL,
  `source` VARCHAR(200) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` DATETIME NULL DEFAULT NULL,
  `is_snoozable` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_category_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_category_lookup` (
  `category_tree_id` BIGINT(20) UNSIGNED NOT NULL,
  `category_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`category_tree_id`, `category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_customer_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_customer_lookup` (
  `customer_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `username` VARCHAR(60) NOT NULL DEFAULT '',
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `date_last_active` TIMESTAMP NULL DEFAULT NULL,
  `date_registered` TIMESTAMP NULL DEFAULT NULL,
  `country` CHAR(2) NOT NULL DEFAULT '',
  `postcode` VARCHAR(20) NOT NULL DEFAULT '',
  `city` VARCHAR(100) NOT NULL DEFAULT '',
  `state` VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_downloadable_product_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_downloadable_product_permissions` (
  `permission_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `download_id` VARCHAR(36) NOT NULL,
  `product_id` BIGINT(20) UNSIGNED NOT NULL,
  `order_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` VARCHAR(200) NOT NULL,
  `user_email` VARCHAR(200) NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `downloads_remaining` VARCHAR(9) NULL DEFAULT NULL,
  `access_granted` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` DATETIME NULL DEFAULT NULL,
  `download_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  INDEX `download_order_key_product` (`product_id` ASC, `order_id` ASC, `order_key`(16) ASC, `download_id` ASC) VISIBLE,
  INDEX `download_order_product` (`download_id` ASC, `order_id` ASC, `product_id` ASC) VISIBLE,
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `user_order_remaining_expires` (`user_id` ASC, `order_id` ASC, `downloads_remaining` ASC, `access_expires` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_download_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_download_log` (
  `download_log_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `permission_id` BIGINT(20) UNSIGNED NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `user_ip_address` VARCHAR(100) NULL DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  INDEX `permission_id` (`permission_id` ASC) VISIBLE,
  INDEX `timestamp` (`timestamp` ASC) VISIBLE,
  CONSTRAINT `fk_tp_wc_download_log_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `wp`.`tp_woocommerce_downloadable_product_permissions` (`permission_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_order_coupon_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_order_coupon_lookup` (
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  `coupon_id` BIGINT(20) UNSIGNED NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`, `coupon_id`),
  INDEX `coupon_id` (`coupon_id` ASC) VISIBLE,
  INDEX `date_created` (`date_created` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_order_product_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_order_product_lookup` (
  `order_item_id` BIGINT(20) UNSIGNED NOT NULL,
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  `product_id` BIGINT(20) UNSIGNED NOT NULL,
  `variation_id` BIGINT(20) UNSIGNED NOT NULL,
  `customer_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` INT(11) NOT NULL,
  `product_net_revenue` DOUBLE NOT NULL DEFAULT '0',
  `product_gross_revenue` DOUBLE NOT NULL DEFAULT '0',
  `coupon_amount` DOUBLE NOT NULL DEFAULT '0',
  `tax_amount` DOUBLE NOT NULL DEFAULT '0',
  `shipping_amount` DOUBLE NOT NULL DEFAULT '0',
  `shipping_tax_amount` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `date_created` (`date_created` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_order_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_order_stats` (
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  `parent_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` INT(11) NOT NULL DEFAULT '0',
  `total_sales` DOUBLE NOT NULL DEFAULT '0',
  `tax_total` DOUBLE NOT NULL DEFAULT '0',
  `shipping_total` DOUBLE NOT NULL DEFAULT '0',
  `net_total` DOUBLE NOT NULL DEFAULT '0',
  `returning_customer` TINYINT(1) NULL DEFAULT NULL,
  `status` VARCHAR(200) NOT NULL,
  `customer_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `date_created` (`date_created` ASC) VISIBLE,
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `status` (`status`(191) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_order_tax_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_order_tax_lookup` (
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  `tax_rate_id` BIGINT(20) UNSIGNED NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` DOUBLE NOT NULL DEFAULT '0',
  `order_tax` DOUBLE NOT NULL DEFAULT '0',
  `total_tax` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`, `tax_rate_id`),
  INDEX `tax_rate_id` (`tax_rate_id` ASC) VISIBLE,
  INDEX `date_created` (`date_created` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_product_meta_lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_product_meta_lookup` (
  `product_id` BIGINT(20) NOT NULL,
  `sku` VARCHAR(100) NULL DEFAULT '',
  `virtual` TINYINT(1) NULL DEFAULT '0',
  `downloadable` TINYINT(1) NULL DEFAULT '0',
  `min_price` DECIMAL(19,4) NULL DEFAULT NULL,
  `max_price` DECIMAL(19,4) NULL DEFAULT NULL,
  `onsale` TINYINT(1) NULL DEFAULT '0',
  `stock_quantity` DOUBLE NULL DEFAULT NULL,
  `stock_status` VARCHAR(100) NULL DEFAULT 'instock',
  `rating_count` BIGINT(20) NULL DEFAULT '0',
  `average_rating` DECIMAL(3,2) NULL DEFAULT '0.00',
  `total_sales` BIGINT(20) NULL DEFAULT '0',
  `tax_status` VARCHAR(100) NULL DEFAULT 'taxable',
  `tax_class` VARCHAR(100) NULL DEFAULT '',
  PRIMARY KEY (`product_id`),
  INDEX `virtual` (`virtual` ASC) VISIBLE,
  INDEX `downloadable` (`downloadable` ASC) VISIBLE,
  INDEX `stock_status` (`stock_status` ASC) VISIBLE,
  INDEX `stock_quantity` (`stock_quantity` ASC) VISIBLE,
  INDEX `onsale` (`onsale` ASC) VISIBLE,
  INDEX `min_max_price` (`min_price` ASC, `max_price` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_tax_rate_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_tax_rate_classes` (
  `tax_rate_class_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL DEFAULT '',
  `slug` VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE INDEX `slug` (`slug`(191) ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wc_webhooks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wc_webhooks` (
  `webhook_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(200) NOT NULL,
  `name` TEXT NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NOT NULL,
  `delivery_url` TEXT NOT NULL,
  `secret` TEXT NOT NULL,
  `topic` VARCHAR(200) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` SMALLINT(4) NOT NULL,
  `failure_count` SMALLINT(10) NOT NULL DEFAULT '0',
  `pending_delivery` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_api_keys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_api_keys` (
  `key_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `permissions` VARCHAR(10) NOT NULL,
  `consumer_key` CHAR(64) NOT NULL,
  `consumer_secret` CHAR(43) NOT NULL,
  `nonces` LONGTEXT NULL DEFAULT NULL,
  `truncated_key` CHAR(7) NOT NULL,
  `last_access` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  INDEX `consumer_key` (`consumer_key` ASC) VISIBLE,
  INDEX `consumer_secret` (`consumer_secret` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_attribute_taxonomies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_attribute_taxonomies` (
  `attribute_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_name` VARCHAR(200) NOT NULL,
  `attribute_label` VARCHAR(200) NULL DEFAULT NULL,
  `attribute_type` VARCHAR(20) NOT NULL,
  `attribute_orderby` VARCHAR(20) NOT NULL,
  `attribute_public` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  INDEX `attribute_name` (`attribute_name`(20) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_log` (
  `log_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `level` SMALLINT(4) NOT NULL,
  `source` VARCHAR(200) NOT NULL,
  `message` LONGTEXT NOT NULL,
  `context` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  INDEX `level` (`level` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_order_itemmeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_order_itemmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_item_id` BIGINT(20) UNSIGNED NOT NULL,
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  INDEX `order_item_id` (`order_item_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(32) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_order_items` (
  `order_item_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_item_name` TEXT NOT NULL,
  `order_item_type` VARCHAR(200) NOT NULL DEFAULT '',
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_item_id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_payment_tokenmeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_payment_tokenmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_token_id` BIGINT(20) UNSIGNED NOT NULL,
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  INDEX `payment_token_id` (`payment_token_id` ASC) VISIBLE,
  INDEX `meta_key` (`meta_key`(32) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_payment_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_payment_tokens` (
  `token_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gateway_id` VARCHAR(200) NOT NULL,
  `token` TEXT NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` VARCHAR(200) NOT NULL,
  `is_default` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_sessions` (
  `session_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_key` CHAR(32) NOT NULL,
  `session_value` LONGTEXT NOT NULL,
  `session_expiry` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE INDEX `session_key` (`session_key` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_shipping_zone_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_shipping_zone_locations` (
  `location_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone_id` BIGINT(20) UNSIGNED NOT NULL,
  `location_code` VARCHAR(200) NOT NULL,
  `location_type` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `location_id` (`location_id` ASC) VISIBLE,
  INDEX `location_type_code` (`location_type`(10) ASC, `location_code`(20) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_shipping_zone_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_shipping_zone_methods` (
  `zone_id` BIGINT(20) UNSIGNED NOT NULL,
  `instance_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `method_id` VARCHAR(200) NOT NULL,
  `method_order` BIGINT(20) UNSIGNED NOT NULL,
  `is_enabled` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_shipping_zones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_shipping_zones` (
  `zone_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone_name` VARCHAR(200) NOT NULL,
  `zone_order` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`zone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_tax_rate_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_tax_rate_locations` (
  `location_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_code` VARCHAR(200) NOT NULL,
  `tax_rate_id` BIGINT(20) UNSIGNED NOT NULL,
  `location_type` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `tax_rate_id` (`tax_rate_id` ASC) VISIBLE,
  INDEX `location_type_code` (`location_type`(10) ASC, `location_code`(20) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_woocommerce_tax_rates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_woocommerce_tax_rates` (
  `tax_rate_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_rate_country` VARCHAR(2) NOT NULL DEFAULT '',
  `tax_rate_state` VARCHAR(200) NOT NULL DEFAULT '',
  `tax_rate` VARCHAR(8) NOT NULL DEFAULT '',
  `tax_rate_name` VARCHAR(200) NOT NULL DEFAULT '',
  `tax_rate_priority` BIGINT(20) UNSIGNED NOT NULL,
  `tax_rate_compound` INT(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` INT(1) NOT NULL DEFAULT '1',
  `tax_rate_order` BIGINT(20) UNSIGNED NOT NULL,
  `tax_rate_class` VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  INDEX `tax_rate_country` (`tax_rate_country` ASC) VISIBLE,
  INDEX `tax_rate_state` (`tax_rate_state`(2) ASC) VISIBLE,
  INDEX `tax_rate_class` (`tax_rate_class`(10) ASC) VISIBLE,
  INDEX `tax_rate_priority` (`tax_rate_priority` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


-- -----------------------------------------------------
-- Table `wp`.`tp_wpforms_tasks_meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp`.`tp_wpforms_tasks_meta` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `action` VARCHAR(255) NOT NULL,
  `data` LONGTEXT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
