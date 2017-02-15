/* KCP 전자 지불(payplus) Script */
var sv_service_ver   = "1,0,0,2";
var sv_plugin_ver    = "1,0,0,6";
var sv_status        = "0";
var sv_url           = "127.0.0.1";//"127.0.0.1"
var sv_port          = "24241";
var sv_port_extend   = "24252";
var sv_port_org      = "24241";
var sv_port_check    = 0;
var sv_chr29         = String.fromCharCode(29);
var sv_chr28         = String.fromCharCode(28);

var lc_response_cnt  = 0;
var lc_interval      = null;
var lc_form          = null;

var tx_sync          = true;
var install_check    = false;
var confirm_flag     = true;

var RAND_KEY_CHECK   = null;
var ALERT_OBJ_BACKUP = null;

var m_site_cd        = "";
var SSL_CHECK        = "";

var sync_check = false;

Payplus = document.Payplus = { object:true };

function GetPluginObject()
{
    return true;
}

function GetInstallFile()
{
    return "javascript: console.log('EXE 방식 변경으로 해당 기능 함수명 변경 GetInstallFile_EXE()');";
}

function GetInstallFile_EXE()
{
/*    if( GetSitecd() )
        return KCP_DOMAIN + "plugin_new/file/KCPPaymentPluginSetup.exe?site_cd=" + m_site_cd + "&EX=N";
    else*/
    if((KCP_NUA.indexOf('MSIE 9.0') > 0) || ((KCP_NUA.indexOf('Firefox') > 0) && KCP_PROTOCOL == "http:") || ( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 ))
    {
        return KCP_DOMAIN + "plugin_new/file/KCPPaymentPluginSetup.exe";
    }
    else
    {
        return KCP_DOMAIN + "plugin_new/file/k5/KCPPaymentPluginSetup.exe";
    }
}

function ajaxResponse( resData )
{
    tx_sync = true;

    if( sv_status == 0 )
    {
        serverInstallCheck( resData );
    }
    else if( sv_status == 1 )
    {
        RAND_KEY_CHECK = resData.RAND_KEY_CHECK;
        serverOrderResponse( resData );
    }
    else if( sv_status == 2 )
    {
        serverCertResponse( resData );
    }
}

function ajaxAppInstallResponseErr( jqXHR, textStatus, errorThrown )
{
    tx_sync = true;
    //alert( "jqXHR.status=" + jqXHR.status + "," + "textStatus=" + textStatus + "," + "errorThrown=" + errorThrown );
    //alert( "textStatus=" + textStatus );

    if( textStatus == "timeout" || textStatus == "parsererror" )
    {
        if(sv_port_check == 0)
        {
            sv_port = sv_port_extend;

            StartSmartUpdate();

            sv_port_check = 1;
        }
        else
        {
            if( navigator.appName != "Microsoft Internet Explorer" && KCP_NUA.indexOf("Trident") > -1 )
            {
                if (eng_flag_check())
                    window.open("https://testpay.kcp.co.kr/plugin_new/info/terms/exe_korean.html", "window", "width=545, height=620, scrollbars=no");
                    //alert("통합결제창 EXE버전 플러그인이 설치되어 있지 않습니다. 플러그인을 설치 해주세요.\n(KCP Payment EXE Plugin is not installed. Please install the plugin.)");
                else
                    window.open("https://testpay.kcp.co.kr/plugin_new/info/terms/exe_english.html", "window", "width=545, height=620, scrollbars=no");
                    //alert("KCP Payment EXE Plugin is not installed. Please install the plugin.");
            }

            document.location.href = GetInstallFile_EXE();

            sv_port       = sv_port_org;
            sv_port_check = 0;

            kcp_spinStop();

            return false;
        }
    }
}

