<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String xh=null;
String dj=null;
String sl=null;
String zjhsl=null;
String bz=null;

String wjjbm=null;
String mmsbsbm=null;
String xinghao=null;
String xinghao1=null;


String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yddbh,xh,dj,sl,zjhsl,bz,wjjbm,mmsbsbm,xinghao ";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  lrxh="+lrxh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		xh=cf.fillNull(rs.getString("xh"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		bz=cf.fillNull(rs.getString("bz"));

		wjjbm=cf.fillNull(rs.getString("wjjbm"));
		mmsbsbm=cf.fillNull(rs.getString("mmsbsbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
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
      <div align="center">请修改五金增减项明细（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditZjxJc_wjjddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">五金类别</td>
              <td width="32%"> <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm",wjjbm,true);
%> </td>
              <td width="19%" align="right">锁把手</td>
              <td width="31%"> <%
	cf.selectItem(out,"select mmsbsbm,mmsbsmc||':'||bm from jdm_mmsbsbm order by mmsbsbm",mmsbsbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">五金件</td>
              <td colspan="3"> <%
	cf.selectItem(out,"select xh,wjmc||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.wjjbm='"+wjjbm+"' order by xh",xh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">型号</td>
              <td width="32%"><%=xinghao%> 
                <input type="hidden" name="xinghao1" value="<%=xinghao1%>" size="20" maxlength="8" >              </td>
              <td width="19%" align="right"><font color="#0000CC">单价</font></td>
              <td width="31%"><%=dj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">增减后数量</div>              </td>
              <td width="32%"> 
                <input type="text" name="zjhsl" size="20" maxlength="8"  value="<%=zjhsl%>" >              </td>
              <td width="19%" align="right"><font color="#0000CC">合同数量</font></td>
              <td width="31%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" readonly>
               </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
                  <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                  <input type="hidden" name="yddbh" value="<%=yddbh%>">
                </div>              </td>
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

	var str="Jc_wjjbjCx.jsp?wjjbm="+FormName.wjjbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}
function getDj(FormName)
{

	var str="Jc_wjjbjCx.jsp?xh="+FormName.xh.value;
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
	if(	javaTrim(FormName.zjhsl)=="") {
		alert("请输入[增减后数量]！");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjhsl, "增减后数量"))) {
		return false;
	}

	if (parseFloat(FormName.zjhsl.value)<0)
	{
		alert("错误！[数量]不能小于0！");
		FormName.zjhsl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
