var kcp_obj_ajaxInterval = null;
var responseReady        = true;

function kcp_createScriptElement( url )
{
    url = url||""; 
    
    var obj = null;
    
    try
    {
        obj = document.createElement( "<script type=\"text/javascript\" src=\"" + url + "\" charset=\"EUC-KR\"></script>" );
    }
    catch(e)
    {
        obj = document.createElement( "script" );
        
        // Mix Content 문제로 넣은 부분으로 SSL 부분이 처리되면 삭제 되야 합니다. ( 필수 )
        // 아래 방법은 exe 설치 또는 기타 오류일 때도 발생되는 이벤트 입니다.
        if( sv_port_check == 0 && KCP_PROTOCOL == "https:" )
        {
            obj.onerror = function(){
                if( ( ChkBrowserType() == "C" && ChkBrowserVer() >= 45 ) ||
                    ( ChkBrowserType() == "E"                          ) ||
                    ( ChkBrowserType() == "F"                          )    )
                {
                    kcp_appScriptAlert( ChkBrowserType() );
                }
            };
        }
        
        obj.type    = "text/javascript";
        obj.src     = url;
        obj.charset = "EUC-KR";
    }
    
    return obj;
}

function AjaxRequestJsonp( scriptURL, fn_res, fn_res_err )
{
    var kcp_nonce    = null;
    var callbackName = "FN_KcpDataCallBack" + Math.round( 100000 * Math.random() );
    var script       = kcp_createScriptElement( scriptURL + "&callback=" + callbackName );
    
    window[ callbackName ] = function( data )
    {
        try{
            delete window[ callbackName ];
        }catch(e){
            window[ callbackName ] = null;
        }
        clearInterval( kcp_obj_ajaxInterval );
        document.getElementById( "kcp_content" ).removeChild( script );
        responseJson( fn_res, callbackName, fn_res_err, data );
    };
    
    document.getElementById( "kcp_content" ).appendChild( script );
    
    kcp_nonce = ( new Date ).getTime();
    
    kcp_obj_ajaxInterval = setInterval( function()
    {
        if( ( ( new Date ).getTime() - kcp_nonce ) > 5000 )
        {
            document.getElementById( "kcp_content" ).removeChild( script );
            return responseErr( fn_res_err, callbackName, null, "timeout", null );
        }
    }, 1000 );
}

function responseJson( obj, callbackName, fn_res_err, data )
{
    if( !data && ( typeof data !== "string" || typeof data !== "object" ) )
    {
        return responseErr( fn_res_err, callbackName, null, "return data type error", null );
    }
    else
    {
        if( typeof data === "object" )
        {
            data = kcp_serialize(data);
        }
        var rvalidchars  = /^[\],:{}\s]*$/;
        var rvalidbraces = /(?:^|:|,)(?:\s*\[)+/g;
        var rvalidescape = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g;
        var rvalidtokens = /"[^"\\\r\n]*"|true|false|null|-?(?:\d\d*\.|)\d+(?:[eE][\-+]?\d+|)/g;
        
        data = data.replace(/(^\s*)|(\s*$)/g, "");

        try
        {
            if( window.JSON && window.JSON.parse )
            {
                responseReady = true;
                
                return obj( window.JSON.parse( data ) );
            }
            else
            {
                if( rvalidchars.test( data.replace( rvalidescape, "@" )
                                          .replace( rvalidtokens, "]" )
                                          .replace( rvalidbraces, ""  ) ) )
                {
                    responseReady = true;
                    
                    return obj( ( new Function( "return " + data ) )() );
                }
                else
                {
                    return responseErr( fn_res_err, callbackName, null, "parsererror", null );
                }
            }
        }
        catch(e)
        {
            return responseErr( fn_res_err, callbackName, null, "parsererror", null );
        }
    }
}

function responseErr( fn_res_err, callbackName, jqXHR, textStatus, errorThrown )
{
    try{
        delete window[ callbackName ];
    }catch(e){
        window[ callbackName ] = null;
    }
    
    clearInterval( kcp_obj_ajaxInterval );
    
    responseReady = true;
    
    fn_res_err( null, textStatus, null );
    
    return null;
}

function kcp_serialize( obj )
{
    var len = 0, retStr = '';

    for ( data in obj )
    {
        if( len > 0 )
        {
            retStr += ",";
        }
        
        retStr += "\"" + data + "\":\"" + obj[data] + "\"";
        len++;
    }
    
    retStr = '{' + retStr + '}';

    return retStr;
} 

function kcp_appScriptAlert( b_type )
{
    if( b_type == "C" )
    {
        /*var popup_obj = null;
        
        popup_obj = window.open("https://pay.kcp.co.kr/plugin_new/info/terms/chrom_https.html", "window", "width=420, height=400, scrollbars=yes");
        
        if( popup_obj == null )
        {
            alert( "팝업 차단을 해지해주세요.\n( 팝업내용 대로 진행하셔야 결제가 가능합니다. )" );
        }*/
        
        //alert( "APP 와 통신 실패. 결제 프로그램이 설치 또는 MixContent 해지( 크롬- URL 입력줄 우측 방패 모양 클릭 )" );
    }
    else if( b_type == "E" )
    {
        //alert( "APP 와 통신 실패. 하단의 [모든 콘텐츠 표시]를 눌러주세요" );
    }
    else if( b_type == "F" )
    {
        var popup_obj = null;
        
        popup_obj = window.open("https://pay.kcp.co.kr/plugin_new/info/terms/firefox_https.html", "window", "width=440, height=620, scrollbars=no");
        
        if( popup_obj == null )
        {
            alert( "팝업 차단을 해지해주세요.\n( 팝업내용 대로 진행하셔야 결제가 가능합니다. )" );
        }
        
        //alert( "APP 와 통신 실패. 결제 프로그램이 설치 또는 MixContent 해지( 파이어폭스 - URL 입력줄 좌측 방패 모양 클릭 )" );
    }
}

function ajax_server_data__resJson( data, url, server_status, fn_res, fn_res_err )
{
    if( responseReady )
    {
        var scriptURL = url + "?" + data;
        
        responseReady = false;
        
        AjaxRequestJsonp( scriptURL, fn_res, fn_res_err );
    }
    else
    {
        fn_res_err( null, "timeWait", null );
    }
}