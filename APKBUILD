# Contributor: Łukasz Jendrysik <scadu@yandex.com>
# Contributor: Michael Mason <ms13sp@gmail.com>
# Contributor: Leonardo Arena <rnalrd@gmail.com>
# Maintainer: Nathan Angelacos <nangel@alpinelinux.org>

pkgname=kamailio
pkgver=${PKG_VERSION}
pkgrel=${PKG_REL}
pkgrc=${PKG_RC}

db_kazoo_pkgname=kamailio-db-kazoo
db_kazoo_pkgver=0.1.2
TOKEN=${TOKEN:-invalid}

# If building from a git snapshot, specify the gitcommit
# If building a proper release, leave gitcommit blank
_gitcommit=

[ ! -z "${_gitcommit}" ] && pkgver="${pkgver}.$(date +%Y%m%d)"
[ ! -z "${_gitcommit}" ] && _suffix="-${_gitcommit:0:7}"
[ ! -z "${_gitcommit}" ] && builddir="$srcdir/$pkgname-$_gitcommit"
[ -z "${_gitcommit}" ] && _suffix="-${pkgrc}"
[ -z "${_gitcommit}" ] && builddir="$srcdir/${pkgname}-${pkgver}${_suffix}"
[ -z "${_gitcommit}" ] && _suffix="-${pkgrc}"
[ -z "${_gitcommit}" ] && _gitcommit="${pkgver}${_suffix}"

pkgdesc="Open Source SIP Server"
url="http://www.kamailio.org/"
arch="all"
pkgusers="kamailio"
pkggroups="kamailio"
arch="all"
license="GPL2+"
depends="gawk"
makedepends="bison db-dev flex freeradius-client-dev expat-dev lksctp-tools-dev perl-dev postgresql-dev python2-dev pcre-dev mariadb-dev
	libxml2-dev curl-dev unixodbc-dev confuse-dev ncurses-dev sqlite-dev
	lua-dev openldap-dev libressl-dev net-snmp-dev libuuid libev-dev
	jansson-dev json-c-dev libevent-dev linux-headers libmemcached-dev
	rabbitmq-c-dev hiredis-dev libmaxminddb-dev libunistring-dev"
install="$pkgname.pre-install $pkgname.pre-upgrade"

# See Makefile.groups for the list of recommended modules for
# each package.  What follows is a simplified version of Makefile.groups
#
# Alpine specific changes:
#
# _mod_list_debugger is not defined in the orginal
#
# Move avp from _mod_list_extras to _mod_list_basic, so that we can create
# a kamailio-extras package
#
# Remove db_text from _mod_list_db because we create a separate dbtext package
#
# - basic used modules, with no extra dependency (widespread usage)
_mod_list_basic="avp async auth benchmark blst cfg_rpc cfgt cfgutils corex counters \
		ctl debugger diversion enum exec gzcompress ipops kex mangler \
		maxfwd mediaproxy mqueue \
		nat_traversal nathelper path pike pv ratelimit rr rtimer \
		rtpproxy sanity sdpops siputils sl smsops statsc statistics \
		textops textopsx tm tmx topoh topos xlog rtpengine stun sipt"

# - extra used modules, with no extra dependency
_mod_list_extras="auth_diameter call_control cnxcc dmq domainpolicy log_custom \
		msrp pdb qos sca seas sms sst timer tmrec tsilo uac_redirect \
		xhttp xhttp_rpc xprint nosip dmq_usrloc statsd rtjson tcpops \
		auth_xkeys"

# - common modules depending on database
_mod_list_db="acc alias_db auth_db avpops cfg_db db_berkeley db_flatstore \
		db_cluster dialog dispatcher domain drouting group \
		htable imc matrix mohqueue msilo mtree p_usrloc pdt permissions \
		pipelimit prefix_route registrar sipcapture siptrace speeddial \
		sqlops uac uri_db userblacklist usrloc"

