var KCP_Script_SV      = true; // true 리얼, false 테스트
var KCP_DOMAIN         = KCP_Script_SV? "https://pay.kcp.co.kr/":"https://testpay.kcp.co.kr/";

var REAL_CHECK         = KCP_Script_SV? "Y":"N";
var KCP_NUA            = navigator.userAgent;
var KCP_PROTOCOL       = document.location.protocol;
var CHARSET            = "UTF-8";

/** 자바스크립트 자동 갱신 처리 - 시작 */
var KCP_Script_VERSION = "";

var KCP_EXE_SD_Use     = false; // 예외처리 없는 순수 exe 처리
var KCP_EXE_FO_Use     = false; // 전결제 EXE 사용
var KCP_EXE_FF_Use     = false; // 파이어폭스 EXE 사용

try
{
    if( KCP_EXE_Use )
    {
        KCP_EXE_SD_Use = true;
    }
}
catch(e){}

try
{
    if( KCP_PAY_EXE_Use )
    {
        KCP_EXE_FO_Use = true;
    }
}
catch(e){}

try
{
    if( KCP_PAY_EXE_FF )
    {
        KCP_EXE_FF_Use = true;
    }
}
catch(e){}

try
{
    var pattern = /^[A-Z0-9]+$/;
    var n       = 32;
    var str     = "";

    if(!/^[0-9]+$/.test(n)) n = 0x10;

    for(var i=0; i<n; i++)
    {
        var rnd = Math.round( Math.random() * 1000 );

        if( !pattern.test( String.fromCharCode(rnd) ) )
        {
            n = n+1;
        }
        else
        {
            str += String.fromCharCode(rnd);
        }
    }

    KCP_Script_VERSION = str;
}
catch(e){}
/** 자바스크립트 자동 갱신 처리 - 끝 */

function ChkBrowser()
{
    if( ( KCP_NUA.indexOf( 'MSIE'        ) > -1 ) ||
        ( KCP_NUA.indexOf( 'Trident/7.0' ) > -1 ) ||
        ( KCP_NUA.indexOf( 'Edge'        ) > -1 )
    )
    {
        return true;
    }

    return false;
}

function ChkBrowserType()
{
    var IE_CHECK = "Y";

    if( ( KCP_NUA.indexOf( 'MSIE'        ) > -1 ) ||
        ( KCP_NUA.indexOf( 'Trident/7.0' ) > -1 )
    )
    {
        IE_CHECK = "Y";
    }
    else if( KCP_NUA.indexOf( 'Edge' ) > -1 )
    {
        IE_CHECK = "E";
    }
    else if( KCP_NUA.indexOf( "Firefox" ) > -1 )
    {
        IE_CHECK = "F";
    }
    else if( KCP_NUA.indexOf( "OPR" ) > -1 )
    {
        IE_CHECK = "O";
    }
    else if( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 )
    {
        IE_CHECK = "S";
    }
    else if( KCP_NUA.indexOf( "Chrome" ) > -1 )
    {
        IE_CHECK = "C";
    }
    else
    {
        IE_CHECK = "N";
    }

    return IE_CHECK;
}

function ChkBrowserVer()
{
    try{
        var b_ver = 0;

        if( ( KCP_NUA.indexOf( 'MSIE'        ) > -1 ) ||
            ( KCP_NUA.indexOf( 'Trident/7.0' ) > -1 ) ||
            ( KCP_NUA.indexOf( 'Edge'        ) > -1 )
        )
        {
            b_ver = 999;
        }
        else if( KCP_NUA.indexOf( "Firefox" ) > -1 )
        {
            // Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0
            b_ver = Number( KCP_NUA.substr( KCP_NUA.indexOf( " Firefox/" ) + 9, 4 ) );
        }
        else if( KCP_NUA.indexOf( "OPR" ) > -1 )
        {
            // Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36 OPR/31.0.1889.174
            b_ver = Number( KCP_NUA.substr( KCP_NUA.indexOf( " OPR/" ) + 5, 4 ) );
        }
        else if( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 )
        {
            // Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2
            b_ver = Number( KCP_NUA.substr( KCP_NUA.indexOf( " Version/" ) + 9, 3 ) );
        }
        else if( KCP_NUA.indexOf( "Chrome" ) > -1 )
        {
            // Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36
            b_ver = Number( KCP_NUA.substr( KCP_NUA.indexOf( " Chrome/" ) + 8, 4 ) );
        }

        return b_ver;
    }
    catch(e)
    {
        return 999;
    }
}

if( ( ChkBrowserType() == "C" && ChkBrowserVer() >= 45 ) ||
    ( ChkBrowserType() == "E"                          ) ||
    ( ChkBrowserType() == "O"                          ) ||
    ( ChkBrowserType() == "F" && KCP_EXE_FF_Use        ) ||
    ( KCP_EXE_FO_Use                                   )    )
{
    document.write( "<style type='text/css'>                                                                                   " );
    document.write( "    .kcpTransDiv{                                                                                         " );
    document.write( "        filter:alpha(opacity=10); -khtml-opacity: 0.1; -moz-opacity: 0.1; opacity: 0.1; top:0px; left:0;  " );
    document.write( "        background-color:#000000; width:100%; height:100%; position:absolute; z-index:10000;              " );
    document.write( "    }                                                                                                     " );
    document.write( "</style>                                                                                                  " );

    document.write( "<div id='kcp_content'  style='background-color: white;'></div>"                                                                                              );
    document.write( "<div id='kcp_mask' class='kcpTransDiv' style='display:none'></div>"                                                                                          );
    document.write( "<div id='kcp_progress' class='spin_container'></div>"                                                                                                        );
    document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/ajax.js?"                        + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
    document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/cross_service/extends/util.js?"     + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );

    if( location.href.indexOf( "ralphlauren.co.kr" ) == -1 ) // ralphlauren 예외처리
    {
        document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/cross_service/extends/spin.min.js?" + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
    }

    if( typeof( m_Completepayment ) == "function" )
    {
        document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_exe.js?"          + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
    }
    else
    {
        if (KCP_EXE_SD_Use )
        {
            document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_exe_ex.js?"             + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
        }
        else
        {
            if( location.href.indexOf( "http://www.kbi.or.kr" ) > -1)
            {
                document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_AX_un.js?"              + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
            }
            else
            {
                document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_exe.js?"          + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
                //document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_AX_un.js?"              + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
            }
        }
    }
}
else
{
    document.write( "<script type=\"text/javascript\" src=\"" + KCP_DOMAIN + "plugin/js/payplus_AX_un.js?"              + KCP_Script_VERSION + "\" charset=\"EUC-KR\"></script>" );
}