<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>
<%
session.setAttribute("flag","N");
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String hfbm=(String)session.getAttribute("dwbh");
String gethth=(String)session.getAttribute("hth");
String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String hflxbm=null;
String gcjdbm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;
double sfke=0;
int hfsl=0;
int cpsl=0;
String ssdw=null;
String khbh=null;
String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

int tssl=0;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	int count=0;
	//判断该客户是否完工或完结
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where gcjdbm in ('4','5') and (hth='"+gethth+"')  ";
	rs =stmt.executeQuery(ls_sql);	
	//out.print(ls_sql);
	if (rs.next())
	{
		
		count=rs.getInt(1);
		
	}
	rs.close();

	if(count==0)
	{	
		%>

	<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385">
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            <TD width="100%" height="27" bgcolor="#CCCCCC"><font size="2"><strong>【系统提示】</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">对不起，您的工程还没有完工，不能进行此操作！</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#CCCCCC">
<div align="center"> 
               <!--  <input type="submit"  value="确定"> -->
                <input type="button"  value="返回" onClick="window.history.back()">
              </div></TD>
          </TR>
		  </TABLE>
		  </TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>


		<%
			return;

	}


	

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<TABLE WIDTH=1004 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD> <IMG SRC="../images/top1_1-1.jpg" WIDTH=297 HEIGHT=5 ALT=""></TD>
  </TR>
  <TR> 
    <TD><table width="1004" height="66" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23"><img src="../images/top01.jpg" width="23" height="66"></td>
          <td width="190"><img src="../images/top1_2-1.jpg" width="190" height="66"></td>
          <td width="615"><div align="center"></div></td>
          <td width="176" valign="top"> <table width="124" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="49"><a href="http://www.yz-china.com" target="_blank"><img src="../images/top1_2-1_1.jpg" width="83" height="16" border="0"></a></td>
                <td width="65"><a href="http://www.yz-china.com/bbs/" target="_blank"><img src="../images/top1_2-1_2.jpg" width="86" height="16" border="0"></a></td>
              </tr>
            </table>
            <table width="174" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="17" valign="bottom"> <div align="center"><a href="http://www.yz-china.com/english/html/jieshao.html" target="_BLANK">英文版 
                    <strong>（English）</strong></a></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="../images/top1_3.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="25" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23" background="../images/top01-1.jpg"><table width="23" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="817" background="../images/top1_4-2.jpg" class="css"> <TABLE align=right border=0 width=639>
               <TBODY>
                <TR> 
                  <TD width=640> <DIV align=center class=css><a href="/khhdpt/khxx/HhxxIndex.jsp">我的资料</a> 
                      | <a href="/khhdpt/zytx/ZytxIndex.jsp">重要提醒</a> | <a href="/khhdpt/klzx/KlzxIndex.jsp">快乐装修</a> 
                      | <a href="/khhdpt/zxjz/ZxjzIndex.jsp">我家装修进展</a> | <a href="/khhdpt/gmjccp/khhdpt.html">购买集成产品</a> 
                      | <a href="/khhdpt/yhys/khhdpt.html">有话要说 </a>| <a href="/khhdpt/wgpj/WgpjIndex.jsp">完工评价</a> | <a href="/khhdpt/yjdc/YjdcIndex.jsp">客户调查</a> 
                      | <a href="/khhdpt/xgmm/XgmmIndex.jsp">修改密码</a> </DIV></TD>
                </TR>
              </TBODY>
            </TABLE></td>
          <td width="164" bgcolor="#000000" class="css"> <table width="164" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td><div align="center"></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="116" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="22" background="../images/top01-1.jpg"><table width="23" height="116" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="982" bgcolor="2E2E2E"> <img src="../images/top1_5-1.jpg" width="981" height="116"></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/top1_6.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
</TABLE>
<TABLE WIDTH=1001 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD COLSPAN=3> <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="16"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="652"><table width="817" height="27" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td bgcolor="#DFDFDF">&nbsp;</td>
              </tr>
            </table></td>
          <td width="336" bgcolor="#9A9A9A">&nbsp;</td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD width="23" height="863" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
    <TD valign="top"> <div align="center"> </div>
      <table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> <div align="center"><img src="../images/khpjb.jpg" width="519" height="229"></div></td>
        </tr>
        <tr> 
          <td valign="top"> <br> 
            <table width="85%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
              <tr  bgcolor="#F9F0C6"> 
                <td height="22" colspan="4" align="right"> 
                  <div align="left"><strong>[客户评价表] </strong></div></td>
              </tr>
              <form method="post" action="SaveInsertCRM_khxxPJ1.jsp" name="insertform" target="_blank">
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" height="85" align="right" bgcolor="#EEEEEE">【设计师】</td>
                  <td width="37%">设计方案： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%>
                    <br> <br>
                    后期服务： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%>
                    <br> <br>
                    交底清楚： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%>
                  </td>
                  <td width="14%" align="right">设计师评价内容</td>
                  <td width="36%"> <textarea name="sjshfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" height="81" align="right" bgcolor="#EEEEEE">【质检员】</td>
                  <td width="37%">服务： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%>
                    <br> <br>
                    到位： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%>
                    <br> <br>
                    尽责： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%>
                  </td>
                  <td width="14%" align="right">质检员评价内容</td>
                  <td width="36%"> <textarea name="zjyhfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" height="80" align="right" bgcolor="#EEEEEE">【施工队】</td>
                  <td width="37%">服务素质： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%>
                    <br> <br>
                    施工质量： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%>
                    <br> <br>
                    工人素质： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%>
                  </td>
                  <td width="14%" align="right">施工队评价内容</td>
                  <td width="36%"> <textarea name="sgdhfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" height="112" align="right" bgcolor="#EEEEEE">【集成家居】</td>
                  <td width="37%"> 家居设计师 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcjjsjs","");