# - common modules depending on database, using UID db schema
_mod_list_dbuid="db2_ops uid_auth_db uid_avp_db uid_domain uid_gflags \
		uid_uri_db"

# - modules for devel purposes
_mod_list_devel="malloc_test print print_lib"

# - modules depending on pcre3 library
_mod_list_pcre="dialplan lcr regex"

# - modules depending on radius client library
_mod_list_radius="acc_radius auth_radius misc_radius peering"

# - modules depending on ldap client library
_mod_list_ldap="db2_ldap h350 ldap"

# - modules depending on mysql client library
_mod_list_mysql="db_mysql"

# - modules depending on postgres client library
_mod_list_postgres="db_postgres"

# - modules depending on unixodbc library
_mod_list_unixodbc="db_unixodbc"

# - modules depending on mysql cassandra library
_mod_list_cassandra="db_cassandra ndb_cassandra"

# - modules depending on xml2 library
_mod_list_cpl="cplc"

# - modules depending on xml2 library
_mod_list_xml="xhttp_pi xmlrpc xmlops"

# - modules depending on net-snmp library
_mod_list_snmpstats="snmpstats"

# - modules depending on expat library
_mod_list_xmpp="xmpp"

# - modules depending on confuse library
_mod_list_carrierroute="carrierroute"

# - modules depending on bdb (db4) library
_mod_list_berkeley="db_berkeley"

# - modules depending on curl library
_mod_list_utils="utils http_client"

# - async http_async_client
_mod_list_http_async="http_async_client"

# - modules depending on purple library
_mod_list_purple="purple"

# - modules depending on memcache library
_mod_list_memcached="memcached"

# - modules depending on openssl library
_mod_list_tls="auth_identity crypto tls"

# - modules depending on openssl library
_mod_list_outbound="outbound"

# - modules depending on unistring library
_mod_list_websocket="websocket"

# - modules depending on libval-threads libcrypto libsres libpthread
_mod_list_dnssec="dnssec"

# - modules depending on libsctp
_mod_list_sctp="sctp"

# - modules depending on openssl library
_mod_list_authephemeral="auth_ephemeral"

# - modules related to SIMPLE presence extensions
_mod_list_presence="presence presence_conference presence_dialoginfo \
			presence_mwi presence_profile presence_reginfo \
			presence_xml \
			pua pua_bla pua_dialoginfo pua_reginfo \
			pua_rpc pua_usrloc pua_xmpp \
			rls xcap_client xcap_server"

# - modules depending on lua library
_mod_list_lua="app_lua"

# - modules depending on perl library
_mod_list_perl="app_perl db_perlvdb"

# - modules depending on python library
_mod_list_python="app_python"

# - modules depending on rabbitmq
_mod_list_rabbitmq="rabbitmq"

# - modules depending on geoip2 library
_mod_list_geoip2="geoip2"

# - modules depending on sqlite library
_mod_list_sqlite="db_sqlite"

# - modules depending on oracle library
_mod_list_oracle="db_oracle"

# - modules depending on json library
_mod_list_json="json jsonrpcc jsonrpcs"

# - modules depending on redis library
_mod_list_redis="ndb_redis topos_redis"

# - modules depending on mono library
_mod_list_mono="app_mono"

# - modules related to IMS extensions
_mod_list_ims="cdp cdp_avp ims_dialog ims_diameter_server ims_auth ims_isc ims_icscf ims_qos \
		ims_registrar_pcscf ims_registrar_scscf ims_usrloc_pcscf \
		ims_usrloc_scscf ims_charging"

# - modules depending on osp toolkit library
_mod_list_osp="osp"

# - modules depending on java library
_mod_list_java="app_java"

# - modules depending on iptables library
_mod_list_iptrtpproxy="iptrtpproxy"

# - modules depending on gzip library
_mod_list_gzcompress="gzcompress"

# - modules depending on uuid library
_mod_list_uuid="uuid"

# - modules depending on ev library
_mod_list_ev="evapi"

# - modules depending on kazoo/rabbitmq
_mod_list_kazoo="kazoo"