function ajaxOrderResponseErr( jqXHR, textStatus, errorThrown )
{
    tx_sync = true;

    if( textStatus == "timeout" || textStatus == "parsererror" )
    {
        if( lc_response_cnt == 0 )
        {
            lc_response_cnt++;

            KCP_Pay_Execute( lc_form );
        }
        else
        {
            lc_response_cnt = 0;
//            alert( "결제창 호출에 실패했습니다." );

            try{
                if (eng_flag_check())
                {
                    m_Completepayment( eval( "({\"res_cd\":\"3042\",\"res_msg\":\"결제 프로그램 미설치.설치후 진행해주세요.\"})" ), function(){});
                }
                else
                {
                    m_Completepayment( eval( "({\"res_cd\":\"3042\",\"res_msg\":\"Payment Programs are not installed, please proceed after installation.\"})" ), function(){});
                }
            }
            catch(e)
            {
                try{
                    if (eng_flag_check())
                    {
                        lc_form.res_cd.value = "3042";
                        lc_form.res_msg.value = "결제 프로그램 미설치.설치후 진행해주세요.";
                    }
                    else
                    {
                        lc_form.res_cd.value = "3042";
                        lc_form.res_msg.value = "Payment Programs are not installed, please proceed after installation.";
                    }
                }
                catch(e){}
            }

             kcp_spinStop();
        }
    }

}

function serverInstallCheck( resData )
{
    kcp_spinStop();

    if( resData.sv_status == "9" )
    {
        if( navigator.appName != "Microsoft Internet Explorer" && KCP_NUA.indexOf("Trident") > -1 )
        {
            if (eng_flag_check())
                window.open("https://testpay.kcp.co.kr/plugin_new/info/terms/exe_korean.html", "window", "width=440, height=620, scrollbars=no");
                //alert("통합결제창 EXE버전 플러그인이 설치되어 있지 않습니다. 플러그인을 설치 해주세요.\n(KCP Payment EXE Plugin is not installed. Please install the plugin.)");
            else
                window.open("https://testpay.kcp.co.kr/plugin_new/info/terms/exe_english.html", "window", "width=440, height=620, scrollbars=no");
                //alert("KCP Payment EXE Plugin is not installed. Please install the plugin.");
        }
        document.location.href = GetInstallFile_EXE();
        return false;
    }
    else
    {
        sv_status = resData.sv_status;
    }
    //alert(sv_status);
}

function serverOrderResponse( resData )
{
    if( resData.sv_status == "7" )
    {
        KCP_Pay_Execute( lc_form );
    }
    else if( resData.sv_status == "8" )
    {
        if (eng_flag_check())
            alert( "응용프로그램에 문제가 있어 프로그램 재설치 바랍니다." );
        else
            alert( "There is an issue with the application program. Please reinstall the program." );

        document.location.href = GetInstallFile_EXE();

        //sv_status = "0";
    }
    else if( resData.sv_status == "2" )
    {
        sv_status = resData.sv_status;

        serverCertDataCheck();
    }
}

function serverCertDataCheck()
{
    lc_interval = setInterval( "appData()", 3000 );
}

function appData()
{
    var data = "sv_status=" + sv_status;

    if( sv_status == 0 || sv_status == 1 )
    {
        if (eng_flag_check())
            alert( "프로그램을 실행 할수 없습니다." );
        else
            alert("Can not execute the program.");

        return;
    }

    if( tx_sync )
    {
        tx_sync = false;

        if( ALERT_OBJ_BACKUP != null )
        {
            window["alert"]  = ALERT_OBJ_BACKUP;
            ALERT_OBJ_BACKUP = null;
        }
        if((KCP_NUA.indexOf('MSIE 9.0') > 0) || ((KCP_NUA.indexOf('Firefox') > 0) && KCP_PROTOCOL == "http:") || ( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 ))
        {
            SSL_CHECK = "http://";
        }
        else
        {
            SSL_CHECK = "https://";
        }
        ajax_server_data__resJson( data, SSL_CHECK + sv_url + ":" + sv_port, sv_status, ajaxResponse, ajaxCertResponseErr );
    }

    return;
}

function ajaxCertResponseErr( jqXHR, textStatus, errorThrown )
{
    tx_sync = true;

    //alert( "jqXHR.status=" + jqXHR.status + "," + "textStatus=" + textStatus + "," + "errorThrown=" + errorThrown );
}

