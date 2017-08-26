<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//考评记录号
String kpjlh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(kpjlh,6,4)),0)";
	ls_sql+=" from  kp_pdkpjl";
	ls_sql+=" where  fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	kpjlh=ssfgs+cf.addZero(count+1,4);

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">施工队派单考评记录（<font color="#0000CC">考评记录号：<%=kpjlh%></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%" bgcolor="#FFFFFF"><font color="#FF0000">*</font>分公司</td>
      <td width="32%"> 
        <input type="hidden" name="kpjlh" value="<%=kpjlh%>" size="20" maxlength="9" readonly>
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>派单时可选施工队数</td>
      <td width="29%"> 
        <input type="text" name="kxsgds" value="10" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>考评起始时间</td>
      <td width="32%"> 
		<input type="text" name="qssj" value="<%=cf.addMonth(-3)%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>考评截止时间</td>
      <td width="29%"> 
        <input type="text" name="jzsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#FF0000">*</font>非直属队派单总额</td>
      <td width="32%"> 
        <input type="text" name="sgdpdze" value="2573" size="20" maxlength="17" >
        万 </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>直属队派单总额</td>
      <td width="29%"> 
        <input type="text" name="zsdpdze" value="1000" size="20" maxlength="17" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
		<input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="29%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2"></textarea>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="8" height="21"><b>非直属队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>A级队</b></td>
      <td height="26" colspan="2" bgcolor="#FFFFCC"><b>B级队</b></td>
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>C级队</b></td>
      <td colspan="2" height="26" bgcolor="#FFFFCC"><b>D级队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajqz" value="58" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjqz" value="31" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjqz" value="11" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djqz" value="0" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdjde" value="7.4" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdjde" value="4" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdjde" value="1.4" size="8" maxlength="17" >
        万 </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdjde" size="8" maxlength="17" value="0" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajddbl" value="60" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjddbl" size="8" maxlength="9" value="40" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjddbl" value="0" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djddbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdbl" value="30" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdbl" value="40" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdbl" value="30" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajxdbl" value="10" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjxdbl" value="20" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjxdbl" value="70" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djxdbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="24" colspan="8" align="center"><b>直属队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajqz" value="60" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjqz" value="40" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjqz" value="0" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjqz" value="0" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdjde" value="23" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdjde" value="15" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdjde" value="0" size="8" maxlength="17" >
        万 </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdjde" size="8" maxlength="17" value="0" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajddbl" value="60" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjddbl" value="40" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjddbl" value="0" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjddbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdbl" value="30" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdbl" value="40" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdbl" value="0" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajxdbl" value="10" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjxdbl" value="20" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjxdbl" value="0" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjxdbl" value="0" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr> 
      <td colspan="8" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
        <input type="button"  value="导入－人工评分" onClick="f_dr(insertform)" name="dr" disabled>
        <input type="button"  value="录入－人工评分" onClick="f_lr(insertform)" name="lr" disabled>
        <input type="button"  value="开始考评" onClick="f_kp(insertform)" name="kp" disabled>
        <input type="button"  value="查看考评" onClick="f_ckkp(insertform)" name="ck" disabled>
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
<%
if (count>0)
{
	%>
	<BR>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">记录号</td>
	<td  width="11%">分公司</td>
	<td  width="10%">起始时间</td>
	<td  width="10%">截止时间</td>
	<td  width="11%">非直属派单额</td>
	<td  width="11%">直属队派单额</td>
	<td  width="7%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="21%">备注</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT kpjlh,dwmc,qssj,jzsj,sgdpdze,zsdpdze,lrr,lrsj,kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where (kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+))";
	ls_sql+=" and  fgsbh='"+ssfgs+"'";
    ls_sql+=" order by kpjlh desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.kxsgds)=="") {
		alert("请输入[派单时可选施工队数]！");
		FormName.kxsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.kxsgds, "派单时可选施工队数"))) {
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}

	if(	javaTrim(FormName.sgdpdze)=="") {
		alert("请输入[非直属队派单总额]！");
		FormName.sgdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdpdze, "非直属队派单总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdpdze)=="") {
		alert("请输入[直属队派单总额]！");
		FormName.zsdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdpdze, "直属队派单总额"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}



	if(	javaTrim(FormName.ajqz)=="") {
		alert("请输入[A级队权重]！");
		FormName.ajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.ajqz, "A级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.bjqz)=="") {
		alert("请输入[B级队权重]！");
		FormName.bjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.bjqz, "B级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.cjqz)=="") {
		alert("请输入[C级队权重]！");
		FormName.cjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.cjqz, "C级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.djqz)=="") {
		alert("请输入[D级队权重]！");
		FormName.djqz.focus();
		return false;
	}
	if(!(isFloat(FormName.djqz, "D级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.ajddbl)=="") {
		alert("请输入[A级队接大单比例]！");
		FormName.ajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajddbl, "A级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdbl)=="") {
		alert("请输入[A级队接中单比例]！");
		FormName.ajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdbl, "A级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajxdbl)=="") {
		alert("请输入[A级队接小单比例]！");
		FormName.ajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajxdbl, "A级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjddbl)=="") {
		alert("请输入[B级队接大单比例]！");
		FormName.bjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjddbl, "B级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdbl)=="") {
		alert("请输入[B级队接中单比例]！");
		FormName.bjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdbl, "B级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjxdbl)=="") {
		alert("请输入[B级队接小单比例]！");
		FormName.bjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjxdbl, "B级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjddbl)=="") {
		alert("请输入[C级队接大单比例]！");
		FormName.cjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjddbl, "C级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdbl)=="") {
		alert("请输入[C级队接中单比例]！");
		FormName.cjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdbl, "C级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjxdbl)=="") {
		alert("请输入[C级队接小单比例]！");
		FormName.cjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjxdbl, "C级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djddbl)=="") {
		alert("请输入[D级队接大单比例]！");
		FormName.djddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djddbl, "D级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdbl)=="") {
		alert("请输入[D级队接中单比例]！");
		FormName.djzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdbl, "D级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djxdbl)=="") {
		alert("请输入[D级队接小单比例]！");
		FormName.djxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djxdbl, "D级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdjde)=="") {
		alert("请输入[A级队单组最大接单额]！");
		FormName.ajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdjde, "A级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdjde)=="") {
		alert("请输入[B级队单组最大接单额]！");
		FormName.bjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdjde, "B级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdjde)=="") {
		alert("请输入[C级队单组最大接单额]！");
		FormName.cjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdjde, "C级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdjde)=="") {
		alert("请输入[D级队单组最大接单额]！");
		FormName.djzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdjde, "D级队单组最大接单额"))) {
		return false;
	}



	if(	javaTrim(FormName.zsajqz)=="") {
		alert("请输入[直属A级队权重]！");
		FormName.zsajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajqz, "直属A级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjqz)=="") {
		alert("请输入[直属B级队权重]！");
		FormName.zsbjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjqz, "直属B级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjqz)=="") {
		alert("请输入[直属C级队权重]！");
		FormName.zscjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjqz, "直属C级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjqz)=="") {
		alert("请输入[直属D级队权重]！");
		FormName.zsdjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjqz, "直属D级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajddbl)=="") {
		alert("请输入[直属A级队接大单比例]！");
		FormName.zsajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajddbl, "直属A级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajzdbl)=="") {
		alert("请输入[直属A级队接中单比例]！");
		FormName.zsajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdbl, "直属A级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajxdbl)=="") {
		alert("请输入[直属A级队接小单比例]！");
		FormName.zsajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajxdbl, "直属A级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjddbl)=="") {
		alert("请输入[直属B级队接大单比例]！");
		FormName.zsbjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjddbl, "直属B级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdbl)=="") {
		alert("请输入[直属B级队接中单比例]！");
		FormName.zsbjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdbl, "直属B级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjxdbl)=="") {
		alert("请输入[直属B级队接小单比例]！");
		FormName.zsbjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjxdbl, "直属B级队接小单比例"))) {
		return false;
	}


	if(	javaTrim(FormName.zscjddbl)=="") {
		alert("请输入[直属C级队接大单比例]！");
		FormName.zscjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjddbl, "直属C级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdbl)=="") {
		alert("请输入[直属C级队接中单比例]！");
		FormName.zscjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdbl, "直属C级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjxdbl)=="") {
		alert("请输入[直属C级队接小单比例]！");
		FormName.zscjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjxdbl, "直属C级队接小单比例"))) {
		return false;
	}

	if(	javaTrim(FormName.zsdjddbl)=="") {
		alert("请输入[直属D级队接大单比例]！");
		FormName.zsdjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjddbl, "直属D级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdbl)=="") {
		alert("请输入[直属D级队接中单比例]！");
		FormName.zsdjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdbl, "直属D级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjxdbl)=="") {
		alert("请输入[直属D级队接小单比例]！");
		FormName.zsdjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjxdbl, "直属D级队接小单比例"))) {
		return false;
	}

	if(	javaTrim(FormName.zsajzdjde)=="") {
		alert("请输入[直属A级队单组最大接单额]！");
		FormName.zsajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdjde, "直属A级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdjde)=="") {
		alert("请输入[直属B级队单组最大接单额]！");
		FormName.zsbjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdjde, "直属B级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdjde)=="") {
		alert("请输入[直属C级队单组最大接单额]！");
		FormName.zscjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdjde, "直属C级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdjde)=="") {
		alert("请输入[直属D级队单组最大接单额]！");
		FormName.zsdjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdjde, "直属D级队单组最大接单额"))) {
		return false;
	}


	FormName.action="SaveInsertKp_pdkpjl.jsp";
	FormName.submit();
	FormName.dr.disabled=false;
	FormName.lr.disabled=false;
	FormName.kp.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="/sgdgl/rgkp/LoadData.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="/sgdgl/rgkp/InsertKp_pdkprgdf.jsp";
	FormName.submit();
	return true;
}

function f_kp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}

	FormName.action="tjkpjg.jsp";
	FormName.submit();
	return true;
}

function f_ckkp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="ViewKp_pdkpmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