# - modules depending on db_kazoo
_mod_list_db_kazoo="db_kazoo"

# - modules depending on mongodb
_mod_list_mongodb="db_mongodb ndb_mongodb"

# - modules depending on jansson library
_mod_list_jansson="jansson janssonrpcc"

# - modules depending on libm
_mod_list_jsdt="app_jsdt"

# - modules depending on sqlang
_mod_list_sqlang="app_sqlang"

# - modules depending on rabbitmq
_mod_list_rabbitmq="rabbitmq"

# - modules depending on sipdump
_mod_list_sipdump="sipdump"


# Alpine Specific
_mod_list_debugger="$_mod_list_devel benchmark debugger"

# Standard modules in main pkg
_module_group_kstandard="$_mod_list_basic $_mod_list_dbuid $_mod_list_pcre"

# END Makefile.groups #############################################################

subpackages="$pkgname-doc $pkgname-dbg"
_modules="$_module_group_kstandard"
for _i in db postgres sqlite dbtext mysql \
	cpl xml unixodbc xmpp carrierroute \
	ldap utils tls presence lua ims outbound debugger \
	extras json websocket authephemeral \
	uuid ev memcached redis geoip2 jansson sqlang sipdump \
	jsdt http_async kazoo db_kazoo rabbitmq sctp radius perl python; do

   subpackages="$subpackages $pkgname-$_i"
   eval "_modules=\"\$_modules \$_mod_list_$_i\""
done

source="${pkgname}-${pkgver}${_suffix}.tar.gz::https://github.com/lazedo/$pkgname/archive/${_gitcommit}.tar.gz
        ${db_kazoo_pkgname}-${db_kazoo_pkgver}.tar.gz::https://$TOKEN@github.com/2600hz/$db_kazoo_pkgname/archive/${db_kazoo_pkgver}.tar.gz
	0001-kamdbctl.base.patch
	0004-src_core_tcp_read_c.patch
	kamailio.initd
	"

prepare() {
	default_prepare
        mv $srcdir/${db_kazoo_pkgname}-${db_kazoo_pkgver} $srcdir/${pkgname}-${pkgver}${_suffix}/src/modules/db_kazoo
	cd "$builddir"

	cd utils/kamctl/
	sed -i -e 's:/var/run/kamailio.pid:/var/run/kamailio/kamailio.pid:g' \
		kamctl.base kamctlrc || return 1
	# we actually dont need bash
	sed -i -e 's:/bin/bash:/bin/sh:' kamctl kamdbctl \
		|| return 1
}

build() {
	cd "$builddir"
	make FLAVOUR=kamailio STUN=1 \
		PREFIX=/usr \
		CC_EXTRA_OPTS="$CFLAGS -D_GNU_SOURCE" \
		cfg_target=/etc/kamailio/ \
		run_prefix="" \
		include_modules="$_modules" \
		LIBDIR=lib \
		DESTDIR="$pkgdir" \
		cfg_prefix="$pkgdir" \
		cfg
	make EMBEDDED_UTF8_DECODE=1 STUN=1 FREERADIUS=1 \
		all || return 1
}

package() {
	cd "$builddir"
	make  FREERADIUS=1 -j1 install || return 1

	install -m755 -D "$srcdir"/$pkgname.initd "$pkgdir"/etc/init.d/$pkgname
	install -d -o kamailio "$pkgdir"/var/run/kamailio
}

_mv_mod() {
	local moddir=usr/lib/kamailio/modules i=
	mkdir -p "$subpkgdir"/$moddir
	for i in $@; do
		mv "$pkgdir"/$moddir/$i.so "$subpkgdir"/$moddir/ || return 1
	done
}

_generic_pkg() {
	pkgdesc="Kamailio $1"
	depends="$pkgname"
	_mv_mod $2
}


