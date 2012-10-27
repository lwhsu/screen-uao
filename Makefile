# New ports collection makefile for:	screen
# Date created:		2008-07-07
# Whom:			Yi-Jheng Lin <yzlin@cs.nctu.edu.tw>
#
# $Id: Makefile 356 2008-09-04 15:55:04Z yzlin $
#

CATEGORIES=	cs

MAINTAINER=	ta@cs.nctu.edu.tw
COMMENT=	A localized screen for adding some features

MASTERDIR=	${.CURDIR}/../../sysutils/screen

USE_PERL5_BUILD=	yes

.ifdef WITH_UAO
# with UAO support
BIG5UNI_TABLE=	uao250_big5uni.txt
EXTRA_PATCHES+=	${.CURDIR}/files/opt-uao
.else
# Big5-2003
BIG5UNI_TABLE=	big5uni.txt
.endif

post-build:
	@${PERL} ${.CURDIR}/files/conv.pl < ${.CURDIR}/files/${BIG5UNI_TABLE} > ${WRKSRC}/utf8encodings/18

.include "${MASTERDIR}/Makefile"