function serverCertResponse( resData )
{
    if( resData.sv_status == "6" )
    {
    }
    else if( resData.sv_status == "3" )
    {
        sv_status = resData.sv_status;

        clearInterval( lc_interval );

        if( RAND_KEY_CHECK == resData.RAND_KEY )// && ORDR_KEY_CHECK == resData.ORDR_KEY
        {
            if( confirm_flag )
            {
                try
                {
                    m_Completepayment(resData, function(){});
                }
                catch(e)
                {
                    GetField( lc_form, resData );
                    lc_form.submit();
                }
            }
        }
        else
        {
            if (eng_flag_check())
                alert("결제창과 세션연결이 잘못되었거나 원활하지 않습니다. 인터넷익스플로러를 다시 실행해 주세요.");
            else
                alert("Bad connection between the payment window and session. Please restart Internet Explore.");
        }

        kcp_spinStop();
    }
    else if( resData.sv_status == "9" )
    {
        clearInterval( lc_interval );
        //alert("사용자가 결제를 취소하였습니다.");

        try{
            if (eng_flag_check())
            {
                m_Completepayment( eval( "({\"res_cd\":\"3001\",\"res_msg\":\"사용자 취소\"})" ), function(){});
            }
            else
            {
                m_Completepayment( eval( "({\"res_cd\":\"3001\",\"res_msg\":\"User cancellation\"})" ), function(){});
            }
        }
        catch(e)
        {
            try{
                if (eng_flag_check())
                {
                    lc_form.res_cd.value = "3001";
                    lc_form.res_msg.value = "사용자취소";
                }
                else
                {
                    lc_form.res_cd.value = "3001";
                    lc_form.res_msg.value = "User cancellation";
                }

            }
            catch(e){}
        }

        kcp_spinStop();

        try{ // 나인걸 예외처리...
            root_url = window["org_M_url"];
        }catch(e){}
    }
}

function StartSmartUpdate() // 기존과 호환성을 위해 유지
{
    kcpTx_install();
}

function kcpTx_install()
{
    setTimeout( function(){
        if( ChkBrowserType() == "C" ||
            ChkBrowserType() == "E" ||
            ChkBrowserType() == "F" ||
            ChkBrowserType() == "O" ||
            KCP_EXE_FO_Use
            )
        {
		    if ((KCP_NUA.indexOf('Mac') > -1))
            {
                if (eng_flag_check())
                {
                    alert("KCP 결제 플러그인은 Mac OS에서는 지원되지 않습니다.");
                }
                else
                {
                    alert("KCP plugin in the Mac OS can not be used.");
                }
                return;
            }
			
            var data = "sv_status="      + sv_status      + "&" +
                       "sv_service_ver=" + sv_service_ver + "&" +
                       "sv_plugin_ver="  + sv_plugin_ver;

            kcp_spinStart();

            //alert("http://" + sv_url + ":" + sv_port +"/" +data );

            if( tx_sync )
            {
                tx_sync       = false;
                install_check = true;

                if((KCP_NUA.indexOf('MSIE 9.0') > 0) || ((KCP_NUA.indexOf('Firefox') > 0) && KCP_PROTOCOL == "http:") || ( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 ))
                {
                    SSL_CHECK = "http://";
                }
                else
                {
                    SSL_CHECK = "https://";
                }

                ajax_server_data__resJson( data, SSL_CHECK + sv_url + ":" + sv_port, sv_status, ajaxResponse, ajaxAppInstallResponseErr );
            }
        }
    }, 10 );
}

function MakePayMessage() // 기존과 호환성을 위해 유지
{
    sync_check = true;
    
    if(arguments[0].site_cd.value == "S5693")
    {
        alert("크롬45에서는 결제를 진행할 수 없습니다. 다른 브라우저를 이용해주세요.");
        return false;
    }
    return KCP_Pay_Execute( arguments[0] );
}