%>
                    <br> <br>
                    家居顾问： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jsjjgw","");
%>
                    <br> <br>
                    项目专员： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcxmzy","");
%>
                    <br> <br>
                    送货安装： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcshaz","");
%>
                    <br> <br>
                    产品质量： 
                    <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jccpzl","");
%>
                  </td>
                  <td width="14%" align="right">集成家居评价内容</td>
                  <td width="36%"> <textarea name="jchfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
                  </td>
                </tr>
                <tr> </tr>
                <tr> 
                  <td width="13%" height="67" align="right" bgcolor="#EEEEEE">【总评】</td>
                  <td colspan="3" bgcolor="#FFFFFF"> <textarea name="bz" rows="3" cols="80" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 500px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea></td>
                </tr>
                <tr> 
                  <td height="37" colspan="4" align="center">
<table width="143" border="0" cellpadding="0" cellspacing="2">
                      <tr> 
                        <td><div align="center"><img src="../images/queren.gif" width="39" height="25" onClick="f_do(insertform)"></div></td>
                        <td><div align="center"><img src="../images/quxiao.gif" width="39" height="25" onClick="insertform.reset()"></div></td>
                      </tr>
                    </table> </td>
					 <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >   
					<input type="hidden" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="20" > 
                
              </form>
            </table></td>
        </tr>
      </table></TD>
    <TD width="79" bgcolor="#E4E4E4"> <table width="1" height="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="10" height="859" bgcolor="#E4E4E4">&nbsp;</td>
        </tr>
      </table>
      <img src="../images/index_5-1.jpg" width="82" height="4"></TD>
  </TR>
</TABLE>
<table width="1004" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="23" height="27" background="../images/top_6-1.jpg"><IMG SRC="../images/down_1.jpg" WIDTH=23 HEIGHT=23 ALT=""></td>
    <td width="981" bgcolor="#000000"><table width="981" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td><div align="center">
              <script language="JavaScript">
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
             <a href="http://www.yz-china.com/lxwm/index.asp" name="home" onclick="dohome();"><font color="#FFCC00">设为首页</font></a><font color="#FFCC00"> 
              |</font> <A href="javascript:window.external.AddFavorite('http://www.yz-china.com/',%20'松下亿达装饰网')" target=_self><font color="#FFCC00">加入收藏</font></A><font color="#FFCC00"> 
              |</font> <a href="http://www.yz-china.com/lxwm/index.asp" target="_blank"><font color="#FFCC00">联系我们</font></a> 
              <font color="#FFCC00">|</font> <a href="http://www.yz-china.com/link/index.asp"  target="_blank" class="down-h-g"><font color="#FFCC00">友情链接</font></a>  
            </div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="73" background="../images/down_1.jpg">&nbsp;</td>
    <td><div align="center"> 
        <p class="down">Copyright @ 2005 yz-china.com, YuanZhou Decoration.All 
          Rights Reserved<br>
          版权所有 松下亿达网 友情链接/设计 QQ：5580751 装修信息互动QQ：28834204<br>
          <strong>E-mail:</strong> yuanzhouqihuabu@163.com 咨询电话：010-64200739<br>
          <a href="http://www.miibeian.gov.cn">京ICP备05021813号</a> </div></td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.sjshfnr)=="") {
		alert("请输入相关意见！");
		FormName.sjshfnr.focus();
		return false;
	}
	if(	javaTrim(FormName.zjyhfnr)=="") {
		alert("请输入相关意见！");
		FormName.zjyhfnr.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdhfnr)=="") {
		alert("请输入相关意见！");
		FormName.sgdhfnr.focus();
		return false;
	}
	if(	javaTrim(FormName.jchfnr)=="") {
		alert("请输入相关意见！");
		FormName.jchfnr.focus();
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入相关意见！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	//FormName.action="SaveInsertCRM_khxxPJ1.jsp";
	return true;
}




//-->
</SCRIPT>