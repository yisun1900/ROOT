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
String khbh=request.getParameter("khbh");
String xjr=cf.GB2Uni(request.getParameter("ysr"));
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

int count=0;
//检查记录号
String jcjlh=null;

try {
	conn=cf.getConnection();

//检查记录号
	ls_sql="select NVL(max(substr(jcjlh,8,3)),0)";
	ls_sql+=" from  kp_gdrcjcjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jcjlh=khbh+cf.addZero(count+1,3);

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,crm_khxx.sgd,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

	if (xjr.equals(""))
	{
		xjr=zjxm;
	}


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

<div align="center">工地日常检查（记录号：<%=jcjlh%>）</div>

	<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">检查记录号</td>
	<td  width="5%">检查人</td>
	<td  width="5%">检查时间</td>
	<td  width="5%">检查类型</td>
	<td  width="5%">检查结果</td>
	<td  width="5%">审批标志</td>
	<td  width="5%">审批人</td>
	<td  width="5%">审批时间</td>
	<td  width="5%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="15%">备注</td>
	</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT kp_gdrcjcjl.jcjlh,kp_gdrcjcjl.jcr,kp_gdrcjcjl.jcsj,dm_rcjclxbm.rcjclxmc,dm_rcjcjgbm.rcjcjgmc, DECODE(kp_gdrcjcjl.spbz,'1','未审批','2','审批'),kp_gdrcjcjl.spr,kp_gdrcjcjl.spsj,kp_gdrcjcjl.lrr,kp_gdrcjcjl.lrsj,kp_gdrcjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,dm_rcjcjgbm,dm_rcjclxbm,kp_gdrcjcjl  ";
    ls_sql+=" where kp_gdrcjcjl.rcjcjgbm=dm_rcjcjgbm.rcjcjgbm(+) and kp_gdrcjcjl.rcjclxbm=dm_rcjclxbm.rcjclxbm(+) and kp_gdrcjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and kp_gdrcjcjl.khbh='"+khbh+"'";
    ls_sql+=" order by kp_gdrcjcjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jcjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_gdrcjcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jcjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%> 
</table>

<form method="post" action="" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#000099">实开工日期</font> </td>
    <td><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">房屋地址</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">设计师</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">施工队</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">质检姓名</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>检查人</td> 
  <td width="32%"><input type="text" name="jcr" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>检查时间</td> 
  <td width="32%"><input type="text" name="jcsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>检查类型</td> 
  <td width="32%"><select name="rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm","");
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>检查结果</td> 
  <td width="32%"><select name="rcjcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjcjgbm,rcjcjgmc from dm_rcjcjgbm order by rcjcjgbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="sgd" value="<%=sgd%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button"  value="批量录入" onClick="window.open('PlInserKp_rcjcmx.jsp?jcjlh=<%=jcjlh%>')" name="pllr" disabled>
	<input type="button"  value="上传照片" onClick="f_lrzp(insertform)" name="lrzp" disabled>
    <input type="button"  value="查看照片" onClick="f_ckzp(insertform)" name="ckzp" disabled>
<input type="reset"  value="重输" name="reset">      </td>
    </tr>
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jcr)=="") {
		alert("请输入[检查人]！");
		FormName.jcr.focus();
		return false;
	}
	if(	javaTrim(FormName.jcsj)=="") {
		alert("请输入[检查时间]！");
		FormName.jcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jcsj, "检查时间"))) {
		return false;
	}
	if(	javaTrim(FormName.rcjclxbm)=="") {
		alert("请选择[检查类型]！");
		FormName.rcjclxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcjgbm)=="") {
		alert("请选择[检查结果]！");
		FormName.rcjcjgbm.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入单位]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.pllr.disabled=false;
	FormName.lrzp.disabled=false;
	FormName.ckzp.disabled=false;

	FormName.action="SaveInsertKp_gdrcjcjl.jsp";
	FormName.submit();
	return true;
}

function f_lrzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
