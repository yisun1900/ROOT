<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String xh=null;
String dj=null;
String bzdj=null;
String sl=null;
String bz=null;

String wjjbm=null;
String mmsbsbm=null;
String xinghao=null;
String xinghao1=null;


String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yddbh,xh,dj,bzdj,sl,bz,wjjbm,mmsbsbm,xinghao ";
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
		bzdj=cf.fillNull(rs.getString("bzdj"));
		sl=cf.fillNull(rs.getString("sl"));
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
      <div align="center">调整合同价格 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveTjJc_wjjddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">预订单编号</font></div>              </td>
              <td width="33%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>              </td>
              <td width="17%"> 
                <div align="right"></div>              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">五金类别</td>
              <td width="33%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getWjjbm(insertform)">
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm where wjjbm='"+wjjbm+"'",wjjbm);
%> 
                </select>              </td>
              <td width="17%" align="right">锁把手</td>
              <td width="33%"> 
                <select name="mmsbsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getBm()">
                  <%
	cf.selectItem(out,"select mmsbsbm,mmsbsmc||':'||bm from jdm_mmsbsbm where mmsbsbm='"+mmsbsbm+"'",mmsbsbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">五金件</td>
              <td colspan="3"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:510PX" onChange="getDj(insertform)">
                  <%
	cf.selectItem(out,"select xh,wjmc||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.wjjbm='"+wjjbm+"' and xh="+xh,xh);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="<%=xinghao%>" size="71" maxlength="50" readonly>
                <input type="hidden" name="xinghao1" value="<%=xinghao1%>" size="20" maxlength="30" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">订购数量</td>
              <td><input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" readonly></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><b>客户单价</b></td>
              <td width="33%"><input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" ></td>
              <td width="17%" align="right"><font color="#0000CC">标准单价</font> </td>
              <td width="33%"><input type="text" name="bzdj" size="20" maxlength="9"  value="<%=bzdj%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
            <tr> 
              <td width="17%" height="2">&nbsp;                </td>
              <td width="33%" height="2" align="right">                <input type="button"  value="保存" onClick="f_do(insertform)">                </td>
              <td width="17%" height="2">&nbsp;                </td>
              <td width="33%" height="2"> 
                <input type="reset"  value="重输">              </td>
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


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[客户单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "客户单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
