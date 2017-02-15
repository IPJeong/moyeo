/*** Default spin options ***/
var spinObj          = null;
var spinContainer    = null;
var maskContainer    = null;
var spinOpts         = {
    lines:     12       , // The number of lines to draw
    length:    33       , // The length of each line
    width:     20       , // The line thickness
    radius:    55       , // The radius of the inner circle
    scale:     0.25     , // Scales overall size of the spinner
    corners:   1.0      , // Corner roundness (0..1)
    rotate:    30       , // The rotation offset
    direction: 1        , // 1: clockwise, -1: counterclockwise
    opacity:   0.5      , // Opacity of the lines
    color:     '#9a9a9a', // #rgb or #rrggbb or array of colors
    speed:     1.0      , // Rounds per second
    trail:     100      , // Afterglow percentage
    shadow:    false    , // Whether to render a shadow
    hwaccel:   false    , // Whether to use hardware acceleration
    className: 'spinner', // The CSS class to assign to the spinner
    zIndex:    2e9      , // The z-index (defaults to 2000000000)
    top:       '50%'    , // Top position relative to parent in px
    left:      '50%'      // Left position relative to parent in px
};

function kcp_spinStart()
{
    maskContainer = document.getElementById( "kcp_mask" );
    
    try
    {
        spinContainer = document.getElementById( "kcp_progress" );
        spinObj       = new Spinner(spinOpts).spin(spinContainer);
    }
    catch(e){}
    
    maskContainer.style.height  = getDocHeight() + "px";
    maskContainer.style.display = "";
    
    if(window.attachEvent) {
        window.attachEvent('onresize', fnResizePage);
    }
    else if(window.addEventListener) {
        window.addEventListener('resize', fnResizePage, true);
    }
}

function kcp_spinStop()
{
    spinContainer.innerHTML     = "";
    maskContainer.style.display = "none";
    
    if(window.detachEvent) {
        window.detachEvent('onresize', fnResizePage);
    }
    else if(window.removeEventListener) {
        window.removeEventListener('resize', fnResizePage);
    }
}

function fnResizePage()
{
    maskContainer.style.height = getDocHeight() + "px";
}
/*** Default spin options ***/