function KCP_Pay_Execute( payform )
{
    if( ChkBrowserType() == "C" ||
        ChkBrowserType() == "E" ||
        ChkBrowserType() == "F" ||
        ChkBrowserType() == "O" ||
        KCP_EXE_FO_Use
        )
    {
        try
        {
            lc_form = payform;

            if( !install_check )
            {
                if( sv_status == 0 )
                {
                    if (eng_flag_check())
                        alert( "프로그램 설치가 필요 합니다." );
                    else
                        alert("The program installation is required.");

                    StartSmartUpdate();
                    return false;
                }
            }
            else
            {
                sv_status = 1;
            }

            var data = "";

            data += "sv_status=" + sv_status;
            data += SetField_EXE( payform );
            data += "&charset=" + CHARSET;
            data += "&kcp_app_hangul=한국사이버결제"; // "&" + $( "form[name=" + payform.name + "]" ).serialize();

            if( tx_sync )
            {
                try{ clearInterval( lc_interval ); }catch(e){}

                if( ALERT_OBJ_BACKUP != null ) {
                    ALERT_OBJ_BACKUP = window["alert"];
                    window["alert"]  = function(tmp){console.log(tmp);};
                }

                tx_sync = false;

                if((KCP_NUA.indexOf('MSIE 9.0') > 0) || ((KCP_NUA.indexOf('Firefox') > 0) && KCP_PROTOCOL == "http:") || ( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 ))
                {
                    SSL_CHECK = "http://";
                }
                else
                {
                    SSL_CHECK = "https://";
                }
                ajax_server_data__resJson( data, SSL_CHECK + sv_url + ":" + sv_port, sv_status, ajaxResponse, ajaxOrderResponseErr );

                kcp_spinStart();
            }
        }catch(e){alert(e);}
    }

    if( ( typeof( m_Completepayment ) != "function" || sync_check ) && lc_response_cnt == 0 )
    {
        if( confirm( "결제창 연결 중입니다." + "\n" +
                     "결제창에서 [결제요청] 버튼을 선택하신 후" + "\n" +
                     "반드시 아래 “확인” 버튼을 선택해주세요." + "\n" +
                     "(Connecting to payment window..."+ "\n" +
                     "On the payment window, Please select [payment request] button"+ "\n" +
                     "Then, select [confirm] button on the bottom.)" ) )
        {
            lc_form.onsubmit = function(){ return false };

            try{ // 나인걸 예외처리...
                window["org_M_url"] = root_url;
                root_url = "KCP";
            }catch(e){}

            if( location.href.indexOf( "musinsa.com" ) > -1 )
            {
                setInterval( function(){ try{ openwin.close(); }catch(e){} }, 1000 );
            }

            throw( "EXE 예외처리로 인한 업무로직 강제 중단" );
        }
        else
        {
            try{
                if (eng_flag_check())
                {
                    lc_form.res_cd.value = "3001";
                    lc_form.res_msg.value = "사용자 취소";
                }
                else
                {
                    lc_form.res_cd.value = "3001";
                    lc_form.res_msg.value = "User cancellation";
                }
            }
            catch(e){}

            return confirm_flag = false;
        }
    }
}

function GetField( payform, plugin )
{
    var nField = payform.elements.length;

    for( var idx = 0; idx < nField; idx++ )
    {
        try
        {
            if( payform.elements[idx].name == "account"      || payform.elements[idx].name == "cash_yn"              ||
                payform.elements[idx].name == "ally_code"    || payform.elements[idx].name == "depositor"            ||
                payform.elements[idx].name == "app_no"       || payform.elements[idx].name == "enc_data"             ||
                payform.elements[idx].name == "app_time"     || payform.elements[idx].name == "enc_info"             ||
                payform.elements[idx].name == "bank_code"    || payform.elements[idx].name == "epnt_issu"            ||
                payform.elements[idx].name == "bank_issu"    || payform.elements[idx].name == "escw_yn"              ||
                payform.elements[idx].name == "bank_name"    || payform.elements[idx].name == "gift_issu"            ||
                payform.elements[idx].name == "bankcode"     || payform.elements[idx].name == "isp_card_cd"          ||
                payform.elements[idx].name == "bankname"     || payform.elements[idx].name == "noinf"                ||
                payform.elements[idx].name == "buyr_mail"    || payform.elements[idx].name == "quota"                ||
                payform.elements[idx].name == "buyr_name"    || payform.elements[idx].name == "res_cd"               ||
                payform.elements[idx].name == "buyr_tel1"    || payform.elements[idx].name == "res_msg"              ||
                payform.elements[idx].name == "buyr_tel2"    || payform.elements[idx].name == "ret_cash_batchkey"    ||
                payform.elements[idx].name == "card_cd"      || payform.elements[idx].name == "ret_cash_batchkey_yn" ||
                payform.elements[idx].name == "card_mask_no" || payform.elements[idx].name == "ret_pay_method"       ||
                payform.elements[idx].name == "card_name"    || payform.elements[idx].name == "save_applied_yn"      ||
                payform.elements[idx].name == "cash_authno"  || payform.elements[idx].name == "tno"                  ||
                payform.elements[idx].name == "cash_id_info" || payform.elements[idx].name == "trace_no"             ||
                payform.elements[idx].name == "cash_tr_code" || payform.elements[idx].name == "tran_cd"              ||
                payform.elements[idx].name == "cash_tsdtime" || payform.elements[idx].name == "use_pay_method"       ||
                payform.elements[idx].name == "ret_cms_cert" || payform.elements[idx].name == "ordr_chk"             ||
                payform.elements[idx].name == "ret_soc_no"
            )
            {
                if( eval( "plugin." + payform.elements[idx].name ) != undefined )
                {
                    if( eval( "plugin." + payform.elements[idx].name ) != "" )
                    {
                        payform.elements[idx].value = eval( "plugin." + payform.elements[idx].name );
                    }
                }
            }
        }
        catch(e){alert(e);}
    }

  return true;
}

