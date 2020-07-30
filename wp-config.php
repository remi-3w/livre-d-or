<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wp' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'root' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'root' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'uv`;BrT//+cS)!h}h5~V[5s!wIR!6Jt A8Cy::u)/Qu1IBxK)=DHr3[BsE /DsJD' );
define( 'SECURE_AUTH_KEY',  '.HW1y=Tci|mhU|UfPz;&%AO?!Z[^lsZId;z@T5,KaS!n1;rAZe42J}[!A/{.4s[X' );
define( 'LOGGED_IN_KEY',    '`lw3U8$f.;nK[zx$yzuv}2< v:TQf?[D=hv{M-7||QLmA%/gB.T*c]{^2-FH592Z' );
define( 'NONCE_KEY',        'ccS~Yu3#Y&yg(?Cz[J!P:3MD)JE;-$Jh}:iP(qAkhmj%GFUpVJH4FFk4skRO#Ol}' );
define( 'AUTH_SALT',        '6SbEA@OhlgB+h!.,4^9*_(FO<<.X>1tliNCL9h16uA,I<lyMk@7/{13hfe3UlAhp' );
define( 'SECURE_AUTH_SALT', 'R2vDW6/,9Jw+&t|dQ^.fH)=0:Vk;=pXR_i^lkT<<|W30/vyGu@^$bG{qVQj81<}0' );
define( 'LOGGED_IN_SALT',   '`@ |^mMx0q^-Np:i4:&]uvMYjKK)ttW<VZWmBLzE2tofgP^9=`;`;fN2^+H#.+d<' );
define( 'NONCE_SALT',       '6xsnuu_A= y=R]?kBC|.65_4VCTTf6<kdgpRqg{5bh?,m5lq>. buGX{R@Vxq|]R' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'tp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
