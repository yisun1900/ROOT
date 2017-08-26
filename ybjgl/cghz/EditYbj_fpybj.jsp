<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqbh=null;
String fpr=null;
String fpsj=null;
String khbh=null;
String cgmyd=null;
String sbyy=null;
String cgkh=null;
String cgdz=null;
String ybjkh=null;
String ybjdz=null;
String wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ybj_fpybj.sqbh,fpr,fpsj,ybj_fpybj.khbh,cgmyd,sbyy,a.khxm cgkh,a.fwdz cgdz,b.khxm ybjkh,b.fwdz ybjdz";
	ls_sql+=" from  ybj_fpybj,ybj_cgsq,crm_khxx a,crm_khxx b";
	ls_sql+=" where  ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
	ls_sql+=" and ybj_cgsq.khbh=a.khbh and ybj_fpybj.khbh=b.khbh and sfyqd='Y'";
	ls_sql+=" and (ybj_fpybj.sqbh="+wheresqbh+") and  (ybj_fpybj.khbh='"+wherekhbh+"')  ";

    ls_sql+=" union ";
	
	ls_sql+=" select ybj_fpybj.sqbh,fpr,fpsj,ybj_fpybj.khbh,cgmyd,sbyy,a.khxm cgkh,a.fwdz cgdz,b.khxm ybjkh,b.fwdz ybjdz";
	ls_sql+=" from  ybj_fpybj,ybj_cgsq,crm_zxkhxx a,crm_khxx b";
	ls_sql+=" where  ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
	ls_sql+=" and ybj_cgsq.khbh=a.khbh and ybj_fpybj.khbh=b.khbh and sfyqd='N'";
	ls_sql+=" and (ybj_fpybj.sqbh="+wheresqbh+") and  (ybj_fpybj.khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sqbh=cf.fillNull(rs.getString("sqbh"));
		fpr=cf.fillNull(rs.getString("fpr"));
		fpsj=cf.fillNull(rs.getDate("fpsj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cgmyd=cf.fillNull(rs.getString("cgmyd"));
		sbyy=cf.fillNull(rs.getString("sbyy"));
		cgkh=cf.fillNull(rs.getString("cgkh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		ybjkh=cf.fillNull(rs.getString("ybjkh"));
		ybjdz=cf.fillNull(rs.getString("ybjdz"));
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
<title>样板间参观回执单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 样板间参观回执单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditYbj_fpybj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">申请编号</font></div>
              </td>
              <td width="35%"> <%=sqbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">申请客户</font></div>
              </td>
              <td width="35%"> <%=cgkh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">申请人地址</font></td>
              <td colspan="3"> <%=cgdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">分配人</font></td>
              <td width="35%"> <%=fpr%> </td>
              <td width="15%" align="right"><font color="#0000CC">分配时间</font></td>
              <td width="35%"> <%=fpsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">样板间编号</font></div>
              </td>
              <td width="35%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">样板间客户</font></div>
              </td>
              <td width="35%"> <%=ybjkh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">样板间地址</font></td>
              <td colspan="3"> <%=ybjdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">参观满意度</div>
              </td>
              <td width="35%"> 
                <select name="cgmyd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+满意&N+不满意",cgmyd);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">失败原因</td>
              <td colspan="3"> 
                <textarea name="sbyy" cols="55" rows="3"><%=sbyy%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheresqbh"  value="<%=wheresqbh%>" >
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
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
	if(	javaTrim(FormName.cgmyd)=="") {
		alert("请输入[参观满意度]！");
		FormName.cgmyd.focus();
		return false;
	}
	if (FormName.cgmyd.value=='N')
	{
		if(	javaTrim(FormName.sbyy)=="") {
			alert("请输入[失败原因]！");
			FormName.sbyy.focus();
			return false;
		}
	}
	else{
		FormName.sbyy.value="";
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
