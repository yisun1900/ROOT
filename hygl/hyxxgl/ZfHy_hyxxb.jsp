<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hybh=null;
String sfzf=null;
String hyxm=null;
String xb=null;
String yzbm=null;
String hydz=null;
String dh=null;
String sj=null;
String dwbh=null;
String rhrq=null;
String yxrq=null;
String hykh=null;
String hyjb=null;
String fwlx=null;
String wherehybh=cf.GB2Uni(request.getParameter("hybh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hybh,sfzf,hyxm,xb,yzbm,hydz,dh,sj,dwbh,rhrq,yxrq,hykh,hyjb,fwlx ";
	ls_sql+=" from  hy_hyxxb";
	ls_sql+=" where  (hybh='"+wherehybh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hybh=cf.fillNull(rs.getString("hybh"));
		sfzf=cf.fillNull(rs.getString("sfzf"));
		hyxm=cf.fillNull(rs.getString("hyxm"));
		xb=cf.fillNull(rs.getString("xb"));
		yzbm=cf.fillNull(rs.getString("yzbm"));
		hydz=cf.fillNull(rs.getString("hydz"));
		dh=cf.fillNull(rs.getString("dh"));
		sj=cf.fillNull(rs.getString("sj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		rhrq=cf.fillNull(rs.getDate("rhrq"));
		yxrq=cf.fillNull(rs.getDate("yxrq"));
		hykh=cf.fillNull(rs.getString("hykh"));
		hyjb=cf.fillNull(rs.getString("hyjb"));
		fwlx=cf.fillNull(rs.getString("fwlx"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveZfHy_hyxxb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">会员编号</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hybh" size="20" maxlength="10"  value="<%=hybh%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">所属专卖店</font></div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">会员姓名</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hyxm" size="20" maxlength="50"  value="<%=hyxm%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">性别</font></div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">邮政编码</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="yzbm" size="20" maxlength="12"  value="<%=yzbm%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">会员地址</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hydz" size="20" maxlength="200"  value="<%=hydz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">电话</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="dh" size="20" maxlength="50"  value="<%=dh%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">手机</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" size="20" maxlength="20"  value="<%=sj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">会员级别</font></div>
              </td>
              <td width="35%"> 
                <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb where hyjbbh='"+hyjb+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">服务类型</font></div>
              </td>
              <td width="35%"> 
                <select name="fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"1+基本服务&2+增值服务",fwlx,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">水质分析卡号</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" size="20" maxlength="10"  value="<%=hykh%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">入会日期</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="rhrq" size="20" maxlength="10"  value="<%=rhrq%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="15%" align="right">是否作废</td>
              <td width="35%"> 
                <select name="sfzf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+作废&N+未作废",sfzf);
%> 
                </select>
              </td>
              <td width="15%" align="right">有效日期</td>
              <td width="35%"> 
                <input type="text" name="yxrq" size="20" maxlength="10"  value="<%=yxrq%>" >
              </td>
            </tr>
            <input type="hidden" name="wherehybh"  value="<%=wherehybh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sfzf)=="") {
		alert("请选择[是否作废]！");
		FormName.sfzf.focus();
		return false;
	}
	if(	javaTrim(FormName.yxrq)=="") {
		alert("请输入[有效日期]！");
		FormName.yxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxrq, "有效日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