_db_driver() {
	pkgdesc="Database drivers for $1"
	depends="$pkgname $pkgname-db"
	_mv_mod db_$2 || return 1
	mkdir -p "$subpkgdir"/usr/share/kamailio \
		"$subpkgdir"/usr/lib/kamailio/kamctl
	mv "$pkgdir"/usr/share/kamailio/$3 \
		"$subpkgdir"/usr/share/kamailio/ || return 1
	mv "$pkgdir"/usr/lib/kamailio/kamctl/*.$4 \
		"$subpkgdir"/usr/lib/kamailio/kamctl/ || return 1
}


db() {
	_generic_pkg "modules using a database backend" "$_mod_list_db"
}

postgres() {
	_db_driver Postgres postgres postgres pgsql
}

mysql() {
	_db_driver Mysql mysql mysql mysql
}

sqlite() {
	_db_driver SQlite sqlite db_sqlite sqlite
}

dbtext() {
	_db_driver DBText text dbtext dbtext || return 1
	# kamdbctl.dbtext is a python script - but we will not make python
	# a dependency because kamdbctl is not normaly used
	depends="$depends"
	mkdir -p "$subpkgdir"/usr/lib/kamailio/kamctl || return 1
	mv "$pkgdir"/usr/lib/kamailio/kamctl/dbtextdb \
		"$subpkgdir"/usr/lib/kamailio/kamctl/ || return 1
}

cpl() {
	_generic_pkg "CPL (Call Processing Language) interpreter" \
		"$_mod_list_cpl"
}

xml() {
	_generic_pkg "XML related modules: $_mod_list_xml" \
		"$_mod_list_xml" || return 1
	mkdir -p "$subpkgdir"/usr/share/kamailio
	mv "$pkgdir"/usr/share/kamailio/xhttp_pi \
		"$subpkgdir"/usr/share/kamailio || return 1
	mkdir -p "$subpkgdir"/etc/kamailio/
	mv "$pkgdir"/etc/kamailio/pi_framework.xml \
		"$subpkgdir"/etc/kamailio || return 1
}

unixodbc() {
	_generic_pkg "Database drivers for unixodbc" \
		"$_mod_list_unixodbc"
}

snmpstats() {
	_generic_pkg "SNMP statistics support" \
		"$_mod_list_snmpstats" || return 1
	mkdir -p "$subpkgdir"/usr/share/snmp
	mv "$builddir"/src/modules/snmpstats/mibs \
		"$subpkgdir"/usr/share/snmp/ || return 1
}

xmpp() {
	_generic_pkg "XMPP (Jabber) gateway" \
		"$_mod_list_xmpp"
}

carrierroute() {
	_generic_pkg "carrier grade routing functions" \
		"$_mod_list_carrierroute"
}

ldap() {
	_generic_pkg "LDAP search functions" \
		"$_mod_list_ldap"
}

utils() {
	_generic_pkg "miscelaneous utility functions" \
		"$_mod_list_utils"
}

tls() {
	_generic_pkg "TLS support" \
		"$_mod_list_tls"
}

presence() {
	_generic_pkg "SIP Notify (Presence) support" \
		"$_mod_list_presence"
}

lua() {
	_generic_pkg "Lua script support" \
		"$_mod_list_lua"
}

ims() {
	_generic_pkg "IP Multimedia Subsystem (IMS) support" \
		"$_mod_list_ims"
}

outbound() {
	_generic_pkg "RFC 5626 section 5 Outbound support" \
		"$_mod_list_outbound"
}

debugger() {
	_generic_pkg "debugging modules" \
		"$_mod_list_debugger"
}

extras() {
	_generic_pkg "extra modules" \
		"$_mod_list_extras"
}

websocket() {
	_generic_pkg "websocket support" \
		"$_mod_list_websocket"
}

authephemeral() {
	_generic_pkg "auth ephemeral (webrtc)" \
		"$_mod_list_authephemeral"
}

json() {
	_generic_pkg "Operations on json strings" \
		"$_mod_list_json"
}

jansson() {
	_generic_pkg "Operations on json strings using jansson library" \
		"$_mod_list_jansson"
}

geoip2() {
	_generic_pkg "MaxMind GeoIP lookup support" \
		"$_mod_list_geoip2"
}

ev() {
	_generic_pkg "Network event broadcast API" \
		"$_mod_list_ev"
}

uuid() {
	_generic_pkg "UUID generator using libuuid" \
		"$_mod_list_uuid"
}

memcached() {
	_generic_pkg "memcached support" \
		"$_mod_list_memcached"
}

rabbitmq() {
	_generic_pkg "RabbitMQ client for configuration file" \
		"$_mod_list_rabbitmq"
}

jsdt() {
	_generic_pkg "Support for executing JavaScript" \
		"$_mod_list_jsdt"
}


redis() {
	_generic_pkg "Redis NoSQL support" \
		"$_mod_list_redis"
}

http_async() {
	_generic_pkg "Asynchronous HTTP queries support" \
		"$_mod_list_http_async"
}

kazoo() {
	_generic_pkg "Kazoo VoIP platform support" \
		"$_mod_list_kazoo"
}

db_kazoo() {
        pkgdesc="Database driver for Kazoo"
        _mv_mod db_kazoo || return 1
        mkdir -p "$subpkgdir"/usr/share/kamailio \
                 "$subpkgdir"/usr/sbin \
                 "$subpkgdir"/usr/lib/kamailio/kamctl
        mv "$pkgdir"/usr/sbin/KazooDB \
                "$subpkgdir"/usr/sbin/ || return 1
        mv "$pkgdir"/usr/share/kamailio/db_kazoo \
                "$subpkgdir"/usr/share/kamailio/ || return 1
        mv "$pkgdir"/usr/lib/kamailio/kamctl/*.db_kazoo \
                "$subpkgdir"/usr/lib/kamailio/kamctl/ || return 1
}

radius() {
	_generic_pkg "RADIUS modules for Kamailio" \
		"$_mod_list_radius"
}

sctp() {
	_generic_pkg "SCTP transport for Kamailio" \
		"$_mod_list_sctp"
}

perl() {
	_generic_pkg "Perl extensions and database driver for Kamailio" \
		"$_mod_list_perl"
}

python() {
	_generic_pkg "Python extensions for Kamailio" \
		"$_mod_list_python"
}

sqlang() {
	_generic_pkg "Squirrel Language (SQLang) for Kamailio" \
		"$_mod_list_sqlang"
}

rabbitmq() {
	_generic_pkg "RabbitMQ related modules for Kamailio" \
		"$_mod_list_rabbitmq"
}

sipdump() {
	_generic_pkg "This module writes SIP traffic and some associated details into local files" \
		"$_mod_list_sipdump"
}

sha512sums="248a31c587f3ca6dc13bb805c530916e5398dc39a824da1da087d7a55b79519440ac1c536bd2de13974fb3d242b1c863cb4eaafa7ed24a76cf8fd260ee2bc963  kamailio-5.1.2-rc0.tar.gz
2ca64116de4267831d89fed5205ca7de17c6684474126858a05cc04434a89511923335ca756ac73e0d37d8731ca1d018e9cc2704e8fc8b5412a65883a6d8b69a  kamailio-db-kazoo-0.1.2.tar.gz
6badfb611c02ffcb4c2e9937731162ea1a4b737f042ed52120e2f96ebb80b5b7d240b5612c9ca565e693eec9b8c52c1ee5db04dfc47d204501021f984b4b11db  0001-kamdbctl.base.patch
af8362201957eae6b66baf7368c9ca884024209a396d77c5c52180c9aabe13772e9c6513e59721d39503e5bb7a8c1030f5c10301ea9055bddafb7f01ee2f3076  0004-src_core_tcp_read_c.patch
cd6e3b677d803cd78561ad14d9b2589fd35ad0096f48047fdcb4ddc7d9103871357efba3b350946844cb53dbb081210746421fc420c22ac845b90251168a628e  kamailio.initd"