//Set Merchant Payment Field
function SetField_EXE( payform )
{
    var vTemp     = "";
    var nField    = payform.elements.length;

    var cfg_data  = "";
    var pay_data  = "";
    var ordr_data = "";
    var escw_data = "";
    var rcvr_data = "";

    if((KCP_NUA.indexOf('MSIE 9.0') > 0) || ((KCP_NUA.indexOf('Firefox') > 0) && KCP_PROTOCOL == "http:") || ( KCP_NUA.indexOf( "Safari" ) > -1 && KCP_NUA.indexOf( "Version" ) > -1 ))
    {
        cfg_data  = "&cfg_data" + sv_chr28;
        pay_data  = "&pay_data" + sv_chr28;
        ordr_data = "&ordr_data" + sv_chr28;
        escw_data = "&escw_data" + sv_chr28;
        rcvr_data = "&rcvr_data" + sv_chr28;        
    }
    else
    {
        cfg_data  = "&&&cfg_data" + sv_chr28;
        pay_data  = "&&&pay_data" + sv_chr28;
        ordr_data = "&&&ordr_data" + sv_chr28;
        escw_data = "&&&escw_data" + sv_chr28;
        rcvr_data = "&&&rcvr_data" + sv_chr28;      
    }

    for( var idx = 0; idx < nField; idx++ )
    {
        // 가맹점 정보
        if( payform.elements[idx].name == "site_cd"                || payform.elements[idx].name == "site_logo"          ||
            payform.elements[idx].name == "site_name"              || payform.elements[idx].name == "pay_method"         ||
            payform.elements[idx].name == "payment_hide"           || payform.elements[idx].name == "spay_use_yn"        ||
            payform.elements[idx].name == "spay_user_id"           || payform.elements[idx].name == "spay_reqType"       ||
            payform.elements[idx].name == "spay_ss_useyn"          || payform.elements[idx].name == "spay_proc_cd"       ||
            payform.elements[idx].name == "spay_join_cd_SS"        || payform.elements[idx].name == "spay_join_cd_DI"    ||
            payform.elements[idx].name == "spay_join_cd_LO"        || payform.elements[idx].name == "spay_join_cd_BC"    ||
            payform.elements[idx].name == "spay_join_cd"           || payform.elements[idx].name == "spay_card_cd"       ||
            payform.elements[idx].name == "KVP_EMB_KEY"            || payform.elements[idx].name == "HS_API_URL"         ||
            payform.elements[idx].name == "module_type"            || payform.elements[idx].name == "auth_flag_check"    ||
            payform.elements[idx].name == "soc_no"                 ||
            payform.elements[idx].name == "kcp_noint"              || payform.elements[idx].name == "kcp_noint_quota"    ||
            payform.elements[idx].name == "quotaopt"               || payform.elements[idx].name == "quotaopt_add_YN"    ||
            payform.elements[idx].name == "quotaopt_add"           || payform.elements[idx].name == "fix_inst"           ||
            payform.elements[idx].name == "not_used_card"          || payform.elements[idx].name == "save_ocb"           ||
            payform.elements[idx].name == "save_ocb_method"        || payform.elements[idx].name == "disp_tax_yn"        ||
            payform.elements[idx].name == "wish_vbank_list"        || payform.elements[idx].name == "vcnt_expire_term"   ||
            payform.elements[idx].name == "vcnt_expire_term_time"  || payform.elements[idx].name == "vcnt_type"          ||
            payform.elements[idx].name == "vcnt_info"              || payform.elements[idx].name == "complex_pnt_yn"     ||
            payform.elements[idx].name == "vcnt_uniq_key"          || payform.elements[idx].name == "pt_memcorp_cd"      ||
            payform.elements[idx].name == "pay_code"               || payform.elements[idx].name == "batch_agree_url"    ||
            payform.elements[idx].name == "kcpgroup_id"            || payform.elements[idx].name == "rtn_key_info_yn"    ||
            payform.elements[idx].name == "batch_agree_yn"         || payform.elements[idx].name == "batch_birth_day_yn" ||
            payform.elements[idx].name == "batch_cardno_return_yn" || payform.elements[idx].name == "disable_buyr_name"  ||
            payform.elements[idx].name == "confirm_type"           || payform.elements[idx].name == "comm_tax_mny"       ||
            payform.elements[idx].name == "disable_mail"           || payform.elements[idx].name == "comm_vat_mny"       ||
            payform.elements[idx].name == "tax_flag"               || payform.elements[idx].name == "eng_flag"           ||
            payform.elements[idx].name == "comm_free_mny"          || payform.elements[idx].name == "pcms_user_id"       ||
            payform.elements[idx].name == "kcp_user_policy"        || payform.elements[idx].name == "pcbang_id"          ||
            payform.elements[idx].name == "chg_flag"               || payform.elements[idx].name == "acqu_gubn"          ||
            payform.elements[idx].name == "pcms_site_cd"           || payform.elements[idx].name == "corp_taxno"         ||
            payform.elements[idx].name == "pcms_mny"               || payform.elements[idx].name == "corp_tel1"          ||
            payform.elements[idx].name == "corp_name"              || payform.elements[idx].name == "corp_mail"          ||
            payform.elements[idx].name == "corp_owner"             || payform.elements[idx].name == "cp_gubn"            ||
            payform.elements[idx].name == "corp_tel2"              || payform.elements[idx].name == "quota"              ||
            payform.elements[idx].name == "comment"                || payform.elements[idx].name == "hp_apply_yn"        ||
            payform.elements[idx].name == "idn"                    || payform.elements[idx].name == "join_shop_cd"       ||
            payform.elements[idx].name == "coupon_apply_yn"        || payform.elements[idx].name == "site_img"           ||
            payform.elements[idx].name == "hp_commid"              || payform.elements[idx].name == "used_card_YN"       ||
            payform.elements[idx].name == "join_shop_data"         || payform.elements[idx].name == "coupon_site_yn"     ||
            payform.elements[idx].name == "cert_info"              || payform.elements[idx].name == "used_card_CCXX"     ||
            payform.elements[idx].name == "used_card"              || payform.elements[idx].name == "batch_soc_choice"   ||
            payform.elements[idx].name == "card_return_opt"        || payform.elements[idx].name == "batch_soc_brtd"     ||
            payform.elements[idx].name == "batch_soc"              || payform.elements[idx].name == "point_cd"           ||
            payform.elements[idx].name == "batch_soc_brtd_YN"      || payform.elements[idx].name == "join_sitecd"        ||
            payform.elements[idx].name == "card_point"             || payform.elements[idx].name == "auth_soc_no"        ||
            payform.elements[idx].name == "join_cd"                || payform.elements[idx].name == "corp_tax_type"      ||
            payform.elements[idx].name == "acnt_soc_no"            || payform.elements[idx].name == "corp_sell_tax_no"   ||
            payform.elements[idx].name == "corp_type"              || payform.elements[idx].name == "corp_owner_nm"      ||
            payform.elements[idx].name == "corp_tax_no"            || payform.elements[idx].name == "corp_telno"         ||
            payform.elements[idx].name == "corp_nm"                || payform.elements[idx].name == "amt_tot"            ||
            payform.elements[idx].name == "corp_addr"              || payform.elements[idx].name == "amt_svc"            ||
            payform.elements[idx].name == "trad_time"              || payform.elements[idx].name == "cash_soc_yn"        ||
            payform.elements[idx].name == "amt_sup"                || payform.elements[idx].name == "cash_method_type"   ||
            payform.elements[idx].name == "amt_tax"                || payform.elements[idx].name == "cash_user_id"       ||
            payform.elements[idx].name == "cash_batch_type"        || payform.elements[idx].name == "ally_type"          ||
            payform.elements[idx].name == "cash_group_id"          || payform.elements[idx].name == "tk_disc_mny"        ||
            payform.elements[idx].name == "cash_batchkey"          || payform.elements[idx].name == "graphic_id"         ||
            payform.elements[idx].name == "tk_pay_cnt"             || payform.elements[idx].name == "cmpl_use_appcard"   ||
            payform.elements[idx].name == "used_bank"              || payform.elements[idx].name == "spnt_mny"           ||
            payform.elements[idx].name == "term_skip"              || payform.elements[idx].name == "fix_corp"           ||
            payform.elements[idx].name == "spnt_grade"             || payform.elements[idx].name == "payco_direct"       ||
            payform.elements[idx].name == "hash_cert"
            )

        {
            if( payform.elements[idx].value != "" )
            {
                pay_data += ( payform.elements[idx].name + "^^^" + payform.elements[idx].value + sv_chr29 );
            }
        }

        if( payform.elements[idx].name == "currency" )
        {
            if ( payform.currency.value == "WON" || payform.currency.value == "410" )
            {
                pay_data += ( "currency" + "^^^" + "410" + sv_chr29 );
            }
            else if ( payform.currency.value == "USD" || payform.currency.value == "840" )
            {
                pay_data += ( "currency" + "^^^" + "840" + sv_chr29 );
            }
        }

        if ( payform.elements[idx].name == "pay_mod" )
        {
            pay_data += ( "escw_mode" + "^^^" + payform.elements[idx].value + sv_chr29 );
        }

        if ( payform.elements[idx].name == "vcnt_return_val" )
        {
            pay_data += ( "vcnt_rt_val" + "^^^" + payform.elements[idx].value + sv_chr29 );
        }

        if( payform.elements[idx].name == "card_cert_type" || payform.elements[idx].name == "keyin" )
        {
            if( payform.elements[idx].name == "card_cert_type" )
            {
                  if( payform.card_cert_type.value == "KEYIN" )
                  {
                      pay_data += ( "card_cert_type" + "^^^" + "SALE" + sv_chr29 );
                  }
                else
                {
                    pay_data += ( "card_cert_type" + "^^^" + payform.card_cert_type.value + sv_chr29 );
                }
            }
            else
            {
                if( payform.keyin.value == "KEYIN" )
                {
                    pay_data += ( "card_cert_type" + "^^^" + "SALE" + sv_chr29 );
                }
                else
                {
                    pay_data += ( "card_cert_type" + "^^^" + payform.keyin.value + sv_chr29 );
                }
            }
        }

        if( payform.elements[idx].name == "ordr_idxx"    || payform.elements[idx].name == "good_expr"    ||
            payform.elements[idx].name == "good_cd"      || payform.elements[idx].name == "good_mny"     ||
            payform.elements[idx].name == "tk_shop_id"   || payform.elements[idx].name == "shop_user_id" ||
            payform.elements[idx].name == "buyr_tel1"    || payform.elements[idx].name == "buyr_tel2"    ||
            payform.elements[idx].name == "buyr_mail"    || payform.elements[idx].name == "buyr_hp"      ||
            payform.elements[idx].name == "buyr_hp_corp" || payform.elements[idx].name == "buyr_soc_no"  ||
            payform.elements[idx].name == "hp_auto_set"  || payform.elements[idx].name == "enc_mny"         )
        {
            if( payform.elements[idx].name == "good_mny" )
            {
                if( payform.good_mny.value > 2100000000 )
                {
                    return false;
                }
            }
            else if( payform.elements[idx].name == "ordr_idxx" )
            {
                ORDR_KEY_CHECK = payform.elements[idx].value;
            }

            ordr_data += ( payform.elements[idx].name + "^^^" + payform.elements[idx].value + sv_chr29 );
        }

        if( payform.elements[idx].name == "good_name" )
        {
            vTemp = payform.good_name.value;
            vTemp = ( vTemp.length > 201 )? vTemp.substr(0, 199):vTemp;
            vTemp = vTemp.replace("&", "");
            vTemp = vTemp.replace(":", "");
            vTemp = vTemp.replace(";", "");
            vTemp = vTemp.replace("?", "");

            ordr_data += ( payform.elements[idx].name + "^^^" + vTemp + sv_chr29 );
        }

        if( payform.elements[idx].name == "buyr_name" )
        {
            vTemp = payform.buyr_name.value;

            if(vTemp.length > 50)
            {
                vTemp      = vTemp.substr(0, 50);
                ordr_data += ( payform.elements[idx].name + "^^^" + vTemp + sv_chr29 );
            }
            else
            {
                ordr_data += ( payform.elements[idx].name + "^^^" + payform.buyr_name.value + sv_chr29 );
            }
        }

        if( payform.elements[idx].name == "bask_cntx" || payform.elements[idx].name == "good_info" ||
            payform.elements[idx].name == "buyr_zipx" || payform.elements[idx].name == "buyr_add1" ||
            payform.elements[idx].name == "buyr_add2" || payform.elements[idx].name == "deli_term"    )
        {
            escw_data += ( payform.elements[idx].name + "^^^" + payform.elements[idx].value + sv_chr29 );
        }

        if( payform.elements[idx].name == "rcvr_name" || payform.elements[idx].name == "rcvr_tel1" ||
            payform.elements[idx].name == "rcvr_tel2" || payform.elements[idx].name == "rcvr_mail" ||
            payform.elements[idx].name == "rcvr_zipx" || payform.elements[idx].name == "rcvr_add1" ||
            payform.elements[idx].name == "rcvr_add2" || payform.elements[idx].name == "rcvr_date" ||
            payform.elements[idx].name == "rqst_msgx"                                                 )
        {
            rcvr_data += ( payform.elements[idx].name + "^^^" + payform.elements[idx].value + sv_chr29 );
        }

        if( payform.elements[idx].name == "skin_indx" )
        {
            cfg_data += ( payform.elements[idx].name + "^^^" + payform.skin_indx.value + sv_chr29 );
        }
    }

    pay_data += ( "cp_domain" + "^^^" + String(document.location) + sv_chr29 );
    cfg_data += ( "hash_check"  + "^^^" + "N"              + sv_chr29 );
    cfg_data += ( "new_check"   + "^^^" + "Y"              + sv_chr29 );
    cfg_data += ( "real_check"  + "^^^" + REAL_CHECK       + sv_chr29 );
    cfg_data += ( "send_log  "  + "^^^" + "N"              + sv_chr29 );
    cfg_data += ( "ie_check"    + "^^^" + ChkBrowserType() + sv_chr29 );
    cfg_data += ( "browser_ver" + "^^^" + ChkBrowserVer()  + sv_chr29 );
    cfg_data += ( "exe_check"   + "^^^" + KCP_EXE_FO_Use   + sv_chr29 );
    cfg_data += ( "plugin_type" + "^^^" + "E"              + sv_chr29 );

    return "&encode_data^" + KCP_Base64.encode( cfg_data + pay_data + ordr_data + escw_data + rcvr_data );
}
/*
function GetSitecd()
{
    try
    {
        for ( var i = 0 ; i < document.forms.length ; i++)
        {
            if (document.forms[i].site_cd.value != "")
            {
                m_site_cd = document.forms[i].site_cd.value;
                return true;
            }

        }
        return false;
    }
    catch (e)
    {
        return false;
    }
}
*/

/*******************************************************************************************************************************************/
/** eng_flag 확인 스크립트 *****************************************************************************************************************/
/*******************************************************************************************************************************************/

function eng_flag_check()
{
    try
    {
        for ( var i = 0 ; i < lc_form.length ; i++)
        {
            if (lc_form.eng_flag.value == "Y")
            {
                return false;
            }

        }
        return true;
    }
    catch (e)
    {
        return true;
    }

}
/*******************************************************************************************************************************************/
/** eng_flag 확인 스크립트 *****************************************************************************************************************/
/*******************************************************************************************************************************************/