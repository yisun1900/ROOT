<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String hth1=(String) session.getAttribute("hth");
String khbh=(String) session.getAttribute("khbh");

String yzbm=null;
String dqbm=null;

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String qtdh=null;
String czhm=null;

String email=null;


String ysrbm=null;
String nlqjbm=null;
String zybm="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ysrbm,email,khxm,xb,fwdz,lxfs,qtdh,zybm,czhm,nlqjbm,bz,yzbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (hth='"+hth1+"' and khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	//out.print(ls_sql);
	if (rs.next())
	{
		
		khxm=cf.fillNull(rs.getString("khxm"));
		yzbm=cf.fillNull(rs.getString("yzbm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		email=cf.fillNull(rs.getString("email"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zybm =cf.fillNull(rs.getString("zybm"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		
		czhm=cf.fillNull(rs.getString("czhm"));
	}
	rs.close();
	ps.close();
	
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<LINK REL="stylesheet" HREF="../css/stype.css" TYPE="text/css">
<link href="../css/h-g.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0">
<TABLE WIDTH=981 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD colspan="2"><table width="1004" height="66" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23"><img src="../images/top01.jpg" width="23" height="66"></td>
          <td width="190"><img src="../images/logo.jpg" width="190" height="66"></td>
          <td width="574" bgcolor="#F0EBE7">&nbsp;</td>
          <td width="217" valign="top" bgcolor="#F0EBE7"> <table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="145">&nbsp;</td>
              </tr>
              <tr>
                <td height="21"><a href="http://www.yz-china.com"><img src="../images/jitwzh.jpg" width="83" height="16" border="0"></a></td>
              </tr>
          </table></td>
        </tr>
      </table>      </TD>
  </TR>
  <TR> 
    <TD width="23"> </TD>
    <TD width="981" height="8" bgcolor="#FFFFFF"><img src="../images/005.jpg" width=981 height=4 alt=""></TD>
  </TR>
 
</TABLE>
<TABLE WIDTH=1001 height="614" BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		
    <TD COLSPAN=3> <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="1004"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="981" height="28">
            <param name="movie" value="../flash/daohangt.swf">
            <param name="quality" value="high">
            <embed src="../flash/daohangt.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="981" height="28"></embed>
          </object></td>
        </tr>
      </table></TD>
	</TR>
	<TR>
		
    <TD width="24" height="586" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
		
    <TD width="243" valign="top" background="../images/index_3-2.jpg"> 
      <table width="243" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="153" valign="top">
<table width="242" height="580" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <TD width="242" height="585" valign="top" background="../images/index_3-2.jpg"> 
      <div align="center"><img src="../images/zuoce.jpg" width="240" height="580" border="0" usemap="#Map"> </div></TD>
              </tr>
            </table> </td>
        </tr>
      </table>
      <div align="center"> </div></TD>
		
    <TD width="737" valign="top"><table width="100%" height="585" border="0" cellpadding="0" cellspacing="0" background="../images/zhongj.jpg">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> <div align="left"><img src="../images/b001.gif" width="342" height="40"></div></td>
        </tr>
        <tr> 
          <td valign="top"> <table width="98%" height="429" border="0" align="center">
              <tr> 
                <td height="425" valign="top"><span class="h-g"><br>
                  </span>
                  <form method="post" action="" name="editform" >
                    <table width="76%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#EFEFEF"  style="FONT-SIZE: 12px;border-collapse:collapse" >
                      <tr> 
                        <td height="28" colspan="2" align="right" bgcolor="#CCCCCC"> 
                          <div align="right">　</div>
                          <div align="right"> </div>
                        </td>
                      </tr>
                      <tr> 
                        <td width="30%" height="30" bgcolor="#F6F6F6"> 
                          <div align="right">客户姓名:</div>
                        </td>
                        <td width="70%" bgcolor="#FFFFFF"> 
                          <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 150px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                          <font color="#FF0033">*</font> 
                          <div align="right"></div>
                        </td>
                      </tr>
                      <tr> 
                        <td height="26" align="right" bgcolor="#F6F6F6">性别:</td>
                        <td bgcolor="#FFFFFF"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> <font color="#FF0033">*</font> </td>
                      </tr>
                      <tr> 
                        <td width="30%" height="25" align="right" bgcolor="#F6F6F6">手机号码:</td>
                        <td bgcolor="#FFFFFF"> 
                          <input type="text" name="lxfs" size="40" maxlength="50"  value="<%=lxfs%>" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 280px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                          <font color="#FF0033">*</font> </td>
                      </tr>
                      <tr>
                        <td height="33" align="right" bgcolor="#F6F6F6">其它电话:</td>
                        <td bgcolor="#FFFFFF">
                          <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 280px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                        </td>
                      </tr>
                      <tr> 
                        <td height="33" align="right" bgcolor="#F6F6F6">电子邮件:</td>
                        <td bgcolor="#FFFFFF"> 
                          <input type="text" name="email" size="40" maxlength="50"  value="<%=email%>" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 280px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                        </td>
                      </tr>
                      <tr> 
                        <td height="33" align="right" bgcolor="#F6F6F6"><font color="#0000CC">房屋地址（不可改）</font>:</td>
                        <td bgcolor="#FFFFFF"> 
                          <input type="text" name="fwdz" readonly size="40" maxlength="100"  value="<%=fwdz%>" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 280px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                          <font color="#FF0033">*</font></td>
                      </tr>
                      <tr> 
                        <td height="33" align="right" bgcolor="#F6F6F6">邮政编码:</td>
                        <td bgcolor="#FFFFFF"> 
                          <input type="text" name="yzbm" size="20" maxlength="6" value="<%=yzbm%>"  style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 150px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                        </td>
                      </tr>
                      <tr> 
                        <td height="33" align="right" bgcolor="#F6F6F6">传真号码;</td>
                        <td bgcolor="#FFFFFF"> 
                          <input type="text" name="czhm" size="20" maxlength="30"  value="<%=czhm%>" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 150px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 18px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal">
                        </td>
                      </tr>
                      <tr> 
                        <td height="23"> 
                          <div align="center"> </div>
                        </td>
                        <td height="23"> 
                          <div align="left"></div>
                          <table width="60%" height="25" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td>
                                <div align="center"> <img src="../images/queren.gif" width="39" height="25" onClick="f_do(editform)"></div>
                              </td>
                              <td><img src="../images/REG.gif" width="39" height="25" onClick="editform.reset()"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </form>
                  <span class="h-g"> </span></td>
              </tr>
            </table>
            <br></td>
        </tr>
      </table> </TD>
    </TR>
</TABLE>
<table width="1004" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="23" height="27" background="../ERP/khhdpt/images/top_6-1.jpg">&nbsp;</td>
    <td width="981" bgcolor="#000000"><table width="981" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td background="../images/03.jpg"><div align="center"><script language="JavaScript">
function dohome(){
this.home.style.behavior='url(#default#homepage)';this.home.setHomePage('http://www.yz-china.com/');}var focusok=false;

if (navigator.appName == "Netscape")
{focusok=true;}
vers=navigator.appVersion;

if (navigator.appName == "Microsoft Internet Explorer"){
 pos=vers.lastIndexOf('.'); 
 vers=vers.substring(pos-1,vers.length);}
proper_version=parseFloat(vers); 

if(proper_version>=5){
	focusok=true;}

function launchstock(){
if(focusok){
	stock.focus();}
 return true;}
</script>
              <span class="style1"><a href="#" name="home" class="style2" onClick="dohome();">设为首页</a> 
              |<span class="style2"> <A href="javascript:window.external.AddFavorite('http://www.yz-china.com/',%20'松下亿达装饰网')" target=_self>加入收藏</A> 
              | <a href="../ERP/lxwm/index.asp">联系我们</a> 
              | <a href="../ERP/link/index.asp" class="down-h-g">友情链接</a> </span>          </span></div></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="73" background="images/down_1.jpg">&nbsp;</td>
    <td bgcolor="#F0EBE7"><div align="center"> 
        <p class="down style1 style2">Copyright @ 2005 yz-china.com, YuanZhou Decoration.All 
          Rights Reserved<br>
          版权所有 松下亿达网 友情链接/设计 QQ：5580751 装修信息互动QQ：28834204<br>
          <strong>E-mail:</strong> yuanzhouqihuabu@163.com 咨询电话：010-64200739<br>
		  <a href="http://www.miibeian.gov.cn" class="style1">京ICP备05021813号</a> </div></td>
  </tr>
</table>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(!(isNumber(FormName.yzbm, "邮政编码"))) {
		return false;
	}
	
	var str='khxm='+escape(escape(FormName.khxm.value))+'&xb='+getRadio(FormName.xb)+'&lxfs='+escape(escape(FormName.lxfs.value))+'&qtdh='+escape(escape(FormName.qtdh.value))+'&fwdz='+escape(escape(FormName.fwdz.value));
	str+='&czhm='+escape(escape(FormName.czhm.value))+'&email='+escape(escape(FormName.email.value))+'&yzbm='+escape(escape(FormName.yzbm.value));
	winOpen('Savekhxx.jsp?'+str,'300','150','_back','no')	
	return true;
}
function winOpen(url,width,hight,fs,he)
{
	window.open(url,width,hight,fs,he);
}

//-->
</SCRIPT>