function getDocHeight() // 스크롤 포함한 높이값 가지고 오기
{
    var D = document;
    
    return Math.max(
        Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
        Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
        Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
} 
/*********************************************************************************************************************/
/** 랜덤 문자열 생성 *************************************************************************************************/
/*********************************************************************************************************************/
function RndStr()
{
    this.str     = '';
    this.pattern = /^[a-zA-Z0-9]+$/;

    this.setStr  = function(n)
    {
        if(!/^[0-9]+$/.test(n)) n = 0x10;

        this.str = '';

        for(var i=0; i<n-1; i++)
        {
            this.rndchar();
        }
    }

    this.setType  = function(s)
    {
        switch(s)
        {
            case    '1'  : this.pattern = /^[0-9]+$/;      break;
            case    'A'  : this.pattern = /^[A-Z]+$/;      break;
            case    'a'  : this.pattern = /^[a-z]+$/;      break;
            case    'A1' : this.pattern = /^[A-Z0-9]+$/;   break;
            case    'a1' : this.pattern = /^[a-z0-9]+$/;   break;
            default      : this.pattern = /^[a-zA-Z0-9]+$/;
        }
    }

    this.getStr  = function()
    {
        return this.str;
    }

    this.rndchar = function()
    {
        var rnd = Math.round( Math.random() * 1000 );

        if( !this.pattern.test( String.fromCharCode(rnd) ) )
        {
            this.rndchar();
        }
        else
        {
            this.str += String.fromCharCode(rnd);
        }
    }
}
/*********************************************************************************************************************/

/*********************************************************************************************************************/
/** 쿠키  ************************************************************************************************************/
/*********************************************************************************************************************/


function getCookie( name )
{
    var nameOfCookie = name + "=";
    var x            = 0;
    
    while ( x <= document.cookie.length )
    {
        var y = (x+nameOfCookie.length);
        
        if ( document.cookie.substring( x, y ) == nameOfCookie )
        {
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
            {
                endOfCookie = document.cookie.length;
            }

            return unescape( document.cookie.substring( y, endOfCookie ) );
        }
        
        x = document.cookie.indexOf( " ", x ) + 1;
        
        if ( x == 0 )
        {
            break;
        }
    }
    
    return "";
}

function setCookie( name, value,expire )
{
    var todayDate = new Date(); //현재시간 구하고
    
    todayDate.setDate( todayDate.getTime() + expire ); // 기간 설정하고
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";  //쿠키 설정값   
}

var KCP_Base64 = {
    // private property
    _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
 
    // public method for encoding
    encode : function (input) {
        var output = "";
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
        var i = 0;
 
        input = KCP_Base64._utf8_encode(input);
 
        while (i < input.length) {
 
            chr1 = input.charCodeAt(i++);
            chr2 = input.charCodeAt(i++);
            chr3 = input.charCodeAt(i++);
 
            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;
 
            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }
 
            output = output +
            this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
            this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
 
        }
 
        return output;
    },
 
    // public method for decoding
    decode : function (input) {
        var output = "";
        var chr1, chr2, chr3;
        var enc1, enc2, enc3, enc4;
        var i = 0;
 
        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
 
        while (i < input.length) {
 
            enc1 = this._keyStr.indexOf(input.charAt(i++));
            enc2 = this._keyStr.indexOf(input.charAt(i++));
            enc3 = this._keyStr.indexOf(input.charAt(i++));
            enc4 = this._keyStr.indexOf(input.charAt(i++));
 
            chr1 = (enc1 << 2) | (enc2 >> 4);
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
            chr3 = ((enc3 & 3) << 6) | enc4;
 
            output = output + String.fromCharCode(chr1);
 
            if (enc3 != 64) {
                output = output + String.fromCharCode(chr2);
            }
            if (enc4 != 64) {
                output = output + String.fromCharCode(chr3);
            }
 
        }
 
        output = KCP_Base64._utf8_decode(output);
 
        return output;
 
    },
 
    // private method for UTF-8 encoding
    _utf8_encode : function (string) {
        string = string.replace(/\r\n/g,"\n");
        var utftext = "";
 
        for (var n = 0; n < string.length; n++) {
 
            var c = string.charCodeAt(n);
 
            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
 
        }
 
        return utftext;
    },
 
    // private method for UTF-8 decoding
    _utf8_decode : function (utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;
 
        while ( i < utftext.length ) {
 
            c = utftext.charCodeAt(i);
 
            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i+1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i+1);
                c3 = utftext.charCodeAt(i+2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }
 
        }
 
        return string;
    }
 
}
/*********************************************************************************************************************/

/*********************************************************************************************************************/
/** 동적 js 파일 import **********************************************************************************************/
/*********************************************************************************************************************/
var scriptFileImport =
{
    load: function()
    {
        try
        {
            //동적추가
            var kcp_head      = document.getElementsByTagName( 'head' )[0];
            var kcp_script    = document.createElement( 'script' );
            var kcp_jQuerySrc = KCP_DOMAIN + arguments[0];
            
            kcp_script.type = 'text/javascript';
            kcp_script.src  = kcp_jQuerySrc;
            
            kcp_head.appendChild( kcp_script );
        }
        catch( e )
        {
            console.log('에러 (scriptFileImport) - ', e);
        }
    }
}
//scriptFileImport.load( "plugin/cross_hub/extends/comm_log.js"   );
/*********************************************************************************************************************/

/*********************************************************************************************************************/
/** 클라이언트 시간 구하기 **********************************************************************************************/
/*********************************************************************************************************************/
function kcp_getTimeStamp() {
	var d = new Date();

	var s =
        leadingZeros(d.getFullYear() , 4) +
        leadingZeros(d.getMonth() + 1, 2) +
        leadingZeros(d.getDate()     , 2) +

        leadingZeros(d.getHours()    , 2) +
        leadingZeros(d.getMinutes()  , 2) +
        leadingZeros(d.getSeconds()  , 2);

	return s;
}


function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	
	return zero + n;
}
/*********************************************************************************************************************/	