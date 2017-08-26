<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String xh=null;
String bzdj=null;
String dj=null;
String sl=null;
String bz=null;

String wjjbm=null;
String mmsbsbm=null;
String xinghao=null;
String xinghao1=null;


String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yddbh,xh,bzdj,dj,sl,bz,wjjbm,mmsbsbm,xinghao ";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  lrxh="+lrxh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		xh=cf.fillNull(rs.getString("xh"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		bz=cf.fillNull(rs.getString("bz"));

		wjjbm=cf.fillNull(rs.getString("wjjbm"));
		mmsbsbm=cf.fillNull(rs.getString("mmsbsbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select xinghao";
	ls_sql+=" from  jc_wjjbj";
	ls_sql+=" where  xh="+xh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xinghao1=cf.fillNull(rs.getString("xinghao"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请修改五金订单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_wjjddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">预订单编号</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">五金类别</td>
              <td width="33%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getWjjbm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm",wjjbm);
%> 
                </select>
              </td>
              <td width="17%" align="right">锁把手</td>
              <td width="33%"> 
                <select name="mmsbsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getBm()">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmsbsbm,mmsbsmc||':'||bm from jdm_mmsbsbm order by mmsbsbm",mmsbsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">五金件</td>
              <td colspan="3"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:510PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,wjmc||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.wjjbm='"+wjjbm+"' and jc_wjjbj.dqbm='"+dqbm+"' order by xh",xh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="<%=xinghao%>" size="71" maxlength="50" >
                <input type="hidden" name="xinghao1" value="<%=xinghao1%>" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">标准单价</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=bzdj%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                </div>
              </td>
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getWjjbm(FormName)
{
	FormName.mmsbsbm.value="";
	FormName.dj.value="";
	FormName.sl.value="";

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&wjjbm="+FormName.wjjbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}
function getDj(FormName)
{

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&xh="+FormName.xh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getBm()//参数FormName:Form的名称
{
	if ((insertform.mmsbsbm.value!="") && (insertform.xinghao1.value.indexOf("**")!=-1))
	{
		insertform.xinghao.value=replace(insertform.xinghao1.value,"**",getSubStr(insertform.mmsbsbm));
	}
	else{
		insertform.xinghao.value=insertform.xinghao1.value;
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请选择[五金件序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "五金件序号"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "订购数量"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("错误！[数量]必须大于0！");
		FormName.sl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
